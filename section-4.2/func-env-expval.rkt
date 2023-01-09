#lang eopl


(require "ast-types.rkt")

(provide function func
         empty-env extend-env extend-env* apply-env
         num-val bool-val func-val ref-val list-val
         expval->num expval->bool expval->func expval->list expval->ref
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
  (lambda (val)
    (list? val)))

(define empty-env
  (lambda ()
    '()))

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
       (eopl:error 'apply-env "No bindding for ~s" var)]
      [(eq? (car env) var)
       (list-ref env 1)]
      [else
       (apply-env (list-ref env 2) var)])))
;; environment


;; expressed value
(define reference?
  (lambda (ref)
    (and (integer? ref)
         (>= ref 0))))

(define-datatype expval expval?
  (num-val
   [num number?])
  (bool-val
   [bool boolean?])
  (func-val
   [func function?])
  (ref-val
   [ref reference?])
  (list-val
   [ls list?]))

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

(define expval->ref
  (lambda (val)
    (cases expval val
      [ref-val (ref) ref]
      [else (extract-expval-error val 'ref-val)])))

(define expval->list
  (lambda (val)
    (cases expval val
      [list-val (ls) ls]
      [else (extract-expval-error val 'list-val)])))

(define expval->any
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func]
      [ref-val (ref) ref]
      [list-val (ls) ls])))
;; expressed value