#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "store-model.rkt")

(provide value-of)


(define-datatype answer answer?
  (an-answer
   [val expval?]
   [store store?]))

(define apply-store
  (lambda (store ref)
    (list-ref store ref)))


(define value-of
  (lambda (exp env store)
    (cond
      [(core-syntax? exp)
       (eval-core-syntax exp env store)]
      [(basic-arith? exp)
       (eval-basic-arith exp env store)]
      [(extended-syntax? exp)
       (eval-extended-syntax exp env store)])))

(define eval-core-syntax
  (lambda (exp env store)
    (cases core-syntax exp
      [num-exp
       (num)
       (an-answer (num-val num) store)]
      [bool-exp
       (bool)
       (an-answer (bool-val bool) store)]
      [var-exp
       (var)
       (apply-store store (apply-env env var))]
      [func-exp
       (parameters body)
       (an-answer
        (func-val (func parameters body env))
        store)]
      [call-exp
       (rator rands)
       (let* ([pack (extract rator env store)]
              [f (expval->func (car pack))]
              [new-store (cadr pack)]
              [vals (eval-exps rands env store)])
         ;(eopl:printf "\n")
         ;(eopl:printf "~s\n" f)
         ;(eopl:printf "~s\n" new-store)
         ;(eopl:printf "~s\n" vals)
         (apply-func f vals new-store))]
      [if-exp
       (exp1 exp2 exp3)
       (let* ([pack (extract exp1 env store)]
              [val1 (car pack)]
              [new-store (cadr pack)])
         (if (expval->bool val1)
             (value-of exp2 env new-store)
             (value-of exp3 env new-store)))]
      [else
       (eopl:error 'eval-core-syntax
                   "Invalid expression: ~s" exp)])))

(define apply-func
  (lambda (f anws store)
    (cases function f
      [func
       (parameters body env)
       (let ([a (length parameters)]
             [b (length anws)])
         (if (= a b)
             (let ([pack (store-to parameters anws env store)])
               (value-of body (car pack) (cadr pack)))
             (eopl:error 'apply-func
                         "parameters mismatch, expected: ~s, given: ~s"
                         a b)))])))


(define eval-basic-arith
  (lambda (exp env store)
    (cases basic-arith exp
      [equal?
       (exp1 exp2)
       (let ([num1 (expval->num (extract-val exp1 env store))]
             [num2 (expval->num (extract-val exp2 env store))])
         (an-answer
          (bool-val (= num1 num2))
          store))]
      [add
       (exp1 exp2)
       (let ([num1 (expval->num (extract-val exp1 env store))]
             [num2 (expval->num (extract-val exp2 env store))])
         (an-answer
          (num-val (+ num1 num2))
          store))]
      [sub
       (exp1 exp2)
       (let ([num1 (expval->num (extract-val exp1 env store))]
             [num2 (expval->num (extract-val exp2 env store))])
         (an-answer
          (num-val (- num1 num2))
          store))])))


(define eval-extended-syntax
  (lambda (exp env store)
    (cases extended-syntax exp
      [let-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [anws (eval-exps (get-exps bounds) env store)]
              [pack (store-to vars anws env store)])
         (set! env (car pack))
         (set! store (cadr pack))
         ;(eopl:printf "~s\n" env)
         ;(eopl:printf "~s\n" store)
         (value-of body env store))]
      [else
       (eopl:error 'eval-extended-syntax
                   "Invalid expression: ~s" exp)])))


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

(define eval-exps
  (lambda (exps env store)
    (if (null? exps)
        '()
        (cons (value-of (car exps) env store)
              (eval-exps (cdr exps) env store)))))

(define extract-val
  (lambda (exp env store)
    (let ([ans (value-of exp env store)])
      (cases answer ans
        [an-answer
         (val store)
         val]))))

(define extract
  (lambda (exp env store)
    (let ([ans (value-of exp env store)])
      (cases answer ans
        [an-answer
         (val store)
         (list val store)]))))

(define store-to
  (lambda (vars vals env store)
    (let f ([vars vars] [vals vals])
      (when (not (null? vars))
        (let ([pack (newref (car vals) store)])
          (set! env (extend-env (car vars) (car pack) env))
          (set! store (cadr pack))
          (f (cdr vars) (cdr vals)))))
    (list env store)))