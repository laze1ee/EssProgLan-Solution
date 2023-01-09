#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt")

(provide function func
         environment?
         empty-env extend-env extend-env* apply-env
         num-val bool-val func-val
         expval?
         expval->num expval->bool expval->func
         expval->any)


;; function
(define-datatype function function?
  (func
   [parameters (list-of identifier?)]
   [body expression?]
   [env  environment?]))
;; function


;; environment
(define environment?
  (lambda (env)
    (list? env)))

(define empty-env
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
;; environment


;; expressed value
(define-datatype expval expval?
  (num-val
   [num number?])
  (bool-val
   [bool boolean?])
  (func-val
   [func function?]))

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

(define expval->func
  (lambda (val)
    (cases expval val
      [func-val (func) func]
      [else (extract-expval-error val 'func-val)])))

(define expval->any
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func])))
;; expressed value