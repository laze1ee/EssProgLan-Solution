#lang eopl


(require "ast-types.rkt")

(provide function func
         empty-senv extend-senv extend-senv* apply-senv
         empty-venv extend-venv extend-venv* apply-venv
         num-val bool-val func-val
         expval->num expval->bool expval->func expval->any)


;; function
(define-datatype function function?
  (func
   [num integer?]
   [body expression?]
   [env  environment?]))
;; function


;; environment
(define environment?
  (lambda (env)
    (list? env)))

(define empty-senv
  (lambda ()
    '()))

(define extend-senv
  (lambda (var senv)
    (cons var senv)))

(define extend-senv*
  (lambda (vars senv)
    (if (null? vars)
        senv
        (extend-senv* (cdr vars)
                      (extend-senv (car vars) senv)))))

(define apply-senv
  (lambda (senv var)
    (cond
      [(null? senv)
       (eopl:error 'apply-senv "No bindding for ~s" var)]
      [(eq? (car senv) var)
       0]
      [else
       (+ 1 (apply-senv (cdr senv) var))])))

(define empty-venv
  (lambda ()
    '()))

(define extend-venv
  (lambda (val venv)
    (cons val venv)))

(define extend-venv*
  (lambda (vals venv)
    (if (null? vals)
        venv
        (extend-venv* (cdr vals)
                      (extend-venv (car vals) venv)))))

(define apply-venv
  (lambda (venv n)
    (let ([val (list-ref venv n)])
      (if (vector? val)
          (vector-ref val 0)
          val))))
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