#lang eopl


(provide environment?
         init-env
         extend-env extend-env*
         apply-env)


(define environment?
  (lambda (env)
    (list? env)))

(define init-env
  (lambda () '()))

(define extend-env
  (lambda (var ref env)
    (list var ref env)))

(define extend-env*
  (lambda (vars refs env)
    (if (null? vars)
        env
        (extend-env* (cdr vars) (cdr refs)
                     (extend-env (car vars) (car refs) env)))))

(define apply-env
  (lambda (env var)
    (cond
      [(null? env)
       (eopl:error 'apply-env "No binding for ~s" var)]
      [(eq? (car env) var)
       (list-ref env 1)]
      [else
       (apply-env (list-ref env 2) var)])))