#lang eopl


(require "help.rkt"
         "data-types.rkt"
         "ast-types.rkt")

(provide empty-subst extend-subst
         apply-subst-to-type
         unifier)


(define empty-subst (lambda () '()))


(define extend-subst
  (lambda (t-var t subst)
    (append subst (llist t-var t))))


(define apply-one-subst
  (lambda (t0 t-var t1)
    (cases data-type t0
      [Any () (Any)]
      [Int () (Int)]
      [Bool () (Bool)]
      [Function
       (args result)
       (Function
        (map (lambda (arg)
               (apply-one-subst arg t-var t1))
             args)
        (apply-one-subst result t-var t1))]
      [List () (List)]
      [Tvar
       (sn)
       (if (equal? t0 t-var) t1 t0)])))


(define apply-subst-to-type
  (lambda (subst t)
    (cases data-type t
      [Any () (Any)]
      [Int () (Int)]
      [Bool () (Bool)]
      [Function
       (args result)
       (Function
        (map (lambda (arg)
               (apply-subst-to-type subst arg))
             args)
        (apply-subst-to-type subst result))]
      [List () (List)]
      [Tvar
       (sn)
       (let ([tmp (assoc t subst)])
         (if (boolean? tmp)
             t
             (apply-subst-to-type subst (second tmp))))])))


(define unifier
  (lambda (t1 t2 subst exp)
    (set! t1 (apply-subst-to-type subst t1))
    (set! t2 (apply-subst-to-type subst t2))
    (cond
      [(equal? t1 t2) subst]
      [(and (not (Tvar? t1)) (Any? t2))
       subst]
      [(and (not (Tvar? t2)) (Any? t1))
       subst]
      [(Tvar? t1)
       (if (no-occurrence? t1 t2)
           (extend-subst t1 t2 subst)
           (report-violation t1 t2 exp))]
      [(Tvar? t2)
       (if (no-occurrence? t2 t1)
           (extend-subst t2 t1 subst)
           (report-violation t2 t1 exp))]
      [(and (Function? t1) (Function? t2))
       (map (lambda (arg1 arg2)
              (set! subst (unifier arg1 arg2 subst exp)))
            (Function->args t1)
            (Function->args t2))
       (set! subst (unifier (Function->result t1)
                            (Function->result t2)
                            subst exp))
       subst]
      [else
       (eopl:error 'unifier
                   "unification failure -> ~s and ~s in expression ~s"
                   t1 t2 exp)])))


(define no-occurrence?
  (lambda (t-var t)
    (cases data-type t
      [Any () #t]
      [Int () #t]
      [Bool () #t]
      [Function
       (args result)
       (and (every? (lambda (b) (if b #t #f))
                    (map (lambda (arg) (no-occurrence? t-var arg))
                         args))
            (no-occurrence? t-var result))]
      [List () #t]
      [Tvar
       (sn)
       (not (equal? t-var t))])))


(define report-violation
  (lambda (t1 t2 exp)
    (eopl:error 'unifier
                "no-occurrence violation -> ~s and ~s in expression ~s"
                t1 t2 exp)))