#lang eopl


(require "ast-types.rkt"
         "env-expval.rkt"
         "eval-ast.rkt")

(define env (empty-env))

#|
;; Exercise 3.16
(define code "
let x = 5
    y = 6
in +(x,y)")
(define ast
  (let-exp
   (list (list 'x (num-exp 5)) (list 'y (num-exp 6)))
   (add (var-exp 'x) (var-exp 'y))))

(value-of ast env)


;; Exercise 3.6
(define code1 "
minus(-(1, 5))")
(define ast1
  (minus (sub (num-exp 1) (num-exp 5))))

(value-of ast1 env)


;; Exercise 3.7
(define code2 "
mul(div(13, 2), 2)")
(define ast2
  (mul (div (num-exp 13) (num-exp 2)) (num-exp 2)))

(value-of ast2 env)


;; Exercise 3.8
(define code3 "
if greater?(5, 3) then #t else #f")
(define ast3
  (if-exp
   (greater? (num-exp 5) (num-exp 3))
   (bool-exp #t)
   (bool-exp #f)))

(value-of ast3 env)


;; Exercise 3.9
(define code4 "
null?(cdr(cons(5, emptylist())))")
(define ast4
  (null?-exp
   (cdr-exp (cons-exp (num-exp 5) (emptylist)))))

(value-of ast4 env)


;; Exercise 3.10
(define code5 "
list(#t, mul(7, 9), 0)")
(define ast5
  (list-exp
   (list (bool-exp #t)
         (mul (num-exp 7) (num-exp 9))
         (num-exp 0))))

(value-of ast5 env)


; Exercise 3.12
(define code6 "
cond
 less?(9, 7) ==> 9
 null?(emptylist()) ==> 7")
(define ast6
  (cond-exp
   (list (list (less? (num-exp 9) (num-exp 7))
               (num-exp 9))
         (list (null?-exp (emptylist))
               (num-exp 7)))))

(value-of ast6 env)


(define code7 "
print(car(cons(5, emptylist())))")
(define ast7
  (print-exp
   (car-exp (cons-exp (num-exp 5) (emptylist)))))

(value-of ast7 env)


(define code8 "
let* x = 5
     y = +(x,x)
in y")
(define ast8
  (let*-exp
   (list (list 'x (num-exp 5))
         (list 'y (add (var-exp 'x) (var-exp 'x))))
   (var-exp 'y)))

(value-of ast8 env)
|#

(define code9 "
unpack x y z = list(5, 6, 7)
in -(+(x,y), 7)")
(define ast9
  (unpack-exp
   '(x y z)
   (list (num-exp 5) (num-exp 6) (num-exp 7)) 
   (sub (add (var-exp 'x) (var-exp 'y)) (var-exp 'z))))

(value-of ast9 env)