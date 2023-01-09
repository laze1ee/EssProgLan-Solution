#lang eopl


(require "help.rkt"
         "ast-types.rkt")

(provide code-of)


(define code-of
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exps)
       (map code-of-exp exps)])))


(define code-of-exp
  (lambda (exp)
    (cases expression exp
      [num-exp (num) num]
      [bool-exp (bool) bool]
      
      [eq?-exp
       (exp1 exp2)
       (list '=
             (code-of-exp exp1)
             (code-of-exp exp2))]
      [sum-exp
       (exps)
       (cons '+
             (map code-of-exp exps))]
      [diff-exp
       (exps)
       (cons '-
             (map code-of-exp exps))]

      [def-exp
       (id exp1)
       (list 'def
             id
             (code-of-exp exp1))]
      [var-exp (var) var]
      [func-exp
       (parameters body)
       (append (list 'func parameters)
               (map code-of-exp body))]
      [call-exp
       (rator rands)
       (cons (code-of-exp rator)
             (map code-of-exp rands))]
      [if-exp
       (exp1 exp2 exp3)
       (list 'if
             (code-of-exp exp1)
             (code-of-exp exp2)
             (code-of-exp exp3))]
      [begin-exp
       (exps)
       (cons 'begin
             (map code-of-exp exps))]
      [set-exp
       (id exp1)
       (list 'set!
             id
             (code-of-exp exp1))]
      [let-exp
       (bounds body)
       (append (list
                'let
                (map (lambda (bound)
                       (list (0th bound)
                             (code-of-exp (1st bound))))
                     bounds)
                (map code-of-exp body)))]
      [letrec-exp
       (bounds body)
       (append (list
                'letrec
                (map (lambda (bound)
                       (list (0th bound)
                             (code-of-exp (1st bound))))
                     bounds)
                (map code-of-exp body)))]
      [print-exp
       (exp1)
       (list 'print
             (code-of-exp exp1))]

      [imports-exp
       (ids)
       (cons 'imports ids)]
      [lib-exp
       (id imports exports body)
       (let ([impt (code-of-exp imports)])
         (if (= 1 (length impt))
             (append (list 'library id
                           (cons 'exports exports))
                     (map code-of-exp body))              
             (append (list 'library id
                           impt
                           (cons 'exports exports))
                     (map code-of-exp body))))]
      [libvar-exp
       (lib var)
       (string->symbol
        (string-append (symbol->string lib)
                       ":"
                       (symbol->string var)))]
       
      [else
       (eopl:error 'code-of err-invalid-exp exp)])))