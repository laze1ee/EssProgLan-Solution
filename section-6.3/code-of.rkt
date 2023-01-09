#lang eopl


(require "ast-types.rkt")

(provide code-of)


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
      [eq?-exp
       (exp1 exp2)
       (list 'eq?
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
                    (list (car bound)
                          (code-of (cadr bound))))
                  bounds)
             (code-of body))]
      [letrec-exp
       (bounds body)
       (list 'letrec
             (map (lambda (bound)
                    (list (car bound)
                          (code-of (cadr bound))))
                  bounds)
             (code-of body))])))