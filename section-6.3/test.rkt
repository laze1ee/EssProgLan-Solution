#lang eopl


(require "auxiliary.rkt"
         "ast-of.rkt"
         "ast-types.rkt"
         "cps-of.rkt"
         "code-of.rkt"
         "anf-of.rkt")


(define init
  (lambda (simples)
    (car simples)))

#|
(define code
  '(if (f 5)
       (if (f 6)
           (g 6)
           (h 6))
       (if (f 7)
           (g 7)
           (h 7))))

(print
 (code-of
  (cps-of-exps (list (ast-of code)) init)))


(define code1
  '(letrec
       ([x 7]
        [y #t]
        [f (func (a b) (+ a b))])
     (f x y)))

(print
 (code-of
  (cps-of-exps (list (ast-of code1)) init)))


(define code2
  '(func (a b)
         7))

(print
 (code-of
  (anf-of (ast-of code2))))


(define code3
  '(if (f 5)
       (if (f 6)
           (g 6)
           (h 6))
       (if (f 7)
           (g 7)
           (h 7))))

(print
 (code-of
  (anf-of (ast-of code3))))


(define code4
  '(let ([x 7]
         [y 9]
         [fib
          (func (n)
                (if (eq? n 2)    ;; use eq? instead of <
                    1
                    (+ (fib (- n 2))
                       (fib (- n 1)))))]
         [fib/anf
          (func (n)
                (if (eq? n 2)    ;; use eq? instead of <
                    1
                    (let ([val0 (fib/anf (- n 2))])
                      (let ([val1 (fib/anf (- n 1))])
                        (+ val0 val1)))))])
     (f (+ x y))))

(print
 (code-of
  (anf-of (ast-of code4))))
|#

;; exercise 6.35
(define code5
  '(+ 5 (f 6) 7))

(print
 (code-of
  (anf-of (ast-of code5))))

(print
 (code-of
  (cps-of-exps (list (anf-of (ast-of code5))) init)))