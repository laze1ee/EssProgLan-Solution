#lang eopl


;; Exercise 3.34
(define empty-env
  (lambda ()
    (lambda (search-var head)
      (eopl:error 'empty-env "No binding for ~s" search-var))))

(define separate
  (lambda (env)
    (lambda (search-var separate-env)
      (env search-var env))))

(define extend-env
  (lambda (var val env)
    (lambda (search-var head)
      (if (eq? var search-var)
          val
          (env search-var head)))))

(define extend-env-rec
  (lambda (name vars body env)
    (lambda (search-var separate-env)
      (if (eq? name search-var)
          (proc-val vars body separate-env)
          (env search-var separate-env)))))

(define apply-env
  (lambda (env search-var)
    (env search-var env)))

(define proc-val
  (lambda (vars body env)
    (list vars body env)))


;; test
(define env (empty-env))
(set! env (extend-env 'x 5 env))
(set! env (extend-env-rec 'a '(x y) 'proc-a-body env))
(set! env (extend-env-rec 'b '(x) 'proc-b-body env))
(set! env (separate env))
(set! env (extend-env-rec 'c '() 'proc-c-body env))
(set! env (extend-env-rec 'd '(x) 'proc-d-body env))
(set! env (separate env))

(apply-env (list-ref (apply-env env 'a) 2) 'b)
(apply-env
 (list-ref
  (apply-env (list-ref (apply-env env 'c) 2) 'd) 2)
 'c)