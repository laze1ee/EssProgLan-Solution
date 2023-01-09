#lang eopl


;; Exercise 2.23
(define identifier?
  (lambda (s)
    (and (symbol? s)
         (not (eq? 'lambda s)))))