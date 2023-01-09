#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt"
         "environment.rkt")

(provide function function? func
         continuation continuation?
         except-end
         equ?-cont add-cont sub-cont
         call-cont if-cont let-cont letrec-cont set-cont
         begin-cont
         raise-cont try-cont
         end-main-thread-cont end-subthread-cont
         spawn-cont wait-cont signal-cont wait-ending-cont
         print-cont
         expval?
         num-val bool-val func-val cont-val
         expval->num expval->bool expval->func expval->cont
         expval->any)


;; function
(define-datatype function function?
  (func
   [parameters (list-of identifier?)]
   [bodies (list-of expression?)]
   [env  environment?]))
;; function


;; continuation
(define-datatype continuation continuation?
  [equ?-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [add-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [sub-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [call-cont
   (vals (list-of expval?))
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [if-cont
   (exp2 expression?)
   (exp3 expression?)
   (env environment?)
   (cont continuation?)]
  [let-cont
   (vals (list-of expval?))
   (vars (list-of identifier?))
   (exps (list-of expression?))
   (bodies (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [letrec-cont
   (refs (list-of reference?))
   (exps (list-of expression?))
   (bodies (list-of expression?))
   (env environment?)
   (cont continuation?)]
  [set-cont
   (ref reference?)
   (cont continuation?)]
  [begin-cont
   (exps (list-of expression?))
   (env environment?)
   (cont continuation?)]

  ;; Exception continuation
  [except-end]
  [raise-cont
   (cont continuation?)]
  [try-cont
   (var identifier?)
   (except-exp expression?)
   (env environment?)
   (normal-cont continuation?)
   (cont continuation?)]

  ;; Thread
  [end-main-thread-cont]
  [end-subthread-cont]
  [spawn-cont
   (exp expression?)
   (env environment?)
   (cont continuation?)]
  [wait-cont
   (cont continuation?)]
  [signal-cont
   (cont continuation?)]
  [wait-ending-cont
   (cont continuation?)]

  ;; Other
  [print-cont
   (cont continuation?)])
;; continuation


;; expressed value
(define-datatype expval expval?
  [num-val
   (num number?)]
  [bool-val
   (bool boolean?)]
  [func-val
   (func function?)]
  [cont-val
   (cont continuation?)])

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

(define expval->cont
  (lambda (val)
    (cases expval val
      [cont-val (cont) cont]
      [else (extract-expval-error val 'cont-val)])))

(define expval->any
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func]
      [cont-val (cont) cont])))
;; expressed value