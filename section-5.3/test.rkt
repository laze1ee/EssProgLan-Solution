#lang eopl


(require "ast-types.rkt"
         "parser.rkt"
         "store-model.rkt"
         "evaluation.rkt")


(initialize-store!)


(define code
  '(letrec ([x 9]
            [y (+)]
            [z (let ([a (+ x y)]
                     [b (- x y)])
                 (if (equ? a b) a b))]
            [double (proc (n)
                          (+ n n))])
     (double z)))

(value-of-pgm (a-program (ast-of code)))