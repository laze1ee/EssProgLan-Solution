#lang eopl


(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")


(initialize-store!)
(newref (func-val (func '(n) (if-exp (=? (var-exp 'n) (num-exp 0))
                                     (bool-exp #t)
                                     (bool-exp #f))
                        '())))
(define env '((zero? 0)))


;; Exercise 4.21
(define code6 "
let x = 7
in let f = proc (n) -(x,n)
   in +(setdynamic x = 5 during (f 5), (f 5))")
(define ast6
  (let-exp
   (list (list 'x (num-exp 7)))
   (let-exp
    (list (list 'f (func-exp '(n) (sub (var-exp 'x) (var-exp 'n)))))
    (add (setdynamic
          (list (list 'x (num-exp 5)))
          (call-exp (var-exp 'f) (list (num-exp 5))))
         (call-exp (var-exp 'f) (list (num-exp 5)))))))

(value-of ast6 env)