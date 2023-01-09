#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "type-env.rkt"
         "type-of.rkt")


(define code
  '(letrec
       ([Int x 7]
        [Bool c #f]
        [((Int Int) Int)
         mul (func (a b) (if (= a 0) b (+ b (mul (- a 1) b))))]
        [((Int) Int)
         fact (func (n) (if (= n 0) 1 (mul n (fact (- n 1)))))])
     (func ([Int a]) (fact a))))


(print
 (type-of (ast-of code) init-tenv))