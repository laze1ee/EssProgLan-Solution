#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "known-func.rkt")

(provide translation-of
         report-invalid-exp)


(define report-invalid-exp
  (lambda (f exp)
    (eopl:error f "Invalid source expression: ~s" exp)))


(define translation-of
  (lambda (exp senv)
    (cond
      [(core-syntax? exp)
       (translate-core-syntax exp senv)]
      [(basic-arith? exp)
       (translate-basic-arith exp senv)]
      [(extended-syntax? exp)
       (translate-extended-syntax exp senv)])))

(define translate-core-syntax
  (lambda (exp senv)
    (cases core-syntax exp
      [num-exp
       (num)
       (num-exp num)]
      [bool-exp
       (bool)
       (bool-exp bool)]
      [var-exp
       (var)
       (nameless-var-exp (apply-senv senv var))]
      [func-exp
       (parameters body)
       (nameless-func-exp
        (length parameters)
        (translation-of body (extend-senv* parameters senv)))]
      [call-exp
       (rator rands)
       (call-exp
        (translation-of rator senv)
        (translate-exps rands senv))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp
        (translation-of exp1 senv)
        (translation-of exp2 senv)
        (translation-of exp3 senv))]
      
      ;; Exercise 3.43 3.44
      [known-func
       (name parameters body)
       (let ([data (list
                    (length parameters)
                    (length senv)
                    (translation-of body (extend-senv* parameters senv)))])
         (extend-kfunc name data)
         (known-func name parameters body))]
      [call-known-func
       (rator rands)
       (let* ([f (apply-kfunc rator)]
              [len (list-ref f 0)]
              [len-env (list-ref f 1)]
              [body (list-ref f 2)])
         (nameless-known-func
          len rands (update-ref len (- (length senv) len-env) body)))]
      [else
       (report-invalid-exp 'tranlation-core-syntax exp)])))

(define translate-exps
  (lambda (exps senv)
    (if (null? exps)
        '()
        (cons (translation-of (car exps) senv)
              (translate-exps (cdr exps) senv)))))

(define translate-basic-arith
  (lambda (exp senv)
    (cases basic-arith exp
      [equal?
       (exp1 exp2)
       (equal?
        (translation-of exp1 senv)
        (translation-of exp2 senv))]
      [add
       (exp1 exp2)
       (add
        (translation-of exp1 senv)
        (translation-of exp2 senv))]
      [sub
       (exp1 exp2)
       (sub
        (translation-of exp1 senv)
        (translation-of exp2 senv))])))

(define translate-extended-syntax
  (lambda (exp senv)
    (cases extended-syntax exp
      [let-exp
       (bounds body)
       (nameless-let-exp
        (translate-exps (get-exps bounds) senv)
        (translation-of body
                        (extend-senv* (get-vars bounds) senv)))]
      [letrec-exp
       (bounds body)
       (let ([new-senv (extend-senv* (get-vars bounds) senv)])
         (nameless-letrec-exp
          (translate-exps (get-exps bounds) new-senv)
          (translation-of body new-senv)))]
      [cond-exp
       (conds)
       (cond-exp
        (translate-conds conds senv))]
      [else
       (report-invalid-exp 'tranlation-extended-syntax exp)])))

(define get-vars
  (lambda (bounds)
    (if (null? bounds)
        '()
        (cons (caar bounds)
              (get-vars (cdr bounds))))))

(define get-exps
  (lambda (bounds)
    (if (null? bounds)
        '()
        (cons (cadar bounds)
              (get-exps (cdr bounds))))))

(define translate-conds
  (lambda (conds senv)
    (if (null? conds)
        '()
        (cons
         (list (translation-of (caar conds) senv)
               (translation-of (cadar conds) senv))
         (translate-conds (cdr conds) senv)))))