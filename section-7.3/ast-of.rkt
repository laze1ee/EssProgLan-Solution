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
        (map (lambda (dcl)
               (list
                (ast-of-datatype (car dcl))
                (list-ref dcl 1)))
             (list-ref sexp 1))
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
               (let ([dcl (car bound)]
                     [exp (list-ref bound 2)])
                 (when (list? dcl)
                   (set! exp (trans-func (car dcl) exp)))
                 (list (ast-of-datatype dcl)
                       (list-ref bound 1)
                       (ast-of exp))))
             (list-ref sexp 1))
        (ast-of (list-ref sexp 2)))]
      [(letrec-exp? sexp)
       (letrec-exp
        (map (lambda (bound)
               (let ([dcl (car bound)]
                     [exp (list-ref bound 2)])
                 (when (list? dcl)
                   (set! exp (trans-func (car dcl) exp)))
                 (list (ast-of-datatype dcl)
                       (list-ref bound 1)
                       (ast-of exp))))
             (list-ref sexp 1))
        (ast-of (list-ref sexp 2)))]

      [(begin-exp? sexp)
       (begin-exp (map ast-of (cdr sexp)))]

      [(set-exp? sexp)
       (set-exp (let ([var (list-ref sexp 1)])
                  (if (symbol? var)
                      var
                      (ast-of var)))
                (ast-of (list-ref sexp 2)))]

      [(ann-exp? sexp)
       (ann-exp (list-ref sexp 1)
                (ast-of-datatype (list-ref sexp 2)))]

      [(print-exp? sexp)
       (print-exp (ast-of (list-ref sexp 1)))]

      [(letcc-exp? sexp)
       (letcc-exp (list-ref sexp 1)
                  (map ast-of (list-tail sexp 2)))]

      [(throw-exp? sexp)
       (throw-exp (ast-of (list-ref sexp 1))
                  (ast-of (list-ref sexp 2)))]

      [else
       (eopl:error 'ast-of err-invalid-exp sexp)])))


(define ast-of-atom
  (lambda (atom)
    (cond
      [(number? atom) (num-exp atom)]
      [(boolean? atom) (bool-exp atom)]
      [(identifier? atom) (var-exp atom)]
      [else
       (eopl:error 'ast-of err-invalid-exp atom)])))


(define ast-of-datatype
  (lambda (t)
    (cond
      [(eq? 'Int t) (Int)]
      [(eq? 'Bool t) (Bool)]
      [(list? t)
       (Function (map ast-of-datatype (car t))
                 (ast-of-datatype (list-ref t 1)))]
      [else
       (eopl:error 'ast-of-data-type
                   err-invalid-type t)])))

(define trans-func
  (lambda (types f)
    (let ([parameters (list-ref f 1)])
      (set! parameters
        (map (lambda (type parameter)
               (list type parameter))
             types parameters))
      (list 'func parameters (list-ref f 2)))))


(define func-exp?
  (lambda (sexp)
    (and (eq? 'func (car sexp))
         (if (>= 2 (length sexp))
             (eopl:error 'func-exp
                         err-invalid-syntax sexp)
             #t))))


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


(define letcc-exp?
  (lambda (sexp)
    (and (eq? 'letcc (car sexp))
         (if (> 3 (length sexp))
             (eopl:error 'letcc-exp
                         err-invalid-syntax sexp)
             #t)
         (identifier? (list-ref sexp 1)))))


(define throw-exp?
  (lambda (sexp)
    (and (eq? 'throw (car sexp))
         (= 3 (length sexp)))))


(define parse-bounds
  (lambda (exps)
    (if (null? exps)
        '()
        (cons (list (caar exps)
                    (ast-of (cadar exps)))
              (parse-bounds (cdr exps))))))