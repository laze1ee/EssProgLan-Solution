#lang eopl


;; Exercise 2.6

(define env1
  '((y x a)
    (1 5 9)))

(define env2
  '((y 1) (x 5) (a 9)))

(define env3
  '(y 1 (x 5 (a 9 ()))))

(define env4
  (lambda (var)
    (if (eq? var 'y)
        1
        (if (eq? var 'x)
            5
            (if (eq? var 'a)
                9
                (eopl:error 'apply-env4
                            "No binding for ~s" var))))))

(define apply-env4
  (lambda (env var)
    (env var)))