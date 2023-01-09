#lang eopl


;; Exercise 2.16
(define (lambda-exp var lc-exp)
  (list 'lambda var lc-exp))

(define (lambda-exp->bound-var lc-exp)
  (cadr lc-exp))