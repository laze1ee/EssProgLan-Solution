#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "pass1.rkt"
         "value-of.rkt")


(define code
  (list
   '(class oddeven
           (oddeven () -1)
           (odd (n) (if (= n 0) #f (self-call even (- n 1))))
           (even (n) (if (= n 0) #t (self-call odd (- n 1)))))

   '(class bogus-oddeven (extend oddeven)
           (bogus-oddeven () -1)
           (odd (n) #t))

   '(let ([o1 (new bogus-oddeven)])
      (method-call o1 odd 13))))

(print
 (value-of-program
  (pass1=>f-call
   (ast-of code))))