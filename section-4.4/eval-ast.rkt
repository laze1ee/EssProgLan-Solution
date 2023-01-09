#lang eopl


(require "ast-types.rkt"
         "arrays.rkt"
         "func-env-expval.rkt"
         "translation.rkt"
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
       (eval-extended-syntax exp env)]
      [(array-syntax? exp)
       (eval-array-syntax exp env)])))


(define eval-core-syntax
  (lambda (exp env)
    (cases core-syntax exp
      [num-exp
       (num)
       (num-val num)]
      [bool-exp
       (bool)
       (bool-val bool)]
      [nameless-var-exp
       (num)
       (deref (apply-refenv env num))]
      [nameless-func-exp
       (num body)
       (func-val (func num body env))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator env))]
             [refs (newref* (eval-exps rands env))])
         (apply-func f refs))]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 env))
           (value-of exp2 env)
           (value-of exp3 env))]
      [nameless-assign-exp
       (var exp)
       (let ([val (value-of exp env)])
         (setref! (apply-refenv env var) val)
         'void)]
      [block-exp
       (exps exp)
       (eval-exps exps env)
       (value-of exp env)]
      [else
       (report-invalid-exp 'eval-core-syntax exp)])))

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
       (num body saved-env)
       (if (= (length refs) num)
           (value-of body (extend-refenv* refs saved-env))
           (eopl:error 'apply-func
                       "parameters mismatch, expected: ~s, given: ~s"
                       num (length refs)))])))


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
      [nameless-let-exp
       (exps body)
       (let ([refs (newref* (eval-exps exps env))])
         (value-of body (extend-refenv* refs env)))]
      [nameless-letrec-exp
       (exps body)
       (let* ([refs (newref* (make-list (length exps) #f))]
              [new-env (extend-refenv* refs env)])
         (set-funcs! refs exps new-env)
         (value-of body new-env))]
      [else
       (report-invalid-exp 'eval-extended-syntax exp)])))

(define make-list
  (lambda (n val)
    (if (= n 0)
        '()
        (cons val (make-list (- n 1) val)))))

(define set-funcs!
  (lambda (refs exps env)
    (when (not (null? refs))
      (setref! (car refs) (value-of (car exps) env))
      (set-funcs! (cdr refs) (cdr exps) env))))


(define eval-array-syntax
  (lambda (exp env)
    (cases array-syntax exp
      [new-arr-exp
       (exp1 exp2)
       (let ([num (expval->num (value-of exp1 env))]
             [val (value-of exp2 env)])
         (arr-val (new-arr num val)))]
      [arr-ref-exp
       (exp1 exp2)
       (let ([arr (expval->arr (value-of exp1 env))]
             [num (expval->num (value-of exp2 env))])
         (arr-ref arr num))]
      [arr-set-exp
       (exp1 exp2 exp3)
       (let ([arr (expval->arr (value-of exp1 env))]
             [num (expval->num (value-of exp2 env))]
             [val (value-of exp3 env)])
         (arr-set! arr num val))]
      [arr-length-exp
       (exp1)
       (let ([arr (expval->arr (value-of exp1 env))])
         (arr-length arr))])))