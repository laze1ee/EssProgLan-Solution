#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt"
         "environment.rkt"
         "func-cont-expval.rkt"
         "store-model.rkt")

(provide value-of-pgm print-cont)



(define exp 'uninitialized)
(define env 'uninitialized)
(define normal-cont 'uninitialized)
(define except-cont 'uninitialized)
(define val 'uninitialized)


;; debug
(define print-cont
  (lambda ()
    (eopl:pretty-print normal-cont)
    (eopl:printf "~%")
    (eopl:pretty-print except-cont)
    (eopl:printf "~%~%")))
;; debug


(define value-of-pgm
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exp1)
       (set! exp exp1)
       (set! env (init-env))
       (set! normal-cont (normal-end))
       (set! except-cont (except-end))
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
       (set! normal-cont (equ?-cont '() (list exp2) env normal-cont))
       (value-of/k)]
      [add-exp
       (exps)
       (cond
         [(null? exps)
          (set! val (num-val 0))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! normal-cont (add-cont '() (cdr exps) env normal-cont))
          (value-of/k)])]
      [sub-exp
       (exps)
       (cond
         [(null? exps)
          (eopl:error 'sub-exp args-count-err "at least 1" 0)]
         [else
          (set! exp (car exps))
          (set! normal-cont (sub-cont '() (cdr exps) env normal-cont))
          (value-of/k)])])))


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
       (set! normal-cont (call-cont '() rands env normal-cont))
       (value-of/k)]
      [if-exp
       (exp1 exp2 exp3)
       (set! exp exp1)
       (set! normal-cont (if-cont exp2 exp3 env normal-cont))
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
            (set! normal-cont (let-cont '() vars (cdr exps)
                                        body env normal-cont))
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
            (set! normal-cont (letrec-cont refs (cdr exps) body env normal-cont))
            (value-of/k)]))]
      [set-exp
       (var exp1)
       (set! exp exp1)
       (set! normal-cont (set-cont (apply-env env var) normal-cont))
       (value-of/k)]
      [begin-exp
       (exps exp1)
       (cond
         [(null? exps)
          (set! exp exp1)
          (value-of/k)]
         [else
          (set! exp (car exps))
          (set! normal-cont (begin-cont (cdr exps) exp1 env normal-cont))
          (value-of/k)])]
      [raise-exp
       (exp1)
       (set! exp exp1)
       (set! normal-cont (raise-cont normal-cont))
       (value-of/k)]
      [try-exp
       (exp1 var except-exp)
       (set! exp exp1)
       (set! except-cont (try-cont var except-exp env
                                   normal-cont except-cont))
       (value-of/k)]
      [letcc-exp
       (var exp1)
       (set! exp exp1)
       (set! env (extend-env var (newref (cont-val normal-cont)) env))
       (value-of/k)]
      [else
       (eopl:error 'eval-syntax invalid-exp-err exp)])))


(define apply-cont
  (lambda ()
    ;(print-cont)
    (cases continuation normal-cont
      [normal-end
       ()
       (eopl:printf "Normal end of computation.~%")
       (eopl:printf "Final answer: ~s~%" val)
       val]
      [equ?-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! normal-cont saved-cont)
          (set! val (num-equ? vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! normal-cont (equ?-cont vals (cdr exps)
                                       saved-env saved-cont))
          (value-of/k)])]
      [add-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! normal-cont saved-cont)
          (set! val (num-add vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! normal-cont (add-cont vals (cdr exps) saved-env saved-cont))
          (value-of/k)])]
      [sub-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! normal-cont saved-cont)
          (set! val (num-sub vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! normal-cont (sub-cont vals (cdr exps) saved-env saved-cont))
          (value-of/k)])]
      [call-cont
       (vals rands saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? rands)
          (set! normal-cont saved-cont)
          (set! val vals)
          (apply-func/k)]
         [else
          (set! exp (car rands))
          (set! env saved-env)
          (set! normal-cont (call-cont vals (cdr rands) saved-env saved-cont))
          (value-of/k)])]
      [if-cont
       (exp2 exp3 saved-env saved-cont)
       (if (expval->bool val)
           (set! exp exp2)
           (set! exp exp3))
       (set! env saved-env)
       (set! normal-cont saved-cont)
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
            (set! normal-cont saved-cont)
            (value-of/k))]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! normal-cont (let-cont vals vars (cdr exps)
                                      body saved-env saved-cont))
          (value-of/k)])]
      [letrec-cont
       (refs exps body saved-env saved-cont)
       ;(eopl:printf "letrec: ~s~%~%" cont)
       (setref! (car refs) val)
       (cond
         [(null? exps)
          (set! exp body)
          (set! env saved-env)
          (set! normal-cont saved-cont)
          (value-of/k)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! normal-cont (letrec-cont (cdr refs) (cdr exps)
                                         body saved-env saved-cont))
          (value-of/k)])]
      [set-cont
       (ref saved-cont)
       (set! val (setref! ref val))
       (set! normal-cont saved-cont)
       (apply-cont)]
      [begin-cont
       (exps exp1 saved-env saved-cont)
       (cond
         [(null? exps)
          (set! exp exp1)
          (set! env saved-env)
          (set! normal-cont saved-cont)
          (value-of/k)]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (set! normal-cont (begin-cont (cdr exps) exp1 saved-env saved-cont))
          (value-of/k)])]
      [raise-cont
       (saved-cont)
       (apply-exception)]
      [else
       (eopl:error 'apply-cont invalid-cont-err normal-cont)])))


(define apply-exception
  (lambda ()
    (cases continuation except-cont
      [except-end
       ()
       (eopl:printf "Exceptional end of compution.~%")
       (eopl:printf "Exceptional info: ~s~%" val)
       val]
      [try-cont
       (var except-exp saved-env saved-normal saved-except)
       (set! exp except-exp)
       (set! env (extend-env var (newref val) saved-env))
       (set! normal-cont saved-normal)
       (set! except-cont saved-except)
       (value-of/k)]
      [else
       (eopl:error 'apply-exception invalid-cont-err except-cont)])))


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
    (let ([f (expval->any (car val))]
          [arg-sz (length (cdr val))])
      (cond
        [(continuation? f)
         (if (not (= 1 arg-sz))
             (eopl:error 'apply-func/k-for-continue args-count-err 1 arg-sz)
             (begin
              (set! normal-cont f)
              (set! val (cadr val))
              (apply-cont)))]
        [(function? f)
         (cases function f
           [func
            (parameters body saved-env)
            (let ([a (length parameters)])
              (if (not (= a arg-sz))
                  (eopl:error 'apply-func/k args-count-err a arg-sz)
                  (let ([refs (newref* (cdr val))])
                    (set! exp body)
                    (set! env (extend-env* parameters refs saved-env))
                    (value-of/k))))])]
        [else
         (eopl:error 'apply-func/k invalid-exp-err f)]))))