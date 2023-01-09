#lang eopl


(require "2.5.rkt")


;; Exercise 2.9
(define has-binding?
  (lambda (env var)
    (cond
      [(empty-env? env) #f]
      [(eq? (car env) var) #t]
      [else
       (has-binding? (caddr env) var)])))

;; test
(has-binding? env 'k)