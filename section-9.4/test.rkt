#lang eopl


(require "help.rkt"
         "ast-of.rkt"
         "ast-types.rkt"
         "class-env.rkt"
         "store-model.rkt"
         "env.rkt"
         "pass1.rkt"
         "value-of.rkt")

#|
(define code
  (list
   
   '(class C1
           (field x)
           (field y)
           (C1 (x y)
               (set! (self x) x)
               (set! (self y) y))
           (get-x () (self x))
           (get-y () (self y))
           (perimeter () (+ (+ (self x) (self y))
                            (+ (self x) (self y))))
           (area () (* (self x) (self y)))
           (sum () (+ (self x) (self y))))
   
   '(class C2 (extend C1)
           (field z)
           (C2 (x y z)
               (self-call C1 x y)
               (set! (self z) z))
           (volume () (* (self-call area) (self z)))
           (sum () (+ (super-call sum) (self z))))

   '(class C3 (extend C2)
           (field y)
           (field u)
           (C3 (x y z u)
               (super-call C2 x y z)
               (set! (self y) y)
               (set! (self u) u))
           (sum () (+ (super-call sum) (self y) (self u))))
   
   '(letrec
        ([* (func (a b) (if (= a 0) 0 (+ b (* (- a 1) b))))]
         [c3 (new C3 1 2 3 4)])
      (method-call c3 sum))))

(print
 (value-of-program
  (pass1=>f-call
   (ast-of code))))
|#

;; Exercise 9.6
(define code1
  (list
   '(class A (A () -1))

   '(let ([o (new A)])
      (instanceof o A))))

(print
 (value-of-program
  (pass1=>f-call
   (ast-of code1))))