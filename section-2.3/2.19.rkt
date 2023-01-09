#lang eopl


;; Exercise 2.19
(define number->bintree
  (lambda (n)
    (list n '() '())))

(define move-to-left-son
  (lambda (bt)
    (list-ref bt 1)))

(define move-to-right-son
  (lambda (bt)
    (list-ref bt 2)))

(define at-leaf?
  (lambda (bt)
    (null? bt)))

(define insert-left
  (lambda (n bt)
    (list (car bt)
          (list n (move-to-left-son bt) '())
          (move-to-right-son bt))))

(define insert-right
  (lambda (n bt)
    (list (car bt)
          (move-to-left-son bt)
          (list n '() (move-to-right-son bt)))))