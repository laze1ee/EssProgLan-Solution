#lang eopl


(provide empty-env empty-env?
         extend-env extend-env* apply-env env)


(define empty-env
  (lambda ()
    '()))


(define empty-env?
  (lambda (env)
    (null? env)))


;; Exercise 2.5
(define extend-env-ex2.5
  (lambda (var val env)
    (list (list var val) env)))


(define extend-env
  (lambda (var val env)
    (list var val env)))

;; Exercise 2.10
(define extend-env*
  (lambda (vars vals env)
    (if (not (= (length vars) (length vals)))
        (eopl:error 'extend-env*
                    "variables: ~s\n values: ~s\n not match."
                    vars vals)
        (let f ([vars vars] [vals vals] [env env])
          (if (null? vars)
              env
              (f (cdr vars) (cdr vals)
                 (extend-env (car vars) (car vals) env)))))))


(define (apply-env env var)
  (cond
    [(empty-env? env)
     (eopl:error 'apply-env "No binding for ~s" var)]
    [(eq? var (car env))
     (cadr env)]
    [else
     (apply-env (caddr env) var)]))


;; test
(define env
  '(y 1 (x 5 (a 9 ()))))

(extend-env* '(a b c) '(#f atu 531) env)