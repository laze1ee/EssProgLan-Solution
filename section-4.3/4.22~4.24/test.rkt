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

#|
(define code "
var x,y; {x = 3; y = 4; print +(x,y)}")
(define ast
  (block
   '(x y)
   (multiple
    (list (assign 'x (num-exp 3))
          (assign 'y (num-exp 4))
          (print (add (var-exp 'x) (var-exp 'y)))))))

(result-of ast env)


(define code1 "
var x,y,z; {x = 3; y = 4; z = 0;
            while not(zero?(x))
              {z = +(z,y); x = -(x,1)};
            print z")
(define ast1
  (block
   '(x y z)
   (multiple
    (list (assign 'x (num-exp 3))
          (assign 'y (num-exp 4))
          (assign 'z (num-exp 0))
          (while
           (not-exp (call-exp (var-exp 'zero?) (list (var-exp 'x))))
           (multiple
            (list (assign 'z (add (var-exp 'z) (var-exp 'y)))
                  (assign 'x (sub (var-exp 'x) (num-exp 1))))))
          (print (var-exp 'z))))))

(result-of ast1 env)


(define code2 "
var f,x; {f = proc (x,y) *(x,y);
          x = 3;
          print (f 4 x)}")
(define ast2
  (block
   '(f x)
   (multiple
    (list (assign 'f (func-exp '(x y) (mul (var-exp 'x) (var-exp 'y))))
          (assign 'x (num-exp 3))
          (print (call-exp (var-exp 'f) (list (num-exp 4) (var-exp 'x))))))))

(result-of ast2 env)


(define code3 "
var x; {read x; print x}")
(define ast3
  (block
   '(x)
   (multiple
    (list (read-stmt 'x)
          (print (var-exp 'x))))))

(result-of ast3 env)
|#

(define code4 "
var x,y; {x = 2; y = 3;
          do
           {y = +(y,y);
            print y;
            x = -(x,1)}
          while not(zero?(x))}")
(define ast4
  (block
   '(x y)
   (multiple
    (list (assign 'x (num-exp 2))
          (assign 'y (num-exp 3))
          (do-while
           (multiple
            (list (assign 'y (add (var-exp 'y) (var-exp 'y)))
                  (print (var-exp 'y))
                  (assign 'x (sub (var-exp 'x) (num-exp 1)))))
           (not-exp (call-exp (var-exp 'zero?) (list (var-exp 'x)))))))))

(result-of ast4 env)