#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt")

(provide ast-of)


(define report-error
  (lambda (exp)
    (eopl:error 'ast-of-sexpr "Invalid expression: ~s~%" exp)))

(define ast-of
  (lambda (sexp)
    (if (list? sexp)
        (cond
          [(eq? (car sexp) 'proc)     ;; proc-exp
           (func-exp (list-ref sexp 1)
                     (ast-of (list-ref sexp 2)))]
          
          [(eq? (car sexp) 'equ?)     ;; equ?-exp
           (equ?-exp (ast-of (list-ref sexp 1))
                     (ast-of (list-ref sexp 2)))]
          [(eq? (car sexp) '+)        ;; add-exp
           (add-exp (parse-exps (cdr sexp)))]
          [(eq? (car sexp) '-)        ;; sub-exp
           (sub-exp (parse-exps (cdr sexp)))]
          
          [(identifier? (car sexp))   ;; call-exp
           (call-exp (ast-of (car sexp))
                     (parse-exps (cdr sexp)))]

          [(eq? (car sexp) 'set!)     ;; set-exp
           (set-exp (list-ref sexp 1)
                    (ast-of (list-ref sexp 2)))]
          
          [(eq? (car sexp) 'if)       ;; if-exp
           (if-exp (ast-of (list-ref sexp 1))
                   (ast-of (list-ref sexp 2))
                   (ast-of (list-ref sexp 3)))]
          
          [(eq? (car sexp) 'let)      ;; let-exp
           (let-exp (parse-bounds (list-ref sexp 1))
                    (ast-of (list-ref sexp 2)))]
          
          [(eq? (car sexp) 'letrec)   ;; letrec-exp
           (letrec-exp (parse-bounds (list-ref sexp 1))
                       (ast-of (list-ref sexp 2)))]

          [(eq? (car sexp) 'begin)    ;; begin-exp
           (let* ([exps (cdr sexp)]
                  [p (- (length exps) 1)])
             (begin-exp (parse-exps (list-head exps p))
                        (ast-of (list-ref exps p))))]
          
          [else (report-error sexp)])
        (cond
          [(number? sexp) (num-exp sexp)]
          [(boolean? sexp) (bool-exp sexp)]
          [(identifier? sexp) (var-exp sexp)]
          [else (report-error sexp)]))))


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