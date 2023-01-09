#lang eopl


(provide identifier?
         expression?
         core-syntax core-syntax?
         num-exp bool-exp
         var-exp nameless-var-exp
         func-exp nameless-func-exp trimmed-func-exp call-exp
         if-exp
         known-func nameless-known-func call-known-func
         basic-arith basic-arith?
         equal? add sub
         extended-syntax extended-syntax?
         let-exp nameless-let-exp letrec-exp nameless-letrec-exp
         cond-exp)


;; ======
(define identifier?
  (lambda (var)
    (and (symbol? var)
         (not (eq? var 'if))
         (not (eq? var 'let)))))
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
  (var-exp
   [var identifier?])
  (nameless-var-exp
   [num integer?])
  (func-exp
   [parameters (list-of identifier?)]
   [body expression?])
  (nameless-func-exp
   [num integer?]
   [body expression?])
  (trimmed-func-exp
   [num integer?]
   [body expression?]
   [refs (list-of integer?)])
  (call-exp
   [rator expression?]
   [rands (list-of expression?)])
  (if-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?])

  ;; Exercise 3.43 3.44
  (known-func
   [name identifier?]
   [parameters (list-of identifier?)]
   [body expression?])
  (nameless-known-func
   [len integer?]
   [rands (list-of expression?)]
   [body expression?])
  (call-known-func
   [rator identifier?]
   [rands (list-of expression?)]))


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
  (nameless-let-exp
   [exps (list-of expression?)]
   [body expression?])
  (letrec-exp
   [bounds (list-of bound?)]
   [body expression?])
  (nameless-letrec-exp
   [exps (list-of expression?)]
   [body expression?])

  ;; Exercise 3.38
  (cond-exp
   [conds (list-of condition?)]))


(define bound?
  (lambda (bound)
    (and (identifier? (car bound))
         (expression? (cadr bound)))))

(define condition?
  (lambda (condition)
    (and (expression? (car condition))
         (expression? (cadr condition)))))