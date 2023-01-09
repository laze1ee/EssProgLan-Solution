#lang eopl


(require "ast-types.rkt"
         "func-env-expval.rkt")

(provide occur-free)


;; Exercise 3.26
(define free-env #f)
(define init-free-env
  (lambda ()
    (set! free-env (empty-env))))


(define occur-free
  (lambda (vars body env)
    (init-free-env)
    (occur vars body env)
    free-env))


(define occur
  (lambda (vars body env)
    (cond
      [(core-syntax? body)
       (occur-core-syntax vars body env)]
      [(basic-arith? body)
       (occur-basic-arith vars body env)]
      [(extended-syntax? body)
       (occur-extended-syntax vars body env)])))


(define occur-core-syntax
  (lambda (vars body env)
    (cases core-syntax body
      [var-exp
       (var)
       (cond
         [(member? var vars)]
         [(has-binding? free-env var)]
         [(has-binding? env var)
          (set! free-env (extend-env
                          var (apply-env env var) free-env))]
         [else
          (eopl:error 'occur-free
                      "No binding for ~s" var)])]
      [call-exp
       (rator rands)
       (occur-exps vars rands env)]
      [if-exp
       (exp1 exp2 exp3)
       (occur vars exp1 env)
       (occur vars exp2 env)
       (occur vars exp3 env)]
      [else 'nothing-to-do])))


(define occur-basic-arith
  (lambda (vars body env)
    (cases basic-arith body
      [equal?
       (exp1 exp2)
       (occur vars exp1 env)
       (occur vars exp2 env)]
      [add
       (exp1 exp2)
       (occur vars exp1 env)
       (occur vars exp2 env)]
      [sub
       (exp1 exp2)
       (occur vars exp1 env)
       (occur vars exp2 env)])))


(define occur-extended-syntax
  (lambda (vars body env)
    (cases extended-syntax body
      [let-exp
       (bounds body)
       (let ([vars (append vars (get-vars bounds))]
             [exps (get-exps bounds)])
         (occur-exps vars exps env)
         (occur vars body env))]

      ;; Exercise 3.27
      [tracefunc-call
       (rator rands)
       (occur-exps vars rands env)])))


(define occur-exps
  (lambda (vars exps env)
    (when (not (null? exps))
      (occur vars (car exps) env))))

(define member?
  (lambda (a ls)
    (cond
      [(null? ls) #f]
      [(eq? (car ls) a) #t]
      [else
       (member? a (cdr ls))])))

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