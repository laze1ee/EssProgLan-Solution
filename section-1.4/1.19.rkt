#lang eopl


;; Exercise 1.19
(define list-set
  (lambda (lst n x)
    (cond
      [(null? lst)
       (eopl:error 'list-set "Index is out of range")]
      [(= n 0)
       (cons x (cdr lst))]
      [else
       (cons (car lst)
             (list-set (cdr lst) (- n 1) x))])))

;; test
(list-set '(a b c d) 2 '(1 2))