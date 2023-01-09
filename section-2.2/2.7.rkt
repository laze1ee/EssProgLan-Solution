#lang eopl


(require "2.5.rkt")

(provide env)


;; Exercise 2.7
(define (apply-env env var)
  (let f ([e env])
    (cond
      [(empty-env? e)
       (eopl:error 'apply-env
                   "No binding for ~s in ~s" var env)]
      [(eq? (car e) var)
       (cadr e)]
      [else
       (f (caddr e))])))


;; test
(apply-env env 'k)