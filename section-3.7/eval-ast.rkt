#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt")

(provide value-of)


(define value-of
  (lambda (exp venv)
    (cond
      [(core-syntax? exp)
       (eval-core-syntax exp venv)]
      [(basic-arith? exp)
       (eval-basic-arith exp venv)]
      [(extended-syntax? exp)
       (eval-extended-syntax exp venv)])))

(define eval-core-syntax
  (lambda (exp venv)
    (cases core-syntax exp
      [num-exp
       (num)
       (num-val num)]
      [bool-exp
       (bool)
       (bool-val bool)]
      [nameless-var-exp
       (num)
       (apply-venv venv num)]
      [nameless-func-exp
       (len body)
       (func-val (func len body venv))]
      [trimmed-func-exp
       (len body refs)
       (func-val (func len body (trim-venv refs venv)))]
      [call-exp
       (rator rands)
       (let ([f (expval->func (value-of rator venv))])
         (apply-func f (eval-exps rands venv)))]
      [if-exp
       (exp1 exp2 exp3)
       (if (expval->bool (value-of exp1 venv))
           (value-of exp2 venv)
           (value-of exp3 venv))]

      ;; Exercise 3.43 3.44
      [known-func
       (name parameters body)
       (bool-val #f)]
      [nameless-known-func
       (len rands body)
       (let ([len-rands (length rands)])
         (if (not (= len len-rands))
             (eopl:error
              'call-known-func
              "parameters mismatch, expected: ~s, given: ~s"
              len len-rands)
             (value-of body
                       (extend-venv* (eval-exps rands venv) venv))))]
      [else
       (report-invalid-exp 'eval-core-syntax exp)])))

(define eval-exps
  (lambda (exps venv)
    (if (null? exps)
        '()
        (cons (value-of (car exps) venv)
              (eval-exps (cdr exps) venv)))))

(define apply-func
  (lambda (f rands)
    (cases function f
      [func
       (num body venv)
       (if (= (length rands) num)
           (value-of body (extend-venv* rands venv))
           (eopl:error 'apply-func
                       "parameters mismatch, expected: ~s, given: ~s"
                       num (length rands)))])))

(define eval-basic-arith
  (lambda (exp venv)
    (cases basic-arith exp
      [equal?
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 venv))]
             [num2 (expval->num (value-of exp2 venv))])
         (bool-val (= num1 num2)))]
      [add
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 venv))]
             [num2 (expval->num (value-of exp2 venv))])
         (num-val (+ num1 num2)))]
      [sub
       (exp1 exp2)
       (let ([num1 (expval->num (value-of exp1 venv))]
             [num2 (expval->num (value-of exp2 venv))])
         (num-val (- num1 num2)))])))

(define eval-extended-syntax
  (lambda (exp venv)
    (cases extended-syntax exp
      [nameless-let-exp
       (exps body)
       (value-of body (extend-venv* (eval-exps exps venv) venv))]
      [nameless-letrec-exp
       (exps body)
       (let* ([vecs (mk-vectors (length exps))]
              [new-venv (extend-venv* vecs venv)])
         (set-funcs! vecs exps new-venv)
         (value-of body new-venv))]
      [cond-exp
       (conds)
       (let f ([conds conds])
         (cond
           [(null? conds)
            (eopl:error 'cond "No tests succeed.")]
           [(expval->bool (value-of (caar conds) venv))
            (value-of (cadar conds) venv)]
           [else
            (f (cdr conds))]))]
      [else
       (report-invalid-exp 'eval-extended-syntax exp)])))

(define mk-vectors
  (lambda (n)
    (if (= n 0)
        '()
        (cons (make-vector 1 0)
              (mk-vectors (- n 1))))))

(define set-funcs!
  (lambda (vecs exps venv)
    (when (not (null? vecs))
      (vector-set! (car vecs) 0
                   (value-of (car exps) venv))
      (set-funcs! (cdr vecs) (cdr exps) venv))))

(define trim-venv
  (lambda (refs venv)
    (if (null? refs)
        '()
        (cons (list-ref venv (car refs))
              (trim-venv (cdr refs) venv)))))


(define report-invalid-exp
  (lambda (f exp)
    (eopl:error f "Invalid source expression: ~s" exp)))