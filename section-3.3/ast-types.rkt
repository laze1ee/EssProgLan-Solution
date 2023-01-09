#lang eopl


(provide identifier?
         expression?
         core-syntax core-syntax?
         num-exp bool-exp func-exp call-exp var-exp if-exp
         basic-arith basic-arith?
         equal? add sub
         extended-syntax extended-syntax?
         let-exp tracefunc-call)


;; ======
(define identifier?
  (lambda (var)
    (and (symbol? var)
         (not (eq? var 'lambda)))))
;; ======


(define expression?
  (lambda (exp)
    (or (core-syntax? exp)
        (basic-arith? exp)
        (extended-syntax? exp))))


(define-datatype core-syntax core-syntax?
  (num-exp
   [num number?])
  (bool-exp
   [bool boolean?])
  (func-exp
   [vars (list-of identifier?)]
   [body expression?])
  (call-exp
   [rator expression?]
   [rands (list-of expression?)])   
  (var-exp
   [var identifier?])
  (if-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?]))


(define-datatype basic-arith basic-arith?
  (equal?
   [exp1 expression?]
   [exp2 expression?])
  (add
   [exp1 expression?]
   [exp2 expression?])
  (sub
   [exp1 expression?]
   [exp2 expression?]))


(define-datatype extended-syntax extended-syntax?
  (let-exp
   [bounds (list-of bound?)]
   [body expression?])

  ;; Exercise 3.27
  (tracefunc-call
   [rator expression?]
   [rands (list-of expression?)]))


(define bound?
  (lambda (bound)
    (and (identifier? (car bound))
         (expression? (cadr bound)))))