#lang eopl


(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")

(define env (empty-env))
(initialize-store!)


(define code "
let x = 1
    y = 5
    z = 4
in let swap = proc (a, b)
               let tmp = a
               in begin
                   set(a, b)
                   set(b, tmp)
                   22
                  end
   in begin swap(ref x, ref y) -(x,y) end")
(define ast
  (let-exp
   (list (list 'x (num-exp 1))
         (list 'y (num-exp 5))
         (list 'z (num-exp 4)))
   (let-exp
    (list (list 'swap
                (func-exp
                 '(a b)
                 (let-exp
                  (list (list 'tmp (var-exp 'a)))
                  (begin-exp
                    (list (set-exp 'a (var-exp 'b))
                          (set-exp 'b (var-exp 'tmp)))
                    (num-exp 22))))))
    (begin-exp
      (list (call-exp (var-exp 'swap)
                      (list (alias-exp 'x) (alias-exp 'y))))
      (sub (var-exp 'x) (var-exp 'y))))))

(value-of ast env)