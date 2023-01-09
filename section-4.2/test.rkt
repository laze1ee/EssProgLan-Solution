#lang eopl

(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")

(initialize-store!)
(define env (empty-env))

(define code "
let x = newref(22)
in let f = proc (n) let y = newref(-(n, deref(x)))
                    in deref(y)
   in -((f 66), (f 55)) ")
(define ast
  (let-exp
   (list (list 'x (newref-exp (num-exp 22))))
   (let-exp
    (list (list 'f (func-exp
                    '(n)
                    (let-exp
                     (list (list
                            'y
                            (newref-exp
                             (sub (var-exp 'n) (deref-exp (var-exp 'x))))))
                     (deref-exp (var-exp 'y))))))
    (sub (call-exp (var-exp 'f) (list (num-exp 66)))
         (call-exp (var-exp 'f) (list (num-exp 55)))))))

(value-of ast env)


(define code1 "
let x = newref(5)
in list(x, deref(x))")
(define ast1
  (let-exp
   (list (list 'x (newref-exp (num-exp 5))))
   (list-exp (list (var-exp 'x) (deref-exp (var-exp 'x))))))

(value-of ast1 env)