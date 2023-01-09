#lang eopl

(require "auxiliary.rkt"
         "ast-types.rkt"
         "parser.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "evaluation.rkt")


(initialize-store!)
(define env (empty-env))
(define cont (end-cont))

#|
(define code
  '(let ([x 1]
         [y 3])
     (+ 5 x y)))

(value-of/k (ast-of code) env cont)


(define code1
  '(letrec ([x 1]
            [y 3]
            [mul (proc (a b)
                       (if (equ? a 0)
                           0
                           (+ b (mul (- a 1) b))))])
     (mul 5 y)))

(value-of/k (ast-of code1) env cont)


(define code2
  '(let ([x 9]
         [y 2])
     (set! y 5)))
            
(value-of/k (ast-of code2) env cont)
|#

;; Exercise 5.13
;; fake fact
(define code3
  '(letrec
       ([fact (proc (n)
                    (if (equ? n 0)
                        0
                        (+ n (fact (- n 1)))))]
        [fact-iter (proc (n a)
                         (if (equ? n 0)
                             a
                             (fact-iter (- n 1) (+ a n))))])
     (fact-iter 4 0)))

(value-of/k (ast-of code3) env cont)