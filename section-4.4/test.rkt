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


(define code "
letrec x = 10
       i = 0
       arr = new-arr(x, -99)
       fib =
        proc (a, b)
         if ==(i, x)
         then b
         else begin arr-set(arr, i, a);
                    set i = +(i, 1);
                    fib(b, +(a, b)) end
in fib(0,1)")

(define ast
  (letrec-exp
   (list (list 'x (num-exp 10))
         (list 'i (num-exp 0))
         (list 'arr (new-arr-exp (var-exp 'x) (num-exp -99)))
         (list 'fib (func-exp
                     '(a b)
                     (if-exp
                      (=? (var-exp 'i) (var-exp 'x))
                      (var-exp 'b)
                      (block-exp
                       (list (arr-set-exp (var-exp 'arr)
                                          (var-exp 'i)
                                          (var-exp 'a))
                             (assign-exp 'i
                                         (add (var-exp 'i) (num-exp 1))))
                       (call-exp (var-exp 'fib)
                                 (list (var-exp 'b)
                                       (add (var-exp 'a) (var-exp 'b)))))))))
   (call-exp (var-exp 'fib) (list (num-exp 0) (num-exp 1)))))

(value-of (translation-of ast senv) refenv)