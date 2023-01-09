#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "occur-free.rkt")

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
       ;; Exercise 3.26
       (func-val (func vars body (occur-free vars body env)))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator env))]
             [vals (eval-exps rands env)])
         (apply-func f vals))]
      [var-exp
       (var)
       (apply-env env var)]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))])))

(define apply-func
  (lambda (f vals)
    (cases function f
      [func
       (vars body env)
       (let ([a (length vars)]
             [b (length vals)])
         (if (not (= a b))
             (eopl:error 'apply-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)
             (value-of body (extend-env* vars vals env))))])))


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
             [vals (eval-exps (get-exps bounds) env)])
         (value-of body (extend-env* vars vals env)))]

      ;; Exercise 3.27
      [tracefunc-call
       (rator rands)
       (display "proc entering: ...\n")
       (let ([f (expval->func (value-of rator env))]
             [vals (eval-exps rands env)])
         (let ([return (apply-func f vals)])
           (display "... proc exiting\n")
           return))])))


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