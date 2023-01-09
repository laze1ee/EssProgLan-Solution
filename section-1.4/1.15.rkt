#lang eopl


;; Exercise 1.15
(define duple
  (lambda (n x)
    (if (<= n 0)
        '()
        (cons x (duple (- n 1) x)))))

;; test
(duple 4 '(ha ha))