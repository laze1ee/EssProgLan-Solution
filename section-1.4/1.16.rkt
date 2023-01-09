#lang eopl


;; Exercise 1.16
(define invert
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (list (cadar lst) (caar lst))
              (invert (cdr lst))))))

;; test
(invert '((a 1) (a 2) (1 b) (2 b)))