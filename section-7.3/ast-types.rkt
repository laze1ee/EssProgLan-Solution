#lang eopl


(require "help.rkt")

(provide program a-program
         expression
         num-exp bool-exp func-exp
         eq?-exp sum-exp diff-exp
         var-exp call-exp if-exp let-exp letrec-exp throw-exp
         begin-exp set-exp print-exp ann-exp
         letcc-exp
         datatype datatype?
         Int Bool Function)


(define-datatype program program?
  [a-program
   (exp expression?)])


(define-datatype expression expression?
  [num-exp
   (num number?)]
  [bool-exp
   (bool boolean?)]
  [func-exp
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
  [letrec-exp
   (bounds (list-of binding?))
   (body expression?)]
  [begin-exp
   (exps (list-of expression?))]
  [set-exp
   (var expression?)
   (exp expression?)]
  [print-exp
   (exp expression?)]

  [ann-exp
   (var identifier?)
   (type datatype?)]

  [letcc-exp
   (var identifier?)
   (body (list-of expression?))]
  [throw-exp
   (exp1 expression?)
   (exp2 expression?)])


(define typed-parameter?
  (lambda (exp)
    (and (datatype? (car exp))
         (identifier? (list-ref exp 1)))))

(define binding?
  (lambda (exp)
    (and (datatype? (car exp))
         (identifier? (list-ref exp 1))
         (expression? (list-ref exp 2)))))


(define-datatype datatype datatype?
  [Int]
  [Bool]
  [Function
   (args (list-of datatype?))
   (result datatype?)])