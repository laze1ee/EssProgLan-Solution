#lang eopl


(provide environment?
         init-env
         extend-env extend-env*
         apply-env
         extend-env!)


(define environment?
  (lambda (env)
    (list? env)))

(define init-env
  (lambda () '()))

(define extend-env
  (lambda (id ref env)
    (list id ref env)))

(define extend-env*
  (lambda (ids refs env)
    (if (null? ids)
        env
        (extend-env* (cdr ids) (cdr refs)
                     (extend-env (car ids) (car refs) env)))))

(define apply-env
  (lambda (env id)
    (cond
      [(null? env)
       (eopl:error 'apply-env "No binding for ~s" id)]
      [(eq? (car env) id)
       (list-ref env 1)]
      [else
       (apply-env (list-ref env 2) id)])))


;; Assumed where extend-env! existed
;; but this cannot be implemented, only satisfied for interface
(define extend-env!
  (lambda (id ref env)
    #f))