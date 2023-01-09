#lang eopl


(define-datatype thread thread?
  [apply-cont-thread
   (cont continuation?)
   (val expval?)]
  [value-of/k-thread
   (exp expression?)
   (env environment?)
   (cont continuation?)])

(define apply-thread
  (lambda (th)
    (cases thread th
      [apply-cont-thread
       (cont val)
       (apply cont val)]
      [value-of/k-thread
       (exp env cont)
       (value-of/k exp env cont)])))