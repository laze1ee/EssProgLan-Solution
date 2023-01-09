#lang eopl


;; Exercise 1.7
(define nth-element
  (lambda (lst n)
    (let f ([ls lst] [i n])
      (cond
        [(null? ls)
         (eopl:error 'nth-element "~s dose not have ~s elements."
                     lst (+ n 1))]
        [(= i 0)
         (car ls)]
        [else
         (f (cdr ls) (- i 1))]))))

;; test
(nth-element '(a b c d) 4)