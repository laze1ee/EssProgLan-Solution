#lang eopl


(require "2.5.rkt")


;; Exercise 2.11
(define extend-env
  (lambda (var val env)
    (cons (list
           (cons var (caar env))
           (cons val (cadar env)))
          (cdr env))))

(define extend-env*
  (lambda (vars vals env)
    (cons (list vars vals) env)))

(define apply-env
  (lambda (env var)
    (apply-rib (car env) var (cdr env))))

(define apply-rib
  (lambda (pair var env)
    (if (null? pair)
        (eopl:error 'apply-env "No binding for ~s" var)
        (let f ([vars (car pair)]
                [vals (cadr pair)])
          (cond
            [(null? vars)
             (apply-env env var)]
            [(eq? (car vars) var)
             (car vals)]
            [else
             (f (cdr vars) (cdr vals))])))))

;; test
(define env
  '( ((a b c) (5 6 9)) ((x y) (#f #t)) ((x b) (yes no)) ()))
(apply-env env 'k)