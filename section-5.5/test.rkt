#lang eopl


(require "ast-types.rkt"
         "parser.rkt"
         "store-model.rkt"
         "evaluation.rkt")

(define eval
  (lambda (slice c)
    (value-of-program slice (a-program (ast-of code)))))


(define code
  '(let ([x 0]
         [m (mutex)])
     (let ([f (proc ()
                    (wait m)
                    (set! x (- x 1 -2 -3 5))
                    (print x)
                    (signal m))])
       (spawn (f))
       (spawn (f))
       (spawn (f))
       (wait-ending m)
       x)))


(eval 5 code)