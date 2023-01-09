#lang eopl


(require "ast-types.rkt")

(provide empty-env
         extend-env extend-env*
         apply-env 
         num-val bool-val list-val
         expval->num expval->bool expval->list expval->any)


;; environment
(define empty-env
  (lambda () '()))

(define extend-env
  (lambda (var val env)
    (list var val env)))

(define extend-env*
  (lambda (vars vals env)
    (if (null? vars)
        env
        (extend-env* (cdr vars) (cdr vals)
                     (extend-env (car vars) (car vals) env)))))

(define apply-env
  (lambda (env var)
    (cond
      [(null? env)
       (eopl:error 'apply-env "No binding for ~s" var)]
      [(eq? (car env) var)
       (list-ref env 1)]
      [else
       (apply-env (list-ref env 2) var)])))
;; environment


;; expressed value
(define-datatype expval expval?
  (num-val
   [num number?])
  (bool-val
   [bool boolean?])
  
  ;; Exercise 3.9
  (list-val
   [lst list?]))

(define extract-expval-error
  (lambda (expval type)
    (eopl:error 'extract-expval-error "~s is not a ~s type" expval type)))

(define expval->num
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [else (extract-expval-error val 'num-val)])))

(define expval->bool
  (lambda (val)
    (cases expval val
      [bool-val (bool) bool]
      [else (extract-expval-error val 'bool-val)])))

(define expval->list
  (lambda (val)
    (cases expval val
      [list-val (lst) lst]
      [else (extract-expval-error val 'list-val)])))

(define expval->any
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [bool-val (bool) bool]
      [list-val (lst) lst])))
;; expressed value