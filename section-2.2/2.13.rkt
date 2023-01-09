#lang eopl


;; Exercise 2.13
(define empty-env1
  (lambda ()
    (lambda (var)
      (eopl:error 'apply-env "No binding for ~s" var))))

(define empty-env2
  (lambda ()
    (lambda ()
      #t)))

(define empty-env3
  (lambda ()
    (lambda (var)
      #f)))

(define extend-env
  (lambda (var val env)
    (list (lambda (search-var)
            (if (eq? var search-var)
                val
                ((list-ref env 0) search-var)))
          (lambda () #f)
          (lambda (search-var)
            (if (eq? var search-var)
                #t
                ((list-ref env 2) search-var))))))

(define apply-env
  (lambda (env search-var)
    ((list-ref env 0) search-var)))

(define empty-env?
  (lambda (env)
    ((list-ref env 1))))

(define has-binding?
  (lambda (env search-var)
    ((list-ref env 2) search-var)))


;; test
(define env
  (extend-env
   'x 4 (extend-env
         'y 9 (extend-env
               'z 'fail
               (list (empty-env1) (empty-env2) (empty-env3))))))
             