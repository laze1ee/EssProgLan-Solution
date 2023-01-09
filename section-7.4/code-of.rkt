#lang eopl


(require "help.rkt"
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
      [letcc-exp
       (var exps)
       (cons 'letcc
             (cons var
                   (map code-of exps)))]
      [else
       (eopl:error 'code-of
                   err-invalid-exp exp)])))


(define code-of-data-type
  (lambda (t)
    (cases data-type t
      [Int () 'Int]
      [Bool () 'Bool]
      [Function
       (args result)
       (list (map code-of-data-type args)
             (code-of-data-type result))]
      [Tvar
       (sn)
       (string->symbol
        (string-append "Tvar" (number->string sn)))])))


(define code-of-type
  (lambda (type)
    (cases optional-type type
      [unknow-type () '?]
      [a-type
       (d)
       (code-of-data-type d)])))