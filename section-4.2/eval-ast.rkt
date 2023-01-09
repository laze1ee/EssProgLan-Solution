#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "store-model.rkt")

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
      [var-exp
       (var)
       (apply-env env var)]
      [func-exp
       (parameters body)
       (func-val (func parameters body env))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator env))])
         (apply-func f (eval-exps rands env)))]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))]
      [newref-exp
       (exp)
       (let ([val (value-of exp env)])
         (ref-val (newref val)))]
      [deref-exp
       (exp)
       (let ([ref (expval->ref (value-of exp env))])
         (deref ref))]
      [setref-exp
       (exp1 exp2)
       (let ([ref (expval->ref (value-of exp1 env))]
             [val (value-of exp2 env)])
         (setref! ref val))]

      ;; Exercise 4.10
      [begin-exp
        (exps exp)
        (eval-no-return-exps exps env)
        (value-of exp env)])))

(define apply-func
  (lambda (f vals)
    (cases function f
      [func
       (parameters body env)
       (let ([a (length parameters)]
             [b (length vals)])
         (if (= a b)
             (value-of body (extend-env* parameters vals env))
             (eopl:error 'apply-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)))])))

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
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [vecs (mk-vectors (length vars))]
              [new-env (extend-env* vars vecs env)])
         (set-funcs! vecs exps new-env)
         (value-of body new-env))]

      ;; Exercise 4.11
      [list-exp
       (exps)
       (let ([vals (eval-exps exps env)])
         (list-val (expval->* vals)))])))


(define expval->*
  (lambda (vals)
    (if (null? vals)
        '()
        (cons (expval->any (car vals))
              (expval->* (cdr vals))))))

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

(define eval-no-return-exps
  (lambda (exps env)
    (when (not (null? exps))
      (value-of (car exps) env)
      (eval-no-return-exps (cdr exps) env))))

(define eval-exps
  (lambda (exps env)
    (if (null? exps)
        '()
        (cons (value-of (car exps) env)
              (eval-exps (cdr exps) env)))))

(define mk-vectors
  (lambda (n)
    (if (= n 0)
        '()
        (cons (make-vector 1 0)
              (mk-vectors (- n 1))))))

(define set-funcs!
  (lambda (vecs exps env)
    (when (not (null? vecs))
      (vector-set! (car vecs) 0
                   (value-of (car exps) env))
      (set-funcs! (cdr vecs) (cdr exps) env))))