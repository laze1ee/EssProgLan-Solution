#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")

(define env (empty-env))


;; Exercise 3.16
(define code "
letrec odd = proc (n)
              if equal?(0,n) then #f else even(-(n,1))
       even = proc (n)
              if equal?(0,n) then #t else odd(-(n,1))
in even(5)")
(define ast
  (letrec-exp
   (list (list 'odd (func-exp
                     '(n)
                     (if-exp
                      (equal? (num-exp 0) (var-exp 'n))
                      (bool-exp #f)
                      (call-exp (var-exp 'even)
                                (list (sub (var-exp 'n) (num-exp 1)))))))
         (list 'even (func-exp
                      '(n)
                      (if-exp
                       (equal? (num-exp 0) (var-exp 'n))
                       (bool-exp #t)
                       (call-exp (var-exp 'odd)
                                 (list (sub (var-exp 'n) (num-exp 1))))))))
   (call-exp (var-exp 'even) (list (num-exp 5)))))
  
(value-of ast env)


