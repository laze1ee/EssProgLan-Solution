#lang eopl

(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")


(define env (empty-env))


(define code "
let x = 1
    y = 2
    z = 3
in let f = proc (n)
            +(x,n)
   in f(z)")
(define ast
  (let-exp
   (list (list 'x (num-exp 1))
         (list 'y (num-exp 2))
         (list 'z (num-exp 3)))
   (let-exp
    (list (list 'f (func-exp
                    '(n)
                    (add (var-exp 'x) (var-exp 'n)))))
    (call-exp (var-exp 'f) (list (var-exp 'z))))))

(value-of ast env '())