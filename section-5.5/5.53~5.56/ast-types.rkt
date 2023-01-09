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
         begin-exp
         raise-exp try-exp
         letcc-exp
         spawn-exp mutex-exp wait-exp signal-exp wait-ending-exp
         print-exp)


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
   (bodies (list-of expression?))])


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
   (bodies (list-of expression?))]
  [letrec-exp
   (bounds (list-of bound?))
   (bodies (list-of expression?))]
  [set-exp
   (var identifier?)
   (exp expression?)]
  [begin-exp
   (exps (list-of expression?))]

  ;; Exception expression
  [raise-exp
   (exp expression?)]
  [try-exp
   (exp expression?)
   (var identifier?)
   (except-exp expression?)]

  ;; Call with current continuation
  [letcc-exp
   (var identifier?)
   (exps (list-of expression?))]

  ;; Thread
  [spawn-exp
   (exp expression?)]
  [mutex-exp]
  [wait-exp
   (exp expression?)]
  [signal-exp
   (exp expression?)]
  [wait-ending-exp
   (exp expression?)]

  ;; Other
  [print-exp
   (exp expression?)])

(define bound?
  (lambda (exps)
    (and (identifier? (car exps))
         (expression? (cadr exps)))))