#lang eopl


;; Exercise 2.15
(define (var-exp var)
  var)

(define (lambda-exp var lc-exp)
  (list 'lambda (list var) lc-exp))

(define (app-exp lc-exp1 lc-exp2)
  (list lc-exp1 lc-exp2))

(define (var-exp? lc-exp)
  (symbol? lc-exp))

(define (lambda-exp? lc-exp)
  (and (eq? (car lc-exp) 'lambda)
       (= 3 (length lc-exp))))

(define (app-exp? lc-exp)
  (or (var-exp? (car lc-exp))
      (lambda-exp? (car lc-exp))))

(define (var-exp->var lc-exp)
  lc-exp)

(define (lambda-exp->bound-var lc-exp)
  (caadr lc-exp))

(define (lambda-exp->body lc-exp)
  (caddr lc-exp))

(define (app-exp->rator lc-exp)
  (car lc-exp))

(define (app-exp-rand lc-exp)
  (cadr lc-exp))