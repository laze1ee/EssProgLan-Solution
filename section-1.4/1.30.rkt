#lang eopl


(require "1.17.rkt")


;; Exercise 1.30
(define merge
  (lambda (pred loi1 loi2)
    (cond
      [(null? loi1) loi2]
      [(null? loi2) loi1]
      [(pred (car loi1) (car loi2))
       (cons (car loi1)
             (merge pred (cdr loi1) loi2))]
      [else
       (cons (car loi2)
             (merge pred loi1 (cdr loi2)))])))


(define sort/predicate
  (lambda (pred loi)
    (letrec
        ([f (lambda (ls)
              (cond
                [(null? ls) '()]
                [(null? (cdr ls))
                 (f (cons '() ls))]
                [else
                 (cons (merge pred (car ls) (cadr ls))
                       (f (cddr ls)))]))]
         [g (lambda (ls)
              (if (= (length ls) 1)
                  (car ls)
                  (g (f ls))))])
      (g (down loi)))))


;; test
(sort/predicate > '(8 2 5 2 3))