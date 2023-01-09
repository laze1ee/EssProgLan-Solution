#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "code-of.rkt"
         "ast-types.rkt"
         "add-type.rkt"
         "type-env.rkt"
         "unifier.rkt"
         "type-of.rkt")

#|
(define code
  '(letrec
       ([odd (func (n) (if (= n 0) #f (even (- n 1))))]
        [even (func (n) (if (= n 0) #t (odd (- n 1))))])
     (even 5)))

(print
 (type-of (add-type (ast-of code)) (init-tenv) (empty-subst)))


(define code1
  '(let
       ([f (func (x) x)])
     (f #t)))

(print
 (type-of (add-type (ast-of code1)) (init-tenv) (empty-subst)))
|#

(define code2
  '(let
       ([f1 (func (f) (func (a) (+ (f a) (f 5))))])
     f1))

(print
 (type-of (add-type (ast-of code2)) (init-tenv) (empty-subst)))
