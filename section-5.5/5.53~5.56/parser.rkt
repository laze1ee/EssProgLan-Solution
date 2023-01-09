#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt")

(provide ast-of)


(define report-error
  (lambda (exp)
    (eopl:error 'ast-of "Invalid expression: ~s~%" exp)))

(define ast-of
  (lambda (sexp)
    (if (list? sexp)
        (cond
          [(proc-exp? sexp)
           (func-exp (list-ref sexp 1)
                     (parse-exps (list-tail sexp 2)))]
          
          [(equ?-exp? sexp)
           (equ?-exp (ast-of (list-ref sexp 1))
                     (ast-of (list-ref sexp 2)))]
          [(add-exp? sexp)
           (add-exp (parse-exps (cdr sexp)))]
          [(sub-exp? sexp)
           (sub-exp (parse-exps (cdr sexp)))]
          
          [(call-exp? sexp)
           (call-exp (ast-of (car sexp))
                     (parse-exps (cdr sexp)))]

          [(set-exp? sexp)
           (set-exp (list-ref sexp 1)
                    (ast-of (list-ref sexp 2)))]
          
          [(if-exp? sexp)
           (if-exp (ast-of (list-ref sexp 1))
                   (ast-of (list-ref sexp 2))
                   (ast-of (list-ref sexp 3)))]
          
          [(let-exp? sexp)
           (let-exp (parse-bounds (list-ref sexp 1))
                    (parse-exps (list-tail sexp 2)))]
          
          [(letrec-exp? sexp)
           (letrec-exp (parse-bounds (list-ref sexp 1))
                       (parse-exps (list-tail sexp 2)))]

          [(begin-exp? sexp)
           (begin-exp (parse-exps (cdr sexp)))]
          
          [(raise-exp? sexp)
           (raise-exp (ast-of (cadr sexp)))]
          
          [(try-exp? sexp)
           (try-exp (ast-of (list-ref sexp 1))
                    (list-ref sexp 2)
                    (ast-of (list-ref sexp 3)))]

          [(letcc-exp? sexp)
           (letcc-exp (list-ref sexp 1)
                      (parse-exps (list-tail sexp 2)))]

          [(spawn-exp? sexp)
           (spawn-exp (ast-of (list-ref sexp 1)))]
          [(mutex-exp? sexp)
           (mutex-exp)]
          [(wait-exp? sexp)
           (wait-exp (ast-of (list-ref sexp 1)))]
          [(signal-exp? sexp)
           (signal-exp (ast-of (list-ref sexp 1)))]
          [(wait-ending-exp? sexp)
           (wait-ending-exp (ast-of (list-ref sexp 1)))]

          [(print-exp? sexp)
           (print-exp (ast-of (list-ref sexp 1)))]
          
          [else (report-error sexp)])
        
        (cond
          [(number? sexp) (num-exp sexp)]
          [(boolean? sexp) (bool-exp sexp)]
          [(identifier? sexp) (var-exp sexp)]
          [else (report-error sexp)]))))


(define proc-exp?
  (lambda (sexp)
    (and (eq? 'proc (car sexp))
         (<= 3 (length sexp)))))

(define equ?-exp?
  (lambda (sexp)
    (and (eq? 'equ? (car sexp))
         (= 3 (length sexp)))))

(define add-exp?
  (lambda (sexp)
    (and (eq? '+ (car sexp))
         (<= 1 (length sexp)))))

(define sub-exp?
  (lambda (sexp)
    (and (eq? '- (car sexp))
         (<= 2 (length sexp)))))

(define call-exp?
  (lambda (sexp)
    (and (or (identifier? (car sexp))
             (and (list? (car sexp)) (proc-exp? (car sexp))))
         (<= 1 (length sexp)))))

(define set-exp?
  (lambda (sexp)
    (and (eq? 'set! (car sexp))
         (= 3 (length sexp)))))

(define if-exp?
  (lambda (sexp)
    (and (eq? 'if (car sexp))
         (= 4 (length sexp)))))

(define let-exp?
  (lambda (sexp)
    (and (eq? 'let (car sexp))
         (<= 3 (length sexp)))))

(define letrec-exp?
  (lambda (sexp)
    (and (eq? 'letrec (car sexp))
         (<= 3 (length sexp)))))

(define begin-exp?
  (lambda (sexp)
    (and (eq? 'begin (car sexp))
         (<= 1 (length sexp)))))

(define raise-exp?
  (lambda (sexp)
    (and (eq? 'raise (car sexp))
         (= 2 (length sexp)))))

(define try-exp?
  (lambda (sexp)
    (and (eq? 'try (car sexp))
         (= 4 (length sexp))
         (identifier? (list-ref sexp 2)))))

(define letcc-exp?
  (lambda (sexp)
    (and (eq? 'letcc (car sexp))
         (<= 3 (length sexp)))))

(define spawn-exp?
  (lambda (sexp)
    (and (eq? 'spawn (car sexp))
         (= 2 (length sexp)))))

(define mutex-exp?
  (lambda (sexp)
    (and (eq? 'mutex (car sexp))
         (= 1 (length sexp)))))

(define wait-exp?
  (lambda (sexp)
    (and (eq? 'wait (car sexp))
         (= 2 (length sexp)))))

(define signal-exp?
  (lambda (sexp)
    (and (eq? 'signal (car sexp))
         (= 2 (length sexp)))))

(define wait-ending-exp?
  (lambda (sexp)
    (and (eq? 'wait-ending (car sexp))
         (= 2 (length sexp)))))

(define print-exp?
  (lambda (sexp)
    (and (eq? 'print (car sexp))
         (= 2 (length sexp)))))


(define parse-exps
  (lambda (exps)
    (if (null? exps)
        '()
        (cons (ast-of (car exps))
              (parse-exps (cdr exps))))))

(define parse-bounds
  (lambda (exps)
    (if (null? exps)
        '()
        (cons (list (caar exps)
                    (ast-of (cadar exps)))
              (parse-bounds (cdr exps))))))