#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt"
         "func-env-expval.rkt"
         "store-model.rkt")

(provide value-of/k
         end-cont)


(define value-of/k
  (lambda (exp env cont)
    (cond
      [(primitive? exp)
       (eval-primitive exp env cont)]
      [(arithmetic? exp)
       (eval-arithmetic exp env cont)]
      [(syntax? exp)
       (eval-syntax exp env cont)])))


(define eval-primitive
  (lambda (exp env cont)
    (cases primitive exp
      [num-exp
       (num)
       (apply-cont cont (num-val num))]
      [bool-exp
       (bool)
       (apply-cont cont (bool-val bool))]
      [func-exp
       (parameters body)
       (apply-cont cont (func-val (func parameters body env)))])))


(define eval-arithmetic
  (lambda (exp env cont)
    (cases arithmetic exp
      [equ?-exp
       (exp1 exp2)
       (value-of/k exp1 env (equ?-cont '() (list exp2) env cont))]
      [add-exp
       (exps)
       (let ([a (length exps)])
         (if (= a 0)
             (apply-cont cont (num-val 0))
             (value-of/k (car exps) env
                         (add-cont '() (cdr exps) env cont))))]
      [sub-exp
       (exps)
       (let ([a (length exps)])
         (if (< a 1)
             (eopl:error 'sub-exp args-count-error "at least 1" a)
             (value-of/k (car exps) env
                         (sub-cont '() (cdr exps) env cont))))])))


(define eval-syntax
  (lambda (exp env cont)
    (cases syntax exp
      [var-exp
       (var)
       (apply-cont cont (deref (apply-env env var)))]
      [set-exp
       (var exp)
       (value-of/k exp env
                   (set-rhs-cont (apply-env env var) cont))]
      [call-exp
       (rator rands)
       (value-of/k rator env
                   (call-cont '() rands env cont))]
      [if-exp
       (exp1 exp2 exp3)
       (value-of/k exp1 env
                   (if-cont exp2 exp3 env cont))]
      [let-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [exps (get-exps bounds)])
         (if (null? vars)
             (value-of/k body env cont)
             (value-of/k (car exps) env
                         (let-cont '() vars (cdr exps) body env cont))))]
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [refs (newref* vars)]
              [new-env (extend-env* vars refs env)])
         (if (null? vars)
             (value-of/k body env cont)
             (value-of/k (car exps) new-env
                         (letrec-cont refs (cdr exps) body
                                      new-env cont))))]
      [begin-exp
        (exps exp)
        (if (null? exps)
            (value-of/k exp env
                        (begin-cont '() exp env cont))
            (value-of/k (car exps) env
                        (begin-cont (cdr exps) exp env cont)))])))


(define-datatype continuation continuation?
  [end-cont]
  [equ?-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [add-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [sub-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [call-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [set-rhs-cont
   (ref reference?)
   (cont continuation?)]
  [if-cont
   (exp2 expression?)
   (exp3 expression?)
   (env environment?)
   (cont continuation?)]
  [let-cont
   (vals (list-of expval?))
   (vars (list-of identifier?))
   (exps (list-of expression?))
   (body expression?)
   (env environment?)
   (cont continuation?)]
  [letrec-cont
   (refs (list-of reference?))
   (exps (list-of expression?))
   (body expression?)
   (env environment?)
   (cont continuation?)]
  [begin-cont
    (exps (list-of expression?))
    (exp expression?)
    (env environment?)
    (cont continuation?)])

(define apply-cont
  (lambda (cont val)
    ;; Exercise 5.13~5.14
    ;(eopl:pretty-print cont)
    ;(eopl:printf "~%")
    (cases continuation cont
      [end-cont
       ()
       (eopl:printf "End of computation.~%")
       (eopl:printf "~s~%" val)
       val]
      [equ?-cont
       (vals exps env saved-cont)
       (let ([vals (append vals (list val))])
         (if (null? exps)
             (apply-cont saved-cont (equ? vals))
             (value-of/k (car exps) env
                         (equ?-cont vals (cdr exps) env saved-cont))))]
      [add-cont
       (vals exps env saved-cont)
       (let ([vals (append vals (list val))])
         (if (null? exps)
             (apply-cont saved-cont (add vals))
             (value-of/k (car exps) env
                         (add-cont vals (cdr exps) env saved-cont))))]
      [sub-cont
       (vals exps env saved-cont)
       (let ([vals (append vals (list val))])
         (if (null? exps)
             (apply-cont saved-cont (sub vals))
             (value-of/k (car exps) env
                         (sub-cont vals (cdr exps) env saved-cont))))]
      [call-cont
       (vals rands env saved-cont)
       (let ([vals (append vals (list val))])
         (if (null? rands)
             (apply-func (expval->func (car vals)) (cdr vals) saved-cont)
             (value-of/k (car rands) env
                         (call-cont vals (cdr rands) env saved-cont))))]
      [set-rhs-cont
       (ref saved-cont)
       (apply-cont saved-cont (setref! ref val))]
      [if-cont
       (exp2 exp3 env saved-cont)
       (let ([b (expval->bool val)])
         (if b
             (value-of/k exp2 env saved-cont)
             (value-of/k exp3 env saved-cont)))]             
      [let-cont
       (vals vars exps body env saved-cont)
       (let ([vals (append vals (list val))])
         (if (null? exps)
             (let ([refs (newref* vals)])
               (value-of/k body (extend-env* vars refs env) saved-cont))
             (value-of/k (car exps) env
                         (let-cont
                          vals vars (cdr exps) body env saved-cont))))]
      [letrec-cont
       (refs exps body env saved-cont)
       (setref! (car refs) val)
       (if (null? exps)
           (value-of/k body env saved-cont)
           (value-of/k (car exps) env
                       (letrec-cont (cdr refs) (cdr exps)
                                    body env saved-cont)))]
      [begin-cont
        (exps exp env saved-cont)
        (if (null? exps)
            (value-of/k exp env saved-cont)
            (value-of/k (car exps) env
                        (begin-cont (cdr exps) exp env saved-cont)))])))


(define equ?
  (lambda (vals)
    (bool-val
     (= (expval->num (car vals))
        (expval->num (cadr vals))))))

(define add
  (lambda (vals)
    (let ([f #f])
      (set! f
        (lambda (ls)
          (if (null? ls)
              0
              (+ (expval->num (car ls))
                 (f (cdr ls))))))
      (num-val (f vals)))))

(define sub
  (lambda (vals)
    (if (= 1 (length vals))
        (num-val
         (- 0 (expval->num (car vals))))
        (let f ([ls (cdr vals)]
                [a (expval->num (car vals))])
          (if (null? ls)
              (num-val a)
              (f (cdr ls) (- a (expval->num (car ls)))))))))

(define apply-func
  (lambda (f vals cont)
    (cases function f
      [func
       (vars body env)
       (let ([a (length vars)]
             [b (length vals)])
         (if (not (= a b))
             (eopl:error 'apply-func args-count-error a b)
             (let ([refs (newref* vals)])
               (value-of/k body (extend-env* vars refs env) cont))))])))