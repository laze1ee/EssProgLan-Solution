#lang eopl


(require "help.rkt")

(provide program a-program
         expression expression?
         num-exp bool-exp
         eq?-exp sum-exp diff-exp
         var-exp func-exp call-exp if-exp
         let-exp letrec-exp begin-exp set-exp
         print-exp func-exp?
         class-declaration class-declaration? class-decl
         method-declaration?
         set-field-exp new-object-exp
         self-field-exp method-call-exp
         self-call-exp super-call-exp
         instanceof-exp)



(define-datatype program program?
  [a-program
   (classes (list-of class-declaration?))
   (exp expression?)])



(define-datatype class-declaration class-declaration?
  [class-decl
   (class-id identifier?)
   (super-id identifier?)
   (fields (list-of identifier?))
   (methods (list-of method-declaration?))])

(define method-declaration?
  (lambda (decl)
    (and (identifier? (0th decl))
         ((list-of identifier?) (1st decl))
         ((list-of expression?) (2nd decl)))))



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

  [set-field-exp
   (field-id identifier?)
   (exp expression?)]
  [new-object-exp
   (class-id identifier?)
   (rands (list-of expression?))]
  [method-call-exp
   (obj expression?)
   (method-id identifier?)
   (rands (list-of expression?))]
  [self-field-exp
   (field-id identifier?)]
  [self-call-exp
   (method-id identifier?)
   (rands (list-of expression?))]
  [super-call-exp
   (method-id identifier?)
   (rands (list-of expression?))]
  [instanceof-exp
   (exp expression?)
   (class-id identifier?)])


(define binding?
  (lambda (b)
    (and (identifier? (car b))
         (expression? (cadr b)))))

(define func-exp?
  (lambda (exp)
    (cases expression exp
      [func-exp (parameters body) #t]
      [else #f])))