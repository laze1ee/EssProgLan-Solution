#lang eopl


(require "help.rkt")

(provide program a-program
         expression expression?
         num-exp bool-exp
         eq?-exp sum-exp diff-exp
         def-exp var-exp func-exp call-exp if-exp
         let-exp letrec-exp begin-exp set-exp
         print-exp
         lib-exp imports-exp libvar-exp
         func-exp?)



(define-datatype program program?
  [a-program
   (exps (list-of expression?))])


(define-datatype expression expression?
  [num-exp
   (num number?)]
  [bool-exp
   (bool boolean?)]
  
  [eq?-exp
   (exp1 expression?)
   (exp2 expression?)]
  [sum-exp
   (exps (list-of expression?))]
  [diff-exp
   (exps (list-of expression?))]

  [def-exp
   (id identifier?)
   (exp expression?)]
  [var-exp
   (id identifier?)]
  [func-exp
   (parametrs (list-of identifier?))
   (body (list-of expression?))]
  [call-exp
   (rator expression?)
   (rands (list-of expression?))]
  [if-exp
   (exp1 expression?)
   (exp2 expression?)
   (exp3 expression?)]
  [begin-exp
   (exps (list-of expression?))]
  [set-exp
   (var identifier?)
   (exp expression?)]
  [let-exp
   (bindings (list-of binding?))
   (body (list-of expression?))]
  [letrec-exp
   (bindings (list-of binding?))
   (body (list-of expression?))]
  [print-exp
   (exp expression?)]

  [imports-exp
   (ids (list-of identifier?))]
  [lib-exp
   (id identifier?)
   (imports expression?)
   (exports (list-of identifier?))
   (body (list-of expression?))]
  [libvar-exp
   (lib-id identifier?)
   (id identifier?)])


(define binding?
  (lambda (b)
    (and (identifier? (car b))
         (expression? (cadr b)))))


(define func-exp?
  (lambda (exp)
    (cases expression exp
      [func-exp (parameters body) #t]
      [else #f])))