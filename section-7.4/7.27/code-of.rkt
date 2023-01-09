#lang eopl


(require "help.rkt"
         "data-types.rkt"
         "ast-types.rkt")

(provide code-of code-of-data-type)


(define code-of
  (lambda (exp)
    (cases expression exp
      [num-exp (num) num]
      [bool-exp (bool) bool]
      [func-exp
       (parameters body)
       (list 'func
             parameters
             (code-of body))]
      [typed-func-exp
       (parameters body)
       (list 'func
             (map (lambda (parameter)
                    (list
                     (code-of-type (first parameter))
                     (second parameter)))
                  parameters)
             (code-of body))]
      
      [eq?-exp
       (exp1 exp2)
       (list '=
             (code-of exp1)
             (code-of exp2))]
      [sum-exp
       (exps)
       (cons '+
             (map code-of exps))]
      [diff-exp
       (exps)
       (cons '-
             (map code-of exps))]

      [var-exp (var) var]
      [call-exp
       (rator rands)
       (cons (code-of rator)
             (map code-of rands))]
      [if-exp
       (exp1 exp2 exp3)
       (list 'if
             (code-of exp1)
             (code-of exp2)
             (code-of exp3))]
      [let-exp
       (bounds body)
       (list 'let
             (map (lambda (bound)
                    (list (first bound)
                          (code-of (second bound))))
                  bounds)
             (code-of body))]
      [typed-let-exp
       (bounds body)
       (list 'let
             (map (lambda (bound)
                    (list (code-of-type (first bound))
                          (second bound)
                          (code-of (third bound))))
                  bounds)
             (code-of body))]
      [letrec-exp
       (bounds body)
       (list 'letrec
             (map (lambda (bound)
                    (list (first bound)
                          (code-of (second bound))))
                  bounds)
             (code-of body))]
      [typed-letrec-exp
       (bounds body)
       (list 'letrec
             (map (lambda (bound)
                    (list (code-of-type (first bound))
                          (second bound)
                          (code-of (third bound))))
                  bounds)
             (code-of body))]

      [null?-exp
       (exp1)
       (list 'null? (code-of exp1))]
      [emptylist-exp () '(emptylist)]
      [kar-exp
       (exp1)
       (list 'kar (code-of exp1))]
      [kdr-exp
       (exp1)
       (list 'kdr (code-of exp1))]
      [kons-exp
       (exp1 exp2)
       (list 'kons (code-of exp1) (code-of exp2))]
      [list-exp
       (exps)
       (cons 'list (map code-of exps))]
      [list?-exp
       (exp1)
       (list 'list? (code-of exp1))]
      
      [begin-exp
       (exps)
       (cons 'begin
             (map code-of exps))]
      [set-exp
       (id exp1)
       (list 'set!
             id
             (code-of exp1))]
      [print-exp
       (exp1)
       (list 'print
             (code-of exp1))]
      [else
       (eopl:error 'code-of
                   err-invalid-exp exp)])))


(define code-of-data-type
  (lambda (t)
    (cases data-type t
      [Any () 'Any]
      [Int () 'Int]
      [Bool () 'Bool]
      [Function
       (args result)
       (list (map code-of-data-type args)
             (code-of-data-type result))]
      [List () 'List]
      [Tvar
       (sn)
       (string->symbol
        (string-append "Tvar" (number->string sn)))])))


(define code-of-type
  (lambda (ot)
    (cases option-type ot
      [unknow-type () '?]
      [a-type
       (dt)
       (code-of-data-type dt)])))