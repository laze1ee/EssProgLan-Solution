#lang eopl


;; Exercise 1.23
(define list-index
  (lambda (pred lst)
    (let f ([n 0] [lst lst])
      (cond
        [(null? lst) #f]
        [(pred (car lst)) n]
        [else
         (f (+ n 1) (cdr lst))]))))

;; test
(list-index symbol? '(1 2 (a b) 3))