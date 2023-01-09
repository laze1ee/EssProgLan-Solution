#lang eopl


(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt"
         "eval-ast.rkt")


(initialize-store!)
(newref (func-val (func '(n) (if-exp (=? (var-exp 'n) (num-exp 0))
                                     (bool-exp #t)
                                     (bool-exp #f))
                        '())))
(define env '((zero? 0)))


(define code "
var x = 5;
    y = 8;
    odd = proc (n) if zero?(n) then #f else even(-(n,1));
    even = proc (n) if zero?(n) then #t else odd(-(n,1));
    f = subproc () print even(+(x,y));
    {x = +(x,y);
     f()}")
(define ast
  (block
   '(x y odd even f)
   (list (num-exp 5)
         (num-exp 8)
         (func-exp
          '(n) (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'n)))
                       (bool-exp #f)
                       (call-exp (var-exp 'even)
                                 (list (sub (var-exp 'n) (num-exp 1))))))
         (func-exp
          '(n) (if-exp (call-exp (var-exp 'zero?) (list (var-exp 'n)))
                       (bool-exp #t)
                       (call-exp (var-exp 'odd)
                                 (list (sub (var-exp 'n) (num-exp 1))))))
         (subfunc-exp
          '() (print (call-exp (var-exp 'even)
                               (list (add (var-exp 'x) (var-exp 'y)))))))
   (multiple
    (list (assign 'x (add (var-exp 'x) (var-exp 'y)))
          (call-stmt (var-exp 'f) '())))))

(result-of ast env)