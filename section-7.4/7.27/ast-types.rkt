#lang eopl


(require "help.rkt"
         "data-types.rkt")

(provide program a-program
         expression
         num-exp bool-exp func-exp typed-func-exp
         eq?-exp sum-exp diff-exp
         var-exp call-exp if-exp
         let-exp typed-let-exp letrec-exp typed-letrec-exp
         null?-exp emptylist-exp kar-exp kdr-exp kons-exp
         list-exp list?-exp
         begin-exp set-exp print-exp)


(define-datatype program program?
  [a-program
   (exp expression?)])


(define-datatype expression expression?
  [num-exp
   (num number?)]
  [bool-exp
   (bool boolean?)]
  [func-exp
   (parameters (list-of identifier?))
   (body expression?)]
  [typed-func-exp
   (parameters (list-of typed-parameter?))
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
  [typed-let-exp
   (bounds (list-of typed-binding?))
   (body expression?)]
  [letrec-exp
   (bounds (list-of binding?))
   (body expression?)]
  [typed-letrec-exp
   (bounds (list-of typed-binding?))
   (body expression?)]

  [null?-exp
   (exp expression?)]
  [emptylist-exp]
  [kar-exp
   (exp expression?)]
  [kdr-exp
   (exp expression?)]
  [kons-exp
   (exp1 expression?)
   (exp2 expression?)]
  [list-exp
   (exps (list-of expression?))]
  [list?-exp
   (exp expression?)]
  
  [begin-exp
   (exps (list-of expression?))]
  [set-exp
   (var identifier?)
   (exp expression?)]
  [print-exp
   (exp expression?)])



(define typed-parameter?
  (lambda (exp)
    (and (option-type? (car exp))
         (identifier? (list-ref exp 1)))))

(define binding?
  (lambda (exp)
    (and (identifier? (first exp))
         (expression? (second exp)))))

(define typed-binding?
  (lambda (exp)
    (and (option-type? (car exp))
         (identifier? (list-ref exp 1))
         (expression? (list-ref exp 2)))))