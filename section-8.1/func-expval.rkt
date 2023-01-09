#lang eopl


(require "help.rkt"
         "ast-types.rkt"
         "env.rkt")

(provide function function? func
         expval?
         void-val num-val bool-val func-val
         expval->num expval->bool expval->func
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
  [void-val
   (void void?)]
  [num-val
   (num number?)]
  [bool-val
   (bool boolean?)]
  [func-val
   (func function?)])


(define void?
  (lambda (val) (eq? val '(void))))


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


(define expval->any
  (lambda (val)
    (cases expval val
      [void-val (void) void]
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func])))
;; expressed value