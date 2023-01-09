#lang eopl


(require "ast-types.rkt")

(provide extend-kfunc apply-kfunc
         update-ref)


(define env '())

(define extend-kfunc
  (lambda (name data)
    (set! env (list name data env))))

(define apply-kfunc
  (lambda (name)
    (let f ([env env])
      (cond
        [(null? env)
         (eopl:error 'apply-kfunc "No binding for ~s" name)]
        [(eq? name (car env))
         (list-ref env 1)]
        [else
         (f (list-ref env 2))]))))


(define update-ref
  (lambda (len shift exp)
    (if (= 0 shift)
        exp
        (update-ref-iter len shift exp))))

(define update-ref-iter
  (lambda (len shift exp)
    (cond
      [(core-syntax? exp)
       (update-core-syntax len shift exp)]
      [(basic-arith? exp)
       (update-basic-arith len shift exp)]
      [(extended-syntax? exp)
       (update-extended-syntax len shift exp)])))

(define update-core-syntax
  (lambda (len shift exp)
    (cases core-syntax exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]
      [nameless-var-exp
       (ref)
       (if (>= ref len)
           (nameless-var-exp (+ ref shift))
           (nameless-var-exp ref))]
      [call-exp
       (rator rands)
       (call-exp
        (update-ref-iter len shift rator)
        (update-exps len shift rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp
        (update-ref-iter len shift exp1)
        (update-ref-iter len shift exp2)
        (update-ref-iter len shift exp3))]
      [else
       (report-invalid-exp 'update-core-syntax exp)])))


(define update-basic-arith
  (lambda (len shift exp)
    (cases basic-arith exp
      [equal?
       (exp1 exp2)
       (equal? (update-ref-iter len shift exp1)
               (update-ref-iter len shift exp2))]
      [add
       (exp1 exp2)
       (add (update-ref-iter len shift exp1)
            (update-ref-iter len shift exp2))]
      [sub
       (exp1 exp2)
       (sub (update-ref-iter len shift exp1)
            (update-ref-iter len shift exp2))])))


(define update-extended-syntax
  (lambda (shift exp)
    (cases extended-syntax exp
      [cond-exp
       (conds)
       (cond-exp
        (update-conds shift conds))]
      [else
       (report-invalid-exp 'update-extended-syntax exp)])))


(define update-exps
  (lambda (len shift exps)
    (if (null? exps)
        '()
        (cons (update-ref-iter len shift (car exps))
              (update-exps shift (cdr exps))))))

(define update-conds
  (lambda (len shift conds)
    (if (null? conds)
        '()
        (cons
         (list (update-ref-iter len shift (caar conds))
               (update-ref-iter len shift (cadar conds)))
         (update-conds len shift (cdr conds))))))


(define report-invalid-exp
  (lambda (f exp)
    (eopl:error f "Invalid source expression: ~s" exp)))