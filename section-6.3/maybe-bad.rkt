#lang eopl


;; define continuation as expression value
;; just like func-val


(define-datatype expval expval?
  ...
  [cont-val
   (cont continuation?)]
  ...
  )


(define-datatype continuation continuation?
  [cont
   (vars (list-of indentifire?))
   (exp expression?)
   (env environment?)])


(define-datatype expression expression?
  ...
  [cont-exp
   (vars (list-of identifier?))
   (exp expression?)]
  ...
  )


(define apply-cont
  (lambda (cont vals)
    (cases continuation (expval->cont cont)
      (vars exp env)
      (value-of exp
                (extend-env* vars vals)))))