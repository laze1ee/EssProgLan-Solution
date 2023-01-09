#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt")

(provide trim-of)


(define refs #f)
(define init-refs
  (lambda ()
    (set! refs '())))
(define get-refs
  (lambda ()
    refs))
(define append-ref
  (lambda (ref)
    (when (not (member? ref refs))
      (set! refs (append refs (list ref))))))
(define new-ref
  (lambda (len)
    (- (+ len (length refs)) 1)))


(define trim-of
  (lambda (ast)
    (cond
      [(core-syntax? ast)
       (trim-core-syntax ast)]
      [(basic-arith? ast)
       (trim-basic-arith ast)]
      [(extended-syntax? ast)
       (trim-extended-syntax ast)])))

(define trim-core-syntax
  (lambda (ast)
    (cases core-syntax ast
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]
      [nameless-var-exp (num) (nameless-var-exp num)]
      [nameless-func-exp
       (len body)
       (trimmed-func-exp
        len (trim-func len body) (get-refs))]
      [call-exp
       (rator rands)
       (call-exp (trim-of rator) (trim-asts rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp
        (trim-of exp1) (trim-of exp2) (trim-of exp3))]
      [else
       (report-invalid-exp 'trim-core-syntax ast)])))

(define trim-basic-arith
  (lambda (ast)
    (cases basic-arith ast
      [equal?
       (exp1 exp2)
       (equal? (trim-of exp1) (trim-of exp2))]
      [add
       (exp1 exp2)
       (add (trim-of exp1) (trim-of exp2))]
      [sub
       (exp1 exp2)
       (sub (trim-of exp1) (trim-of exp2))])))

(define trim-extended-syntax
  (lambda (ast)
    (cases extended-syntax ast
      [nameless-let-exp
       (exps body)
       (nameless-let-exp
        (trim-asts exps) (trim-of body))]
      [nameless-letrec-exp
       (exps body)
       (nameless-letrec-exp
        (trim-asts exps) (trim-of body))]
      [cond-exp
       (conds)
       (cond-exp
        (trim-ast-conds conds))]
      [else
       (report-invalid-exp 'trim-extended-syntax ast)])))


;; ====================

(define trim-func
  (lambda (len body)
    (init-refs)
    (trim-func-iter len body)))

(define trim-func-iter
  (lambda (len body)
    (cond
      [(core-syntax? body)
       (trim-func-core-syntax len body)]
      [(basic-arith? body)
       (trim-func-basic-arith len body)]
      [(extended-syntax? body)
       (trim-func-extended-syntax len body)])))

(define trim-func-core-syntax
  (lambda (len body)
    (cases core-syntax body
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]
      [nameless-var-exp
       (ref)
       (nameless-var-exp
        (if (>= ref len)
            (begin
              (append-ref (- ref len))
              (new-ref len))
            ref))]
      [nameless-func-exp
       (l-len l-body)
       (nameless-func-exp
        l-len (trim-func-iter (+ len l-len) l-body))]
      [call-exp
       (rator rands)
       (call-exp (trim-func-iter len rator) (trim-func-asts len rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp
        (trim-func-iter len exp1)
        (trim-func-iter len exp2)
        (trim-func-iter len exp3))]
      [else
       (report-invalid-exp 'trim-func-core-syntax body)])))

(define trim-func-basic-arith
  (lambda (len body)
    (cases basic-arith body
      [equal?
       (exp1 exp2)
       (equal? (trim-func-iter len exp1) (trim-func-iter len exp2))]
      [add
       (exp1 exp2)
       (add (trim-func-iter len exp1) (trim-func-iter len exp2))]
      [sub
       (exp1 exp2)
       (sub (trim-func-iter len exp1) (trim-func-iter len exp2))])))

(define trim-func-extended-syntax
  (lambda (len body)
    (cases extended-syntax body
      [nameless-let-exp
       (exps body)
       (nameless-let-exp
        (trim-func-asts len exps) (trim-func-iter len body))]
      [nameless-letrec-exp
       (exps body)
       (nameless-letrec-exp
        (trim-func-asts len exps) (trim-func-iter len body))]
      [cond-exp
       (conds)
       (cond-exp
        (trim-func-ast-conds len conds))]
      [else
       (report-invalid-exp 'trim-extended-syntax body)])))


(define trim-asts
  (lambda (asts)
    (if (null? asts)
        '()
        (cons (trim-of (car asts))
              (trim-asts (cdr asts))))))

(define trim-ast-conds
  (lambda (conds)
    (if (null? conds)
        '()
        (cons
         (list (trim-of (caar conds))
               (trim-of (cadar conds)))
         (trim-ast-conds (cdr conds))))))

(define trim-func-asts
  (lambda (len asts)
    (if (null? asts)
        '()
        (cons (trim-func-iter len (car asts))
              (trim-func-asts len (cdr asts))))))

(define trim-func-ast-conds
  (lambda (len conds)
    (if (null? conds)
        '()
        (cons
         (list (trim-func-iter len (caar conds))
               (trim-func-iter len (cadar conds)))
         (trim-func-ast-conds len (cdr conds))))))


(define member?
  (lambda (a ls)
    (cond
      [(null? ls) #f]
      [(eq? a (car ls)) #t]
      [else
       (member? a (cdr ls))])))

(define report-invalid-exp
  (lambda (f exp)
    (eopl:error f "Invalid source expression: ~s" exp)))