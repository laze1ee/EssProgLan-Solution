#lang eopl

(require "ast-types.rkt"
         "store-model.rkt"
         "func-env-expval.rkt")

(provide result-of)


(define result-of
  (lambda (stmt env)
    (cond
      [(expression? stmt)
       (eval-exp stmt env)]
      [(statement? stmt)
       (eval-stmt stmt env)])))


(define eval-exp
  (lambda (exp env)
    (cases expression exp
      [num-exp
       (num)
       (num-val num)]
      [bool-exp
       (bool)
       (bool-val bool)]
      [not-exp
       (exp)
       (bool-val (not (expval->bool (result-of exp env))))]
      [var-exp
       (var)
       (deref (apply-env env var))]
      [func-exp
       (vars body)
       (func-val (func vars body env))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (result-of rator env))]
             [refs (newref* (eval-exps rands env))])
         (apply-func f refs))]
      [if-exp
       (exp1 exp2 exp3)
       (let ([val (result-of exp1 env)])
         (if (expval->bool val)
             (result-of exp2 env)
             (result-of exp3 env)))]
      [=?
       (exp1 exp2)
       (let ([num1 (expval->num (result-of exp1 env))]
             [num2 (expval->num (result-of exp2 env))])
         (bool-val (= num1 num2)))]
      [add
       (exp1 exp2)
       (let ([num1 (expval->num (result-of exp1 env))]
             [num2 (expval->num (result-of exp2 env))])
         (num-val (+ num1 num2)))]
      [sub
       (exp1 exp2)
       (let ([num1 (expval->num (result-of exp1 env))]
             [num2 (expval->num (result-of exp2 env))])
         (num-val (- num1 num2)))]
      [mul
       (exp1 exp2)
       (let ([num1 (expval->num (result-of exp1 env))]
             [num2 (expval->num (result-of exp2 env))])
         (num-val (* num1 num2)))])))

(define eval-exps
  (lambda (exps env)
    (if (null? exps)
        '()
        (cons (result-of (car exps) env)
              (eval-exps (cdr exps) env)))))

(define apply-func
  (lambda (f refs)
    (cases function f
      [func
       (vars body saved-env)
       (let ([env (extend-env* vars refs saved-env)])
         (result-of body env))])))

(define eval-stmt
  (lambda (stmt env)
    (cases statement stmt
      [block
       (vars stmt)
       (let* ([len (length vars)]
              [refs (newref* (make-list len 'void))]
              [new-env (extend-env* vars refs env)])
         (result-of stmt new-env))]
      [assign
       (var exp)
       (setref! (apply-env env var) (result-of exp env))]
      [multiple
       (stmts)
       (eval-stmts stmts env)]
      [while
       (exp stmt)
       (let f ()
         (when (expval->bool (result-of exp env))
           (result-of stmt env)
           (f)))]
      [print
       (exp)
       (let ([val (expval->any (result-of exp env))])
         (eopl:printf "~s\n" val))]
      [read-stmt
       (var)
       (let ([val (read)])
         (if (integer? val)
             (setref! (apply-env env var) (num-val val))
             (eopl:error 'read "Input not a integer: ~s" val)))]
      [do-while
       (stmt exp)
       (result-of stmt env)
       (let f ()
         (when (expval->bool (result-of exp env))
           (result-of stmt env)
           (f)))])))

(define make-list
  (lambda (n e)
    (if (= n 0)
        '()
        (cons e (make-list (- n 1) e)))))

(define eval-stmts
  (lambda (stmts env)
    (when (not (null? stmts))
      (result-of (car stmts) env)
      (eval-stmts (cdr stmts) env))))