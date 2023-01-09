#lang eopl


(require "ast-types.rkt"
         "env-expval.rkt")

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
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))])))


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
         (num-val (- num1 num2)))]
      [minus
       (exp1)
       (let ([num (expval->num (value-of exp1 env))])
         (num-val (- 0 num)))]
      [mul
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (num-val (* num1 num2)))]
      [div
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (if (= 0 num2)
             (eopl:error 'div "division by zero")
             (num-val (quotient num1 num2))))]
      [greater?
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (bool-val (> num1 num2)))]
      [less?
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 env))]
             [num2 (expval->num (value-of exp2 env))])
         (bool-val (< num1 num2)))])))


(define eval-extended-syntax
  (lambda (exp env)
    (cases extended-syntax exp
      ;; Exercise 3.9
      [emptylist
       ()
       (list-val '())]
      [null?-exp
       (exp1)
       (let ([lst (expval->list (value-of exp1 env))])
         (bool-val (null? lst)))]
      [cons-exp
       (exp1 exp2)
       (let ([any (expval->any (value-of exp1 env))]
             [lst (expval->list (value-of exp2 env))])
         (list-val (cons any lst)))]
      [car-exp
       (exp1)
       (let* ([lst (expval->list (value-of exp1 env))]
              [val (car lst)])
         (cond
           [(number? val) (num-val val)]
           [(boolean? val) (bool-val val)]
           [(list? val) (list-val val)]))]
      [cdr-exp
       (exp1)
       (let ([lst (expval->list (value-of exp1 env))])
         (list-val (cdr lst)))]

      ;; Exercise 3.10
      [list-exp
       (exps)
       (let ([vals (eval-exps exps env)]
             [f #f])
         (set! f
           (lambda (vals)
             (if (null? vals)
                 '()
                 (cons (expval->any (car vals))
                       (f (cdr vals))))))
         (list-val (f vals)))]

      ;; Exercise 3.12
      [cond-exp
       (conds)
       (let f ([conds conds])
         (cond
           [(null? conds)
            (eopl:error 'cond "No tests succeed.")]
           [(expval->bool (value-of (caar conds) env))
            (value-of (cadar conds) env)]
           [else
            (f (cdr conds))]))]

      ;; Exercise 3.15
      [print-exp
       (exp1)
       (let ([val (expval->any (value-of exp1 env))])
         (eopl:printf "~s\n" val))]
      
      [let-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [vals (eval-exps (get-exps bounds) env)])
         (value-of body (extend-env* vars vals env)))]

      ;; Exercise 3.17
      [let*-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [exps (get-exps bounds)])
         (value-of body (one-by-one vars exps env)))]

      ;; Exercise 3.18
      [unpack-exp
       (vars exps body)
       (if (not (= (length vars) (length exps)))
           (eopl:error 'unpack "Binding vars and exps not match.")
           (let ([vals (eval-exps exps env)])
             (value-of body (extend-env* vars vals env))))])))
         

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

(define one-by-one
  (lambda (vars exps env)
    (if (null? vars)
        env
        (one-by-one
         (cdr vars) (cdr exps)
         (extend-env (car vars) (value-of (car exps) env) env)))))