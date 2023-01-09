#lang eopl

(require "ast-types.rkt"
         "func-env-expval.rkt"
         "translation.rkt"
         "trim-func.rkt"
         "eval-ast.rkt")


(define senv '())
(define venv '())


(define process
  (lambda (ast)
    (trim-of (translation-of ast senv))))

#|
(define code "
let x = 7
    y = 4
in letrec odd = func (n) if equal?(n,0) then x else even(-(n,1))
          even = func (n) if equal?(n,0) then y else odd(-(n,1))
          man = +(x, y)
   in odd(man)")
(define ast
  (let-exp
   (list (list 'x (num-exp 7))
         (list 'y (num-exp 4)))
   (letrec-exp
    (list (list 'odd
                (func-exp
                 '(n)
                 (if-exp (equal? (var-exp 'n) (num-exp 0))
                         (var-exp 'x)
                         (call-exp (var-exp 'even)
                                   (list (sub (var-exp 'n) (num-exp 1)))))))
          (list 'even
                (func-exp
                 '(n)
                 (if-exp (equal? (var-exp 'n) (num-exp 0))
                         (var-exp 'y)
                         (call-exp (var-exp 'odd)
                                   (list (sub (var-exp 'n) (num-exp 1)))))))
          (list 'man
                (add (var-exp 'x) (var-exp 'y))))
    (call-exp (var-exp 'odd) (list (var-exp 'man))))))

(value-of (process ast) venv)


;; Exercise 3.42
(define code1 "
let x = 5
    y = 7
    z = 9
in let f = proc (a)
            proc (b)
             +(+(x,a),b)
   in f(y)(z)")
(define ast1
  (let-exp
   (list (list 'x (num-exp 5))
         (list 'y (num-exp 7))
         (list 'z (num-exp 9)))
   (let-exp
    (list (list 'f
                (func-exp
                 '(a)
                 (func-exp
                  '(b)
                  (add (add (var-exp 'x) (var-exp 'a)) (var-exp 'b))))))
    (call-exp (call-exp (var-exp 'f)
                        (list (var-exp 'y)))
              (list (var-exp 'z))))))

(value-of (process ast1) venv)
|#

(define code2 "
let x = 1
    y = 2
    z = 3
in let u = 7
       f = known-proc (n)
            -(+(x, z), n)
   in _f(5)")   ;; procedure name prefix _ means call-known-proc
(define ast2
  (let-exp
   (list (list 'x (num-exp 1))
         (list 'y (num-exp 2))
         (list 'z (num-exp 3)))
   (let-exp
    (list (list 'u (num-exp 7))
          (list 'f (known-func
                    'f
                    '(n)
                    (sub (add (var-exp 'x) (var-exp 'z))
                         (var-exp 'n)))))
    (call-known-func 'f (list (num-exp 5))))))

(value-of (translation-of ast2 senv) venv)