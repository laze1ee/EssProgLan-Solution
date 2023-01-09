#lang eopl


(require "help.rkt"
         "ast-types.rkt")


(define empty-subst (lambda () '()))


(define extend-subst
  (lambda (subst tvar ty)
    (cons (cons tvar ty) subst)))


(define apply-one-subst
  (lambda (t0 t-var t1)
    (cases datatype t0
      [Int () (Int)]
      [Bool () (Bool)]
      [Function
       (args result)
       (Function
        (map (lambda (arg)
               (apply-one-subst arg t-var t1))
             args)
        (apply-one-subst result t-var t1))]
      [Tvar
       (sn)
       (if (equal? t0 t-var) t1 t0)])))


(define apply-subst-to-type
  (lambda (subst t)
    (cases datatype t
      [Int () (Int)]
      [Bool () (Bool)]
      [Function
       (args result)
       (Function
        (map (lambda (arg)
               (apply-subst-to-type arg subst))
             args)
        (apply-subst-to-type result subst))]
      [Tvar
       (sn)
       (let ([tmp (assoc t subst)])
         (if (boolean? tmp)
             t
             (apply-subst-to-type subst (cdr tmp))))])))


(define t (Function (list (Tvar 0) (Tvar 1)) (Tvar 2)))
(define subst (list (cons (Tvar 0) (Int))))