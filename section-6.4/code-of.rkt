#lang eopl


(require "help.rkt"
         "ast-types.rkt")

(provide code-of)


(define code-of
  (lambda (exp)
    (cases expression exp
      [num-exp (num) num]
      [bool-exp (bool) bool]
      [func-exp
       (parameters body)
       (cons 'func
             (cons parameters
                   (map code-of body)))]
      
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
       (cons 'let
             (cons (map (lambda (bound)
                          (list (car bound)
                                (code-of (cadr bound))))
                        bounds)
                   (map code-of body)))]
      [letrec-exp
       (bounds body)
       (cons 'letrec
             (cons (map (lambda (bound)
                          (list (car bound)
                                (code-of (cadr bound))))
                        bounds)
                   (map code-of body)))]
      [begin-exp
       (exps)
       (cons 'begin
             (map code-of exps))]
      [set-exp
       (id exp1)
       (list 'set! id
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