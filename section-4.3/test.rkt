#lang eopl

(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "translation.rkt"
         "eval-ast.rkt")

(initialize-store!)
(newref (func-val (func 1 (=? (nameless-var-exp 0) (num-exp 0)) '())))
(define senv '(zero?))
(define refenv '(0))

#|
(define code "
let x = 7
    y = 5
in +(x, y)")
(define ast
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 5)))
   (add (var-exp 'x) (var-exp 'y))))

(value-of (translation-of ast senv) refenv)


(define code1 "
let x = 7
    y = 5
in let double = func (x) +(x,x)
   in -(double(x), y)")
(define ast1
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 5)))
   (let-exp
    (list (list 'double (func-exp '(x) (add (var-exp 'x) (var-exp 'x)))))
    (sub (call-exp (var-exp 'double) (list (var-exp 'x)))
         (var-exp 'y)))))

(value-of (translation-of ast1 senv) refenv)


(define code2 "
let x = 7
    y = 5
in let double = func (x, y) +(+(x,x), +(y,y))
       man = func () -(x,y)
   in -(double(x,y), man())")
(define ast2
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 5)))
   (let-exp
    (list (list 'double (func-exp
                         '(x y) (add (add (var-exp 'x) (var-exp 'y))
                                     (add (var-exp 'x) (var-exp 'y)))))
          (list 'man (func-exp '() (sub (var-exp 'x) (var-exp 'y)))))
    (sub (call-exp (var-exp 'double) (list (var-exp 'x) (var-exp 'y)))
         (call-exp (var-exp 'man) '())))))

(value-of (translation-of ast2 senv) refenv)


(define code3 "
let x = 7
    y = 4
in letrec odd = func (n) if zero?(n) then x else even(-(n,1))
          even = func (n) if zero?(n) then y else odd(-(n,1))
          man = +(x, y)
   in odd(man)")
(define ast3
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 4)))
   (letrec-exp
    (list (list 'odd
                (func-exp
                 '(n)
                 (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'n)))
                         (var-exp 'x)
                         (call-exp (var-exp 'even)
                                   (list (sub (var-exp 'n) (num-exp 1)))))))
          (list 'even
                (func-exp
                 '(n)
                 (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'n)))
                         (var-exp 'y)
                         (call-exp (var-exp 'odd)
                                   (list (sub (var-exp 'n) (num-exp 1)))))))
          (list 'man
                (add (var-exp 'x) (var-exp 'y))))
    (call-exp (var-exp 'odd) (list (var-exp 'man))))))

(value-of (translation-of ast3 senv) refenv)


(define code4 "
let x = 7
    y = 4
in letrec odd = func (n) if zero?(n) then #f else even(-(n,1))
          even = func (n) if zero?(n) then #t else odd(-(n,1))
          man = +(x, y)
   in begin
       set(x,77);
       set(y,44);
       odd(1)
      end")
(define ast4
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 4)))
   (letrec-exp
    (list (list 'odd
                (func-exp
                 '(n)
                 (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'n)))
                         (bool-exp #f)
                         (call-exp (var-exp 'even)
                                   (list (sub (var-exp 'n) (num-exp 1)))))))
          (list 'even
                (func-exp
                 '(n)
                 (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'n)))
                         (bool-exp #t)
                         (call-exp (var-exp 'odd)
                                   (list (sub (var-exp 'n) (num-exp 1)))))))
          (list 'man
                (add (var-exp 'x) (var-exp 'y))))
    (block-exp
     (list
      (assign-exp 'x (num-exp 77))
      (assign-exp 'y (num-exp 44)))
     (call-exp (var-exp 'odd) (list (num-exp 2)))))))

(value-of (translation-of ast4 senv) refenv)
|#

;; Exercise 4.16
(define code5 "
let times4 = 0
in begin
    set times4 = proc (x)
                  if zero?(x)
                  then 0
                  else -((times4 -(x,1)), -4);
    (times4 3)
   end")
(define ast5
  (let-exp
   (list (list 'times4 (num-exp 0)))
   (block-exp
    (list (assign-exp
           'times4
           (func-exp
            '(x)
            (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'x)))
                    (num-exp 0)
                    (sub (call-exp (var-exp 'times4)
                                   (list (sub (var-exp 'x) (num-exp 1))))
                         (num-exp -4))))))
    (call-exp (var-exp 'times4) (list (num-exp 3))))))

(value-of (translation-of ast5 senv) refenv)