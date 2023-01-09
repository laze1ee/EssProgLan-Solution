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
       (let* ([ref (apply-env env var)]
              [w (deref ref)])
         (if (expval? w)
             w
             (let ([val (value-of-thunk w)])
               (setref! ref val)
               val)))]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))]
      [set-exp
       (var exp)
       (setref! (apply-env env var)
                (value-of exp env))])))


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
       (let ([vars (get-vars bounds)]
             [refs (eval-rands (get-exps bounds) env)])
         (value-of body (extend-env* vars refs env)))])))


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

(define value-of-rand
  (lambda (exp env)
    (cond
      [(core-syntax? exp)
       (cases core-syntax exp
         [num-exp
          (num)
          (newref (num-val num))]
         [bool-exp
          (bool)
          (newref (bool-val bool))]
         [func-exp
          (vars body)
          (newref (func-val (func vars body env)))]
         [var-exp
          (var)
          (apply-env env var)]
         [else
          (newref (a-thunk exp env))])]
      [else
       (newref (a-thunk exp env))])))

(define eval-rands
  (lambda (exps env)
    (if (null? exps)
        '()
        (cons (value-of-rand (car exps) env)
              (eval-rands (cdr exps) env)))))

(define value-of-thunk
  (lambda (th)
    (cases thunk th
      [a-thunk
       (exp env)
       (value-of exp env)])))