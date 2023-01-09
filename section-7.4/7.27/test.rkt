#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "typed-ast.rkt"
         "data-types.rkt"
         "code-of.rkt"
         "type-of.rkt")

#|
(define code
  '(let ([x 5]
         [y 7]
         [eq? (func (a b) (= a b))]
         [sum (func (a b) (+ a b))])
     (sum x 5)))

(print
 (subst-of
  (eqs-of (fresh-tvar)
          (typed-ast (ast-of code)))))
|#

(define code1
  '(letrec
       ([map (func (f ls)
                   (if (null? ls)
                       (emptylist)
                       (kons (f (kar ls))
                             (map f (kdr ls)))))]
        [double (func (a)
                      (+ a a))])
     map))

(print
 (subst-of
  (eqs-of (fresh-tvar)
          (typed-ast (ast-of code1)))))