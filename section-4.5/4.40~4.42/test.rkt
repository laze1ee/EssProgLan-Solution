#lang eopl


(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")

(define env (empty-env))
(initialize-store!)


(define code "
let x = 0
    suppose = proc (a, b, c)
               if a then b else c
in suppose(equal?(x,0), x, set(x, +(x,1)))")
(define ast
  (let-exp
   (list (list 'x (num-exp 0))
         (list
          'suppose
          (func-exp
           '(a b c)
           (if-exp (var-exp 'a) (var-exp 'b) (var-exp 'c)))))
   (call-exp
    (var-exp 'suppose)
    (list (equal? (var-exp 'x) (num-exp 0))
          (var-exp 'x)
          (set-exp 'x (add (var-exp 'x) (num-exp 1)))))))

(value-of ast env)