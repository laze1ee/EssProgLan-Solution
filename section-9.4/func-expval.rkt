#lang eopl


(require "help.rkt"
         "ast-types.rkt"
         "env.rkt")

(provide function function? func
         expval expval?
         void-val num-val bool-val func-val object-val
         expval->num expval->bool expval->func expval->obj
         expval->any)


;; function
(define-datatype function function?
  (func
   [parameters (list-of identifier?)]
   [bodies (list-of expression?)]
   [env  environment?]))
;; function



;; expressed value
(define-datatype expval expval?
  [void-val]
  [num-val
   (num number?)]
  [bool-val
   (bool boolean?)]
  [func-val
   (func function?)]
  [object-val
   (obj object?)])

(define object?
  (lambda (val)
    (and (list? val)
         (= 3 (length val)))))


(define extract-expval-error
  (lambda (expval type)
    (eopl:error 'extract-expval "~s is not a ~s type" expval type)))

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

(define expval->obj
  (lambda (val)
    (cases expval val
      [object-val (obj) obj]
      [else (extract-expval-error val 'object-val)])))


(define expval->any
  (lambda (val)
    (cases expval val
      [void-val () 'void]
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func]
      [object-val (obj) obj])))
;; expressed value