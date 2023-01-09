#lang eopl


(require "auxiliary.rkt")

(provide program a-program
         expression
         num-exp bool-exp func-exp
         eq?-exp sum-exp diff-exp
         var-exp call-exp if-exp let-exp letrec-exp)


(define-datatype program program?
  [a-program
   (exp expression?)])


(define-datatype expression expression?
  [num-exp
   (num number?)]
  [bool-exp
   (bool boolean?)]
  [func-exp
   (parametrs (list-of identifier?))
   (body expression?)]
  [eq?-exp
   (exp1 expression?)
   (exp2 expression?)]
  [sum-exp
   (exps (list-of expression?))]
  [diff-exp
   (exps (list-of expression?))]
  [var-exp
   (var identifier?)]
  [call-exp
   (rator expression?)
   (rands (list-of expression?))]
  [if-exp
   (exp1 expression?)
   (exp2 expression?)
   (exp3 expression?)]
  [let-exp
   (bounds (list-of binding?))
   (body expression?)]
  [letrec-exp
   (bounds (list-of binding?))
   (body expression?)])


(define binding?
  (lambda (b)
    (and (identifier? (car b))
         (expression? (cadr b)))))