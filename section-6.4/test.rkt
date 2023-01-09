#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "code-of.rkt"
         "cps-of.rkt")


(define code
  '(letcc hop
          (letrec ([f (func (n) (if (= n 0) (throw 5 hop) (f (- n 2))))])
            (f 7))))

(print
 (code-of
  (cps-of (ast-of code))))