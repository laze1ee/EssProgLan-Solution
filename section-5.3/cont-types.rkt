#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt"
         "func-env-expval.rkt")

(provide continuation
         end-cont
         equ?-cont add-cont sub-cont
         call-cont if-cont let-cont letrec-cont set-cont
         begin-cont)


(define-datatype continuation continuation?
  [end-cont]
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
   (body expression?)
   (env environment?)
   (cont continuation?)]
  [letrec-cont
   (refs (list-of reference?))
   (exps (list-of expression?))
   (body expression?)
   (env environment?)
   (cont continuation?)]
  [set-cont
   (ref reference?)
   (cont continuation?)]
  [begin-cont
   (exps (list-of expression?))
   (exp expression?)
   (env environment?)
   (cont continuation?)])