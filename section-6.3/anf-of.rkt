#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt")

(provide anf-of)


(define anf-of
  (lambda (exp)
    (if (simple-exp? exp)
        (anf-of-simple-exp exp)
        (anf-of-exp exp))))


(define anf-of-exps
  (lambda (exps builder)
    (let anf-of-rest ([exps exps] [acc '()])
      (cond
        [(null? exps) (builder (reverse acc))]
        [(simple-exp? (car exps))
         (anf-of-rest (cdr exps)
                      (cons (anf-of-simple-exp (car exps))
                            acc))]
        [else
         (let ([var (fresh-identifier)])
           (let-exp (list (list var
                                (anf-of-exp (car exps))))
                    (anf-of-rest (cdr exps)
                                 (cons (var-exp var) acc))))]))))


(define simple-exp?
  (lambda (exp)
    (cases expression exp
      [num-exp (num) #t]
      [bool-exp (bool) #t]
      [func-exp (parameters body) #t]
      [eq?-exp
       (exp1 exp2)
       (and (simple-exp? exp1)
            (simple-exp? exp2))]
      [sum-exp
       (exps)
       (every? simple-exp? exps)]
      [diff-exp
       (exps)
       (every? simple-exp? exps)]
      [var-exp (var) #t]
      [else #f])))


(define anf-of-simple-exp
  (lambda (exp)
    (cases expression exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]
      [func-exp
       (parameters body)
       (func-exp parameters
                 (anf-of body))]
      [eq?-exp
       (exp1 exp2)
       (eq?-exp (anf-of-simple-exp exp1)
                (anf-of-simple-exp exp2))]
      [sum-exp
       (exps)
       (sum-exp (map anf-of-simple-exp exps))]
      [diff-exp
       (exps)
       (diff-exp (map anf-of-simple-exp exps))]
      [var-exp (var) (var-exp var)]
      [else
       (eopl:error 'anf-of-simple-exp
                   err-invalid-exp exp)])))


(define fresh-identifier
  (let ([fresh -1])
    (lambda ()
      (set! fresh (+ fresh 1))
      (string->symbol (string-append
                       "val"
                       (number->string fresh))))))


(define anf-of-exp
  (lambda (exp)
    (cases expression exp
      [eq?-exp
       (exp1 exp2)
       (anf-of-exps (list exp1 exp2)
                    (lambda (simples)
                      (eq?-exp (car simples)
                               (cadr simples))))]
      [sum-exp
       (exps)
       (anf-of-exps exps
                    (lambda (simples)
                      (sum-exp simples)))]
      [diff-exp
       (exps)
       (anf-of-exps exps
                    (lambda (simples)
                      (diff-exp simples)))]
      [call-exp
       (rator rands)
       (anf-of-exps (cons rator rands)
                    (lambda (simples)
                      (call-exp (car simples)
                                (cdr simples))))]
      [if-exp
       (exp1 exp2 exp3)
       (anf-of-exps (list exp1)
                    (lambda (simples)
                      (if-exp (car simples)
                              (anf-of exp2)
                              (anf-of exp3))))]
      [let-exp
       (bounds body)
       (let ([vars (map first bounds)]
             [exps (map second bounds)]
             [anf-exps #f]
             [anf-body #f])
         (set! anf-exps
           (map (lambda (exp)
                  (anf-of exp))
                exps))
         (set! anf-body (anf-of body))
         (let-exp (bind vars anf-exps) anf-body))]
      [letrec-exp
       (bounds body)
       (let ([vars (map first bounds)]
             [exps (map second bounds)]
             [anf-exps #f]
             [anf-body #f])
         (set! anf-exps
           (map (lambda (exp)
                  (anf-of exp))
                exps))
         (set! anf-body (anf-of body))
         (letrec-exp (bind vars anf-exps) anf-body))]
      [else
       (eopl:error 'anf-of-exp
                   err-invalid-exp exp)])))