#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt")

(provide cps-of cps-of-exps)


(define cps-of
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exp1)
       (a-program
        (cps-of-exps (list exp1)
                     (lambda (simples)
                       (car simples))))])))


(define cps-of-exps
  (lambda (exps builder)
    (let cps-of-rest ([exps exps] [acc '()])
      (cond
        [(null? exps)
         (builder (reverse acc))]
        [(simple-exp? (car exps))
         (cps-of-rest (cdr exps)
                      (cons (cps-of-simple-exp (car exps))
                            acc))]
        [else
         (let ([var (fresh-identifier)])
           (cps-of-exp
            (car exps)
            (func-exp (list var)
                      (cps-of-rest (cdr exps)
                                   (cons (var-exp var) acc)))))]))))


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


(define cps-of-simple-exp
  (lambda (exp)
    (cases expression exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]
      [func-exp
       (parameters body)
       (func-exp (append parameters (list 'k%@))
                 (cps-of-exp body (var-exp 'k%@)))]
      [eq?-exp
       (exp1 exp2)
       (eq?-exp (cps-of-simple-exp exp1)
                (cps-of-simple-exp exp2))]
      [sum-exp
       (exps)
       (sum-exp (map cps-of-simple-exp exps))]
      [diff-exp
       (exps)
       (diff-exp (map cps-of-simple-exp exps))]
      [var-exp (var) (var-exp var)]
      [else
       (eopl:error 'cps-of-simple-exp
                   err-invalid-exp exp)])))


(define fresh-identifier
  (let ([fresh -1])
    (lambda ()
      (set! fresh (+ fresh 1))
      (string->symbol (string-append
                       "val"
                       (number->string fresh))))))


(define cps-of-exp
  (lambda (exp k-exp)
    (cases expression exp
      [num-exp
       (num)
       (make-send-to-cont k-exp (num-exp num))]
      [bool-exp
       (bool)
       (make-send-to-cont k-exp (bool-exp bool))]
      [func-exp
       (parameters body)
       (make-send-to-cont
        k-exp
        (func-exp (append parameters (list 'k%@))
                  (cps-of-exp body (var-exp 'k%@))))]
      [eq?-exp
       (exp1 exp2)
       (cps-of-exps (list exp1 exp2)
                    (lambda (simples)
                      (make-send-to-cont
                       k-exp
                       (eq?-exp (car simples)
                                (cadr simples)))))]
      [sum-exp
       (exps)
       (cps-of-exps exps
                    (lambda (simples)
                      (make-send-to-cont
                       k-exp
                       (sum-exp simples))))]
      [diff-exp
       (exps)
       (cps-of-exps exps
                    (lambda (simples)
                      (make-send-to-cont
                       k-exp
                       (diff-exp simples))))]
      [var-exp
       (var)
       (make-send-to-cont k-exp (var-exp var))]
      [call-exp
       (rator rands)
       (cps-of-exps (cons rator rands)
                    (lambda (simples)
                      (call-exp (car simples)
                                (append (cdr simples) (list k-exp)))))]
      [if-exp
       (exp1 exp2 exp3)
       (cps-of-exps (list exp1)
                    (lambda (simples)
                      (call-exp
                       (func-exp
                        '(K)
                        (if-exp (car simples)
                                (cps-of-exp exp2 (var-exp 'K))
                                (cps-of-exp exp3 (var-exp 'K))))
                       (list k-exp))))]
      [let-exp
       (bounds body)
       (let ([vars (map first bounds)]
             [exps (map second bounds)]
             [cps-exps #f]
             [cps-body #f])
         (set! cps-exps
           (map (lambda (exp)
                  (cps-of-exps (list exp)
                               (lambda (simples)
                                 (car simples))))
                exps))
         (set! cps-body
           (cps-of-exp body k-exp))
         (let-exp (bind vars cps-exps)
                  cps-body))]
      [letrec-exp
       (bounds body)
       (let ([vars (map first bounds)]
             [exps (map second bounds)]
             [cps-exps #f]
             [cps-body #f])
         (set! cps-exps
           (map (lambda (exp)
                  (cps-of-exps (list exp)
                               (lambda (simples)
                                 (car simples))))
                exps))
         (set! cps-body
           (cps-of-exp body k-exp))
         (letrec-exp (bind vars cps-exps)
                     cps-body))])))


(define make-send-to-cont
  (lambda (k-exp exp)
    (cases expression k-exp
      [func-exp
       (parameters body)
       (cases expression body
         [var-exp (var) exp]
         [else
          (call-exp k-exp (list exp))])]
      [else
       (call-exp k-exp (list exp))])))