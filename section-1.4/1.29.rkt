#lang eopl


(require "1.17.rkt"
         "1.28.rkt")


;; Exercise 1.29
(define sort
  (lambda (loi)
    (letrec
        ([f (lambda (ls)
              (cond
                [(null? ls) '()]
                [(null? (cdr ls))
                 (f (cons '() ls))]
                [else
                 (cons (merge (car ls) (cadr ls))
                       (f (cddr ls)))]))]
         [g (lambda (ls)
              (if (= (length ls) 1)
                  (car ls)
                  (g (f ls))))])
      (g (down loi)))))

;; test
(sort '(8 2 5 2 3))