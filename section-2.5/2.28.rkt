#lang eopl


;; Exercise 2.28
(define unparse-exp
  (lambda (exp)
    (cases lc-exp exp
      [var-exp
       (var)
       (eopl:printf "~s" var)]
      [lambda-exp
       (bound-var body)
       (eopl:printf "~a" (list 'lambda (list bound-var)
                               (unparse-exp body)))]
      [app-exp
       (rator rand)
       (eopl:printf "~a" (list (unparse-exp rator)
                               (unparse-exp rand)))])))