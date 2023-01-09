#lang eopl


(require "help.rkt"
         "ast-types.rkt"
         "type-env.rkt")

(provide type-of-program type-of)


(define type-of-program
  (lambda (pgm)
    (cases program pgm
      (a-program (exp1) (type-of exp1 (init-tenv))))))


(define type-of
  (lambda (exp tenv)
    (cases expression exp
      [num-exp (num) (Int)]
      [bool-exp (bool) (Bool)]
      [func-exp
       (parameters body)
       (let ([ts (map first parameters)]
             [vars (map second parameters)])
         (Function
          ts (type-of body (extend-tenv* vars ts tenv))))]
      
      [eq?-exp
       (exp1 exp2)
       (let ([t1 (type-of exp1 tenv)]
             [t2 (type-of exp2 tenv)])
         (check-equal-type! t1 (Int) exp1)
         (check-equal-type! t2 (Int) exp2)
         (Bool))]
      [sum-exp
       (exps)
       (map (lambda (exp)
              (check-equal-type!
               (type-of exp tenv) (Int) exp))
            exps)
       (Int)]
      [diff-exp
       (exps)
       (map (lambda (exp)
              (check-equal-type!
               (type-of exp tenv) (Int) exp))
            exps)
       (Int)]
      
      [var-exp (var) (apply-tenv tenv var)]
      [call-exp
       (rator rands)
       (let ([t (type-of rator tenv)])
         (if (not (Function? t))
             (eopl:error 'call-exp
                         "attempt to apply non-func ~s" t)
             (let ([ts (args-type t)])
               (map (lambda (t1 rand)
                      (check-equal-type!
                       t1 (type-of rand tenv) rand))
                    ts rands)
               (result-type t))))]
      [if-exp
       (exp1 exp2 exp3)
       (let ([t1 (type-of exp1 tenv)]
             [t2 (type-of exp2 tenv)]
             [t3 (type-of exp3 tenv)])
         (check-equal-type! t1 (Bool) exp1)
         (check-equal-type! t2 t3 (list exp2 exp3))
         t2)]
      [let-exp
       (bounds body)
       (let ([ts (map first bounds)]
             [vars (map second bounds)])
         (map (lambda (t1 exp)
                (let ([t2 (type-of exp tenv)])
                  (check-equal-type! t1 t2 exp)))
              ts (map third bounds))
         (type-of body (extend-tenv* vars ts tenv)))]
      [letrec-exp
       (bounds body)
       (let ([ts (map first bounds)]
             [vars (map second bounds)])
         (set! tenv (extend-tenv* vars ts tenv))
         (map (lambda (t1 exp)
                (let ([t2 (type-of exp tenv)])
                  (check-equal-type! t1 t2 exp)))
              ts (map third bounds))
         (type-of body tenv))]

      [set-exp
       (var exp)
       (let ([t1 (type-of var tenv)]
             [t2 (type-of exp tenv)])
         (check-equal-type! t1 t2 exp))]
      [ann-exp
       (var type)
       (set-tenv! var type)
       type]
      
      [else
       (eopl:error 'type-of err-invalid-exp exp)])))


(define args-type
  (lambda (type)
    (cases datatype type
      [Function (args result) args]
      [else
       (eopl:error 'args-type
                   err-invalid-type type)])))

(define result-type
  (lambda (type)
    (cases datatype type
      [Function (args result) result]
      [else
       (eopl:error 'retrun-type
                   err-invalid-type type)])))


(define Function?
  (lambda (t)
    (cases datatype t
      [Function (args result) #t]
      [else #f])))


(define check-equal-type!
  (lambda (t1 t2 exp)
    (when (not (equal? t1 t2))
      (eopl:error 'check-equal-type!
                  "Types didn't match: ~s != ~a in~% ~s"
                  (type-to-external-form t1)
                  (type-to-external-form t2)
                  exp))))


(define type-to-external-form
  (lambda (t)
    (cases datatype t
      [Int () 'Int]
      [Bool () 'Bool]
      [Function
       (args result)
       (list (map type-to-external-form args)
             (type-to-external-form result))])))