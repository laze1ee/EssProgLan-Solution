#lang eopl


(require "help.rkt")

(provide program a-program
         expression
         num-exp bool-exp func-exp typed-func-exp
         eq?-exp sum-exp diff-exp
         var-exp call-exp if-exp
         let-exp typed-let-exp letrec-exp typed-letrec-exp
         throw-exp begin-exp set-exp print-exp
         letcc-exp
         data-type data-type?
         Int Bool Function Tvar
         optional-type optional-type?
         unknow-type a-type
         optype->type fresh-tvar-type)


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
  
  [begin-exp
   (exps (list-of expression?))]
  [set-exp
   (var identifier?)
   (exp expression?)]
  [print-exp
   (exp expression?)]
  
  [letcc-exp
   (var identifier?)
   (body (list-of expression?))]
  [throw-exp
   (exp1 expression?)
   (exp2 expression?)])


(define typed-parameter?
  (lambda (exp)
    (and (optional-type? (car exp))
         (identifier? (list-ref exp 1)))))

(define binding?
  (lambda (exp)
    (and (identifier? (first exp))
         (expression? (second exp)))))

(define typed-binding?
  (lambda (exp)
    (and (optional-type? (car exp))
         (identifier? (list-ref exp 1))
         (expression? (list-ref exp 2)))))


(define-datatype data-type data-type?
  [Int]
  [Bool]
  [Function
   (args (list-of data-type?))
   (result data-type?)]
  [Tvar
   (sn number?)])


(define-datatype optional-type optional-type?
  [unknow-type]
  [a-type
   (t data-type?)])


(define optype->type
  (lambda (o)
    (cases optional-type o
      [unknow-type () (fresh-tvar-type)]
      [a-type (t) t])))


(define fresh-tvar-type
  (let ([sn -1])
    (lambda ()
      (set! sn (+ sn 1))
      (Tvar sn))))