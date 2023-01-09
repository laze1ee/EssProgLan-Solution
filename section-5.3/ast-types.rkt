#lang eopl


(require "auxiliary.rkt")

(provide program a-program
         expression?
         primitive primitive?
         num-exp bool-exp func-exp
         arithmetic arithmetic?
         equ?-exp add-exp sub-exp
         syntax syntax?
         var-exp set-exp call-exp if-exp let-exp letrec-exp
         begin-exp)


(define-datatype program program?
  [a-program
   (exp expression?)])


(define expression?
  (lambda (exp)
    (or (primitive? exp)
        (arithmetic? exp)
        (syntax? exp))))


(define-datatype primitive primitive?
  [num-exp
   (num number?)]
  [bool-exp
   (bool boolean?)]
  [func-exp
   (parametrs (list-of identifier?))
   (body expression?)])


(define-datatype arithmetic arithmetic?
  [equ?-exp
   (exp1 expression?)
   (exp2 expression?)]
  [add-exp
   (exps (list-of expression?))]
  [sub-exp
   (exps (list-of expression?))])


(define-datatype syntax syntax?
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
   (bounds (list-of bound?))
   (body expression?)]
  [letrec-exp
   (bounds (list-of bound?))
   (body expression?)]
  [set-exp
   (var identifier?)
   (exp expression?)]
  [begin-exp
   (exps (list-of expression?))
   (exp expression?)])


(define bound?
  (lambda (exps)
    (and (identifier? (car exps))
         (expression? (cadr exps)))))