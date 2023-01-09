#lang eopl


(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt")

(provide value-of)


(define value-of
  (lambda (exp env)
    (cond
      [(core-syntax? exp)
       (eval-core-syntax exp env)]
      [(basic-arith? exp)
       (eval-basic-arith exp env)]
      [(extended-syntax? exp)
       (eval-extended-syntax exp env)])))


(define eval-core-syntax
  (lambda (exp env)
    (cases core-syntax exp
      [num-exp
       (num)
       (num-val num)]
      [bool-exp
       (bool)
       (bool-val bool)]
      [func-exp
       (vars body)
       (func-val (func vars body env))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator env))]
             [refs (eval-rands rands env)])
         (apply-func f refs))]
      [var-exp
       (var)
       (deref (apply-env env var))]
      [alias-exp
       (var)
       (apply-env env var)]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))]
      [set-exp
       (var exp)
       (let ([ref (apply-env env var)]
             [val (value-of exp env)])
         (setref! ref val))])))


(define apply-func
  (lambda (f refs)
    (cases function f
      [func
       (vars body env)
       (let ([a (length vars)]
             [b (length refs)])
         (if (not (= a b))
             (eopl:error 'apply-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)
             (value-of body (extend-env* vars refs env))))])))


(define eval-basic-arith
  (lambda (exp env)
    (cases basic-arith exp
      [equal?
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (bool-val (= num1 num2)))]
      [add
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (num-val (+ num1 num2)))]
      [sub
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (num-val (- num1 num2)))])))


(define eval-extended-syntax
  (lambda (exp env)
    (cases extended-syntax exp
      [let-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [vals (eval-exps (get-exps bounds) env)]
              [refs (newref* vals)])
         (value-of body (extend-env* vars refs env)))]
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [refs (newref* vars)]
              [new-env (extend-env* vars refs env)])
         (eval-store-one-by-one exps refs new-env)
         (value-of body new-env))]
      [begin-exp
        (exps exp1)
        (let f ([exps exps])
          (when (not (null? exps))
            (value-of (car exps) env)
            (f (cdr exps))))
        (value-of exp1 env)]

      ;; Exercise 4.37
      [call-by-value-result
       (rator rands)
       (let ([f (expval->func (value-of rator env))]
             [refs (newref* (eval-exps rands env))])
         (apply-vr-func f refs))])))

;; Exercise 4.37
;; This returns a expressed value -- reference
;; So this is a EXPLICIT-REFS
(define apply-vr-func
  (lambda (f refs)
    (cases function f
      [func
       (vars body env)
       (let ([a (length vars)]
             [b (length refs)])
         (if (not (= a b))
             (eopl:error 'apply-vr-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)
             (let* ([new-env (extend-env* vars refs env)]
                    [result (value-of body new-env)])
               (if (= a 0)
                   (ref-val (newref result))
                   (begin
                     (setref! (car refs) result)
                     (ref-val (car refs)))))))])))


(define get-vars
  (lambda (bounds)
    (if (null? bounds)
        '()
        (cons (car (car bounds))
              (get-vars (cdr bounds))))))

(define get-exps
  (lambda (bounds)
    (if (null? bounds)
        '()
        (cons (list-ref (car bounds) 1)
              (get-exps (cdr bounds))))))

(define eval-exps
  (lambda (exps env)
    (if (null? exps)
        '()
        (cons (value-of (car exps) env)
              (eval-exps (cdr exps) env)))))

(define value-of-rand
  (lambda (exp env)
    (let ([val (value-of exp env)])
      (if (reference? val)
          val
          (newref val)))))

(define eval-rands
  (lambda (exps env)
    (if (null? exps)
        '()
        (cons (value-of-rand (car exps) env)
              (eval-rands (cdr exps) env)))))

(define eval-store-one-by-one
  (lambda (exps refs env)
    (when (not (null? exps))
      (let ([val (value-of (car exps) env)])
        (setref! (car refs) val)
        (eval-store-one-by-one (cdr exps) (cdr refs) env)))))