#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt"
         "translation.rkt"
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
  (lambda (exp refenv)
    (cases core-syntax exp
      [num-exp
       (num)
       (num-val num)]
      [bool-exp
       (bool)
       (bool-val bool)]
      [nameless-var-exp
       (num)
       (deref (apply-refenv refenv num))]
      [nameless-func-exp
       (num body)
       (func-val (func num body refenv))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator refenv))]
             [refs (newref* (eval-exps rands refenv))])
         (apply-func f refs))]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 refenv))
           (value-of exp2 refenv)
           (value-of exp3 refenv))]
      [nameless-assign-exp
       (var exp)
       (let ([val (value-of exp refenv)])
         (setref! (apply-refenv refenv var) val)
         'void)]
      [block-exp
       (exps exp)
       (eval-exps exps refenv)
       (value-of exp refenv)]
      [else
       (report-invalid-exp 'eval-core-syntax exp)])))

(define eval-exps
  (lambda (exps refenv)
    (if (null? exps)
        '()
        (cons (value-of (car exps) refenv)
              (eval-exps (cdr exps) refenv)))))

(define apply-func
  (lambda (f refs)
    (cases function f
      [func
       (num body refenv)
       (if (= (length refs) num)
           (value-of body (extend-refenv* refs refenv))
           (eopl:error 'apply-func
                       "parameters mismatch, expected: ~s, given: ~s"
                       num (length refs)))])))

(define eval-basic-arith
  (lambda (exp refenv)
    (cases basic-arith exp
      [=?
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 refenv))]
             [num2 (expval->num (value-of exp2 refenv))])
         (bool-val (= num1 num2)))]
      [add
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 refenv))]
             [num2 (expval->num (value-of exp2 refenv))])
         (num-val (+ num1 num2)))]
      [sub
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 refenv))]
             [num2 (expval->num (value-of exp2 refenv))])
         (num-val (- num1 num2)))])))

(define eval-extended-syntax
  (lambda (exp refenv)
    (cases extended-syntax exp
      [nameless-let-exp
       (exps body)
       (let ([refs (newref* (eval-exps exps refenv))])
         (value-of body (extend-refenv* refs refenv)))]
      [nameless-letrec-exp
       (exps body)
       (let* ([refs (newref* (make-list (length exps) #f))]
              [new-refenv (extend-refenv* refs refenv)])
         (set-funcs! refs exps new-refenv)
         (value-of body new-refenv))]
      [else
       (report-invalid-exp 'eval-extended-syntax exp)])))

(define make-list
  (lambda (n val)
    (if (= n 0)
        '()
        (cons val (make-list (- n 1) val)))))

(define set-funcs!
  (lambda (refs exps refenv)
    (when (not (null? refs))
      (setref! (car refs) (value-of (car exps) refenv))
      (set-funcs! (cdr refs) (cdr exps) refenv))))