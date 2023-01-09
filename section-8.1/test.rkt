#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "code-of.rkt"
         "pass1.rkt")


(define code
  (list
   '(library
     stan
     (exports a b odd)
     (def a 5)
     (def b #t)
     (def odd?
          (func (n)
                (if (= n 0) #f (even? (- n 1)))))
     (def even?
          (func (n)
                (if (= n 0) #t (odd? (- n 1))))))
   '(import stan)
   '(letrec
        ([a (+ stan:a stan:a)]
         [b 7]
         [mul (func (a b) (if (= a 0) 0 (+ b (mul (- a 1) b))))])
      (odd (mul a b)))))

(print
 (code-of
  (pass1=>f-call
   (ast-of code))))