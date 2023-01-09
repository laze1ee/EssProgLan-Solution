#lang eopl


(require "ast-types.rkt"
         "arrays.rkt")

(provide function func
         empty-senv extend-senv* apply-senv
         empty-refenv extend-refenv* apply-refenv
         num-val bool-val func-val arr-val
         expval->num expval->bool expval->func expval->arr
         expval->any)


;; function
(define-datatype function function?
  (func
   [num integer?]
   [body expression?]
   [env  list?]))
;; function


;; environment
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

(define empty-refenv
  (lambda ()
    '()))

(define extend-refenv
  (lambda (ref refenv)
    (cons ref refenv)))

(define extend-refenv*
  (lambda (refs refenv)
    (if (null? refs)
        refenv
        (extend-refenv* (cdr refs)
                        (extend-refenv (car refs) refenv)))))

(define apply-refenv
  (lambda (refenv n)
    (list-ref refenv n)))
;; environment


;; expressed value
(define-datatype expval expval?
  (num-val
   [num number?])
  (bool-val
   [bool boolean?])
  (func-val
   [func function?])
  (arr-val
   [arr array?]))

(define extract-expval-error
  (lambda (expval type)
    (eopl:error 'extract-expval-error "~s not a ~s type" expval type)))

(define expval->num
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [else (extract-expval-error val 'number)])))

(define expval->bool
  (lambda (val)
    (cases expval val
      [bool-val (bool) bool]
      [else (extract-expval-error val 'boolean)])))

(define expval->func
  (lambda (val)
    (cases expval val
      [func-val (func) func]
      [else (extract-expval-error val 'function)])))

(define expval->arr
  (lambda (val)
    (cases expval val
      [arr-val (arr) arr]
      [else (extract-expval-error val 'array)])))

(define expval->any
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func]
      [arr-val (arr) arr])))
;; expressed value