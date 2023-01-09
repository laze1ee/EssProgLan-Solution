#lang eopl


(require "help.rkt"
         "ast-types.rkt")

(provide ast-of)



(define ast-of
  (lambda (sexp)
    (if (list? sexp)
        (ast-of-list sexp)
        (ast-of-atom sexp))))


(define ast-of-list
  (lambda (sexp)
    (cond
      [(func-exp? sexp)
       (func-exp
        (list-ref sexp 1)
        (ast-of (list-ref sexp 2)))]
          
      [(eq?-exp? sexp)
       (eq?-exp (ast-of (list-ref sexp 1))
                (ast-of (list-ref sexp 2)))]
      [(sum-exp? sexp)
       (sum-exp (map ast-of (cdr sexp)))]
      [(diff-exp? sexp)
       (diff-exp (map ast-of (cdr sexp)))]
          
      [(call-exp? sexp)
       (call-exp (ast-of (car sexp))
                 (map ast-of (cdr sexp)))]
          
      [(if-exp? sexp)
       (if-exp (ast-of (list-ref sexp 1))
               (ast-of (list-ref sexp 2))
               (ast-of (list-ref sexp 3)))]
          
      [(let-exp? sexp)
       (let-exp
        (map (lambda (bound)
               (list (first bound)
                     (ast-of (second bound))))
             (list-ref sexp 1))
        (ast-of (list-ref sexp 2)))]
      [(letrec-exp? sexp)
       (letrec-exp
        (map (lambda (bound)
               (list (first bound)
                     (ast-of (second bound))))
             (list-ref sexp 1))
        (ast-of (list-ref sexp 2)))]

      [(null?-exp? sexp)
       (null?-exp (ast-of (second sexp)))]
      [(emptylist-exp? sexp)
       (emptylist-exp)]
      [(kar-exp? sexp)
       (kar-exp (ast-of (second sexp)))]
      [(kdr-exp? sexp)
       (kdr-exp (ast-of (second sexp)))]
      [(kons-exp? sexp)
       (kons-exp (ast-of (second sexp))
                 (ast-of (third sexp)))]
      [(list-exp? sexp)
       (list-exp (map (lambda (exp) (ast-of exp))
                      (cdr sexp)))]
      [(list?-exp? sexp)
       (list?-exp (ast-of (second sexp)))]

      [(begin-exp? sexp)
       (begin-exp (map ast-of (cdr sexp)))]

      [(set-exp? sexp)
       (set-exp
        (list-ref sexp 1)
        (ast-of (list-ref sexp 2)))]

      [(print-exp? sexp)
       (print-exp (ast-of (list-ref sexp 1)))]

      [else
       (eopl:error 'ast-of-list err-invalid-exp sexp)])))


(define ast-of-atom
  (lambda (atom)
    (cond
      [(number? atom) (num-exp atom)]
      [(boolean? atom) (bool-exp atom)]
      [(identifier? atom) (var-exp atom)]
      [else
       (eopl:error 'ast-of-atom err-invalid-exp atom)])))



(define func-exp?
  (lambda (sexp)
    (and (eq? 'func (car sexp))
         (if (> 3 (length sexp))
             (eopl:error 'func-exp
                         err-invalid-syntax sexp)
             #t)
         (list? (list-ref sexp 1)))))


(define eq?-exp?
  (lambda (sexp)
    (and (eq? '= (car sexp))
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
         (identifier? (list-ref sexp 1))
         (= 3 (length sexp)))))

(define if-exp?
  (lambda (sexp)
    (and (eq? 'if (car sexp))
         (= 4 (length sexp)))))

(define let-exp?
  (lambda (sexp)
    (and (eq? 'let (car sexp))
         (if (> 3 (length sexp))
             (eopl:error 'let-exp
                         err-invalid-syntax)
             #t))))

(define letrec-exp?
  (lambda (sexp)
    (and (eq? 'letrec (car sexp))
         (if (> 3 (length sexp))
             (eopl:error 'letrec-exp
                         err-invalid-syntax)
             #t))))

(define null?-exp?
  (lambda (sexp)
    (and (eq? 'null? (car sexp))
         (= 2 (length sexp)))))

(define emptylist-exp?
  (lambda (sexp)
    (and (eq? 'emptylist (car sexp))
         (= 1 (length sexp)))))

(define kar-exp?
  (lambda (sexp)
    (and (eq? 'kar (car sexp))
         (= 2 (length sexp)))))

(define kdr-exp?
  (lambda (sexp)
    (and (eq? 'kdr (car sexp))
         (= 2 (length sexp)))))

(define kons-exp?
  (lambda (sexp)
    (and (eq? 'kons (car sexp))
         (= 3 (length sexp)))))

(define list-exp?
  (lambda (sexp)
    (and (eq? 'list (car sexp))
         (<= 1 (length sexp)))))

(define list?-exp?
  (lambda (sexp)
    (and (eq? 'list? (car sexp))
         (= 2 (length sexp)))))

(define ann-exp?
  (lambda (sexp)
    (and (eq? ':: (car sexp))
         (= 3 (length sexp)))))

(define begin-exp?
  (lambda (sexp)
    (and (eq? 'begin (car sexp))
         (if (= 1 (length sexp))
             (eopl:error 'begin-exp
                         err-invalid-syntax sexp)
             #t))))

(define print-exp?
  (lambda (sexp)
    (and (eq? 'print (car sexp))
         (= 2 (length sexp)))))