#lang eopl


(provide identifier? list-of
         expression?
         core-syntax core-syntax?
         num-exp bool-exp
         var-exp func-exp call-exp if-exp
         basic-arith basic-arith?
         =? add sub
         extended-syntax extended-syntax?
         let-exp letrec-exp setdynamic)


;; ======
(define identifier?
  (lambda (var)
    (and (symbol? var)
         (not (eq? var 'if))
         (not (eq? var 'let)))))

(define list-of
  (lambda (pred)
    (lambda (exprs)
      (or (null? exprs)
          (and (pred (car exprs))
               ((list-of pred) (cdr exprs)))))))
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
  (func-exp
   [parameters (list-of identifier?)]
   [body expression?])
  (call-exp
   [rator expression?]
   [rands (list-of expression?)])
  (if-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?]))

(define-datatype basic-arith basic-arith?
  (=?
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
  (letrec-exp
   [bounds (list-of bound?)]
   [body expression?])
  (setdynamic
   [bounds (list-of bound?)]
   [body expression?]))

(define bound?
  (lambda (bound)
    (and (identifier? (car bound))
         (expression? (cadr bound)))))