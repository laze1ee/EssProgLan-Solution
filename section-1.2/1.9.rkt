#lang eopl


;; Exercise 1.9
(define remove
  (lambda (s ls)
    (cond
      [(null? ls) '()]
      [(eq? (car ls) s)
       (remove s (cdr ls))]
      [else
       (cons (car ls)
             (remove s (cdr ls)))])))

;; test
(remove 'k '(a b k d e k 5))