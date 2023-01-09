#lang eopl

(require "auxiliary.rkt"
         "ast-types.rkt"
         "func-env-expval.rkt"
         "store-model.rkt"
         "cont-types.rkt")

(provide value-of-pgm)


(define exp 'uninitialized)
(define env 'uninitialized)
(define cont 'uninitialized)
(define val 'uninitialized)
(define f-val 'uninitialized)


(define value-of-pgm
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exp1)
       (set! exp exp1)
       (set! cont (end-cont))
       (set! env (init-env))
       (value-of/k)])))



(define value-of/k
  (lambda ()
    (cond
      [(primitive? exp)
       (eval-primitive)]
      [(arithmetic? exp)
       (eval-arithmetic)]
      [(syntax? exp)
       (eval-syntax)])))

(define eval-primitive
  (lambda ()
    (cases primitive exp
      [num-exp
       (num)
       (set! val (num-val num))
       (apply-cont)]
      [bool-exp
       (bool)
       (set! val (bool-val bool))
       (apply-cont)]
      [func-exp
       (parameters body)
       (set! val (func-val (func parameters body env)))
       (apply-cont)])))

(define eval-arithmetic
  (lambda ()
    (cases arithmetic exp
      [equ?-exp
       (exp1 exp2)
       (set! exp exp1)
       (set! cont (equ?-cont '() (list exp2) env cont))
       (value-of/k)]
      [add-exp
       (exps)
       (cond
         [(null? exps)
          (set! val (num-val 0))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! cont (add-cont '() (cdr exps) env cont))
          (value-of/k)])]
      [sub-exp
       (exps)
       (cond
         [(null? exps)
          (eopl:error 'sub-exp args-count-err "at least 1" 0)]
         [else
          (set! exp (car exps))
          (set! cont (sub-cont '() (cdr exps) env cont))
          (value-of/k)])]
      [else #f])))

(define eval-syntax
  (lambda ()
    (cases syntax exp
      [var-exp
       (var)
       (set! val (deref (apply-env env var)))
       (apply-cont)]
      [call-exp
       (rator rands)
       (set! exp rator)
       (set! cont (call-cont '() rands env cont))
       (value-of/k)]
      [if-exp
       (exp1 exp2 exp3)
       (set! exp exp1)
       (set! cont (if-cont exp2 exp3 env cont))
       (value-of/k)]
      [let-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [exps (get-exps bounds)])
         (cond
           [(null? exps)
            (set! exp body)
            (value-of/k)]
           [else
            (set! exp (car exps))
            (set! cont (let-cont '() vars (cdr exps) body env cont))
            (value-of/k)]))]
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [refs (newref* vars)])
         (set! env (extend-env* vars refs env))
         (cond
           [(null? exps)
            (set! exp body)
            (value-of/k)]
           [else
            (set! exp (car exps))
            (set! cont (letrec-cont refs (cdr exps) body env cont))
            (value-of/k)]))]
      [set-exp
       (var exp1)
       (set! exp exp1)
       (set! cont (set-cont (apply-env env var) cont))
       (value-of/k)]
      [begin-exp
       (exps exp1)
       (cond
         [(null? exps)
          (set! exp exp1)
          (value-of/k)]
         [else
          (set! exp (car exps))
          (set! cont (begin-cont (cdr exps) exp1 env cont))
          (value-of/k)])]
      [else #f])))



(define apply-cont
  (lambda ()
    (cases continuation cont
      [end-cont
       ()
       (eopl:printf "End of computation.~%")
       (eopl:printf "Final answer: ~s~%" val)
       val]
      [equ?-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! cont saved-cont)
          (set! val (num-equ? vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! cont (equ?-cont vals (cdr exps) saved-env saved-cont))
          (value-of/k)])]
      [add-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! cont saved-cont)
          (set! val (num-add vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! cont (add-cont vals (cdr exps) saved-env saved-cont))
          (value-of/k)])]
      [sub-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! cont saved-cont)
          (set! val (num-sub vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! cont (sub-cont vals (cdr exps) saved-env saved-cont))
          (value-of/k)])]
      [call-cont
       (vals rands saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? rands)
          (set! cont saved-cont)
          (set! val (cdr vals))
          (set! f-val (expval->func (car vals)))
          (apply-func/k)]
         [else
          (set! exp (car rands))
          (set! env saved-env)
          (set! cont (call-cont vals (cdr rands) saved-env saved-cont))
          (value-of/k)])]
      [if-cont
       (exp2 exp3 saved-env saved-cont)
       (if (expval->bool val)
           (set! exp exp2)
           (set! exp exp3))
       (set! env saved-env)
       (set! cont saved-cont)
       (value-of/k)]
      [let-cont
       (vals vars exps body saved-env saved-cont)
       (set! vals (append vals (list val)))
       ;(eopl:printf "let: ~s~%~%" cont)
       (cond
         [(null? exps)
          (let ([refs (newref* vals)])
            (set! exp body)
            (set! env (extend-env* vars refs env))
            (set! cont saved-cont)
            (value-of/k))]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! cont (let-cont vals vars (cdr exps) body saved-env saved-cont))
          (value-of/k)])]
      [letrec-cont
       (refs exps body saved-env saved-cont)
       ;(eopl:printf "letrec: ~s~%~%" cont)
       (setref! (car refs) val)
       (cond
         [(null? exps)
          (set! exp body)
          (set! env saved-env)
          (set! cont saved-cont)
          (value-of/k)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! cont (letrec-cont (cdr refs) (cdr exps)
                                  body saved-env saved-cont))
          (value-of/k)])]
      [set-cont
       (ref saved-cont)
       (set! val (setref! ref val))
       (set! cont saved-cont)
       (apply-cont)]
      [begin-cont
       (exps exp1 saved-env saved-cont)
       (cond
         [(null? exps)
          (set! exp exp1)
          (set! env saved-env)
          (set! cont saved-cont)
          (value-of/k)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! cont (begin-cont (cdr exps) exp1 saved-env saved-cont))
          (value-of/k)])]
      [else #f])))


(define num-equ?
  (lambda (vals)
    (bool-val
     (= (expval->num (car vals))
        (expval->num (cadr vals))))))

(define num-add
  (lambda (vals)
    (let ([f #f])
      (set! f
        (lambda (ls)
          (if (null? ls)
              0
              (+ (expval->num (car ls))
                 (f (cdr ls))))))
      (num-val (f vals)))))

(define num-sub
  (lambda (vals)
    (if (= 1 (length vals))
        (num-val
         (- 0 (expval->num (car vals))))
        (let f ([ls (cdr vals)]
                [a (expval->num (car vals))])
          (if (null? ls)
              (num-val a)
              (f (cdr ls) (- a (expval->num (car ls)))))))))

(define apply-func/k
  (lambda ()
    (cases function f-val
      [func
       (parameters body saved-env)
       (let ([a (length parameters)]
             [b (length val)])
         (if (not (= a b))
             (eopl:error 'apply-func/k args-count-err a b)
             (let ([refs (newref* val)])
               (set! exp body)
               (set! env (extend-env* parameters refs saved-env))
               (value-of/k))))])))