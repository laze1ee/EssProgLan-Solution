#lang eopl


;; Exercise 1.24
(define every?
  (lambda (pred lst)
    (cond
      [(null? lst) #t]
      [(pred (car lst))
       (every? pred (cdr lst))]
      [else #f])))

;; test
(every? number? '(1 2 3 5 4))