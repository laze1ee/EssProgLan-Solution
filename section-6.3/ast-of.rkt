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
          [(func-exp? sexp)
           (func-exp (list-ref sexp 1)
                     (ast-of (list-ref sexp 2)))]
          
          [(eq?-exp? sexp)
           (eq?-exp (ast-of (list-ref sexp 1))
                    (ast-of (list-ref sexp 2)))]
          [(sum-exp? sexp)
           (sum-exp (parse-exps (cdr sexp)))]
          [(diff-exp? sexp)
           (diff-exp (parse-exps (cdr sexp)))]
          
          [(call-exp? sexp)
           (call-exp (ast-of (car sexp))
                     (parse-exps (cdr sexp)))]

          #|[(set-exp? sexp)
           (set-exp (list-ref sexp 1)
                    (ast-of (list-ref sexp 2)))]
          |#
          
          [(if-exp? sexp)
           (if-exp (ast-of (list-ref sexp 1))
                   (ast-of (list-ref sexp 2))
                   (ast-of (list-ref sexp 3)))]
          
          [(let-exp? sexp)
           (let-exp (parse-bounds (list-ref sexp 1))
                    (ast-of (list-ref sexp 2)))]
          
          [(letrec-exp? sexp)
           (letrec-exp (parse-bounds (list-ref sexp 1))
                       (ast-of (list-ref sexp 2)))]

          #|[(begin-exp? sexp)
           (begin-exp (parse-exps (cdr sexp)))]

          [(print-exp? sexp)
           (print-exp (ast-of (list-ref sexp 1)))]
          |#
          
          [else (report-error sexp)])
        
        (cond
          [(number? sexp) (num-exp sexp)]
          [(boolean? sexp) (bool-exp sexp)]
          [(identifier? sexp) (var-exp sexp)]
          [else (report-error sexp)]))))


(define func-exp?
  (lambda (sexp)
    (and (eq? 'func (car sexp))
         (= 3 (length sexp)))))

(define eq?-exp?
  (lambda (sexp)
    (and (eq? 'eq? (car sexp))
         (= 3 (length sexp)))))

(define sum-exp?
  (lambda (sexp)
    (and (eq? '+ (car sexp))
         (<= 1 (length sexp)))))

(define diff-exp?
  (lambda (sexp)
    (and (eq? '- (car sexp))
         (if (< 1 (length sexp))
             #t
             (eopl:error 'diff-exp
                         err-args-count "at least 1" 0)))))

(define call-exp?
  (lambda (sexp)
    (and (or (identifier? (car sexp))
             (and (list? (car sexp)) (func-exp? (car sexp))))
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
         (= 3 (length sexp)))))

(define letrec-exp?
  (lambda (sexp)
    (and (eq? 'letrec (car sexp))
         (= 3 (length sexp)))))

(define begin-exp?
  (lambda (sexp)
    (and (eq? 'begin (car sexp))
         (<= 1 (length sexp)))))

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