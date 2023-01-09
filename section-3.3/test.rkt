#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")

(define env (empty-env))


#|
;; Exercise 3.16
(define code "
let double = proc (x) +(x,x)
in double(5)")
(define ast
  (let-exp
   (list (list 'double
               (func-exp
                '(x)
                (add (var-exp 'x) (var-exp 'x)))))
   (call-exp (var-exp 'double) (list (num-exp 5)))))

(value-of ast env)
|#

(define code1 "
let x = 7
    y = 8
    z = 9
in let f = proc (n)
            if less?(x, n)
            then z
            else let x = -(x, n)
                 in x
   in f(5)")
(define ast1
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 8))
         (list 'z (num-exp 9)))
   (let-exp
    (list (list 'f (func-exp
                    '(n)
                    (if-exp (equal? (var-exp 'x) (var-exp 'n))
                            (var-exp 'z)
                            (let-exp
                             (list (list 'x (sub (var-exp 'x)
                                                 (var-exp 'n))))
                             (var-exp 'x))))))
    (tracefunc-call (var-exp 'f) (list (num-exp 5))))))

(value-of ast1 env)