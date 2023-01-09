#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "store-model.rkt")

(provide value-of)


(define value-of
  (lambda (exp refenv)
    (cond
      [(core-syntax? exp)
       (eval-core-syntax exp refenv)]
      [(basic-arith? exp)
       (eval-basic-arith exp refenv)]
      [(extended-syntax? exp)
       (eval-extended-syntax exp refenv)])))

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
       (deref (apply-env env var))]
      [func-exp
       (parameters body)
       (func-val (func parameters body env))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator env))]
             [refs (newref* (eval-exps rands env))])
         (apply-func f refs))]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))])))

(define eval-exps
  (lambda (exps env)
    (if (null? exps)
        '()
        (cons (value-of (car exps) env)
              (eval-exps (cdr exps) env)))))

(define apply-func
  (lambda (f refs)
    (cases function f
      [func
       (parameters body env)
       (let ([a (length parameters)]
             [b (length refs)])
         (if (= a b)
             (value-of body (extend-env* parameters refs env))
             (eopl:error 'apply-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)))])))

(define eval-basic-arith
  (lambda (exp env)
    (cases basic-arith exp
      [=?
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
              [exps (get-exps bounds)]
              [refs (newref* (eval-exps exps env))])
         (value-of body (extend-env* vars refs env)))]
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [len (length vars)]
              [refs (newref* (make-list len 'void))]
              [new-env (extend-env* vars refs env)])
         (set-vars! vars exps new-env)
         (value-of body new-env))]
      [setdynamic
       (bounds body)
       (let* ([bound-vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [bound-refs (newref* (eval-exps exps env))])
         (cases core-syntax body
           [call-exp
            (rator rands)
            (let ([f (expval->func (value-of rator env))]
                  [rand-refs (newref* (eval-exps rands env))])
              (apply-dynamic-func f rand-refs bound-vars bound-refs))]
           [else
            (value-of body (extend-env* bound-vars bound-refs env))]))])))

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

(define make-list
  (lambda (n val)
    (if (= n 0)
        '()
        (cons val (make-list (- n 1) val)))))

(define set-vars!
  (lambda (vars exps new-env)
    (when (not (null? vars))
      (let ([var (car vars)]
            [val (value-of (car exps) new-env)])
        (setref! (apply-env new-env var) val)
        (set-vars! (cdr vars) (cdr exps) new-env)))))

(define apply-dynamic-func
  (lambda (f rand-refs bound-vars bound-refs)
    (cases function f
      [func
       (vars body refenv)
       (let ([a (length vars)]
             [b (length rand-refs)])
         (if (= a b)
             (value-of body
                       (extend-env*
                        vars rand-refs
                        (extend-env* bound-vars bound-refs refenv)))
             (eopl:error 'apply-dynamic-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)))])))
