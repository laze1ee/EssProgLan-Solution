#lang eopl


(require "help.rkt"
         "match.rkt"
         "ast-types.rkt")

(provide ast-of)



(define syn-eq? '(= e1 e2))
(define syn-sum '(+ e ...))
(define syn-diff '(- e1 e2 ...))

(define syn-def '(def id e))
(define syn-func '(func (id ...) e1 e2 ...))
(define syn-call1 '(id e ...))
(define syn-call2 '((func (id ...) e1 e2 ...) e ...))
(define syn-if '(if e1 e2 e3))
(define syn-begin '(begin e1 e2 ...))
(define syn-set '(set! id e))

(define syn-let '(let ([id e] ...) e1 e2 ...))
(define syn-letrec '(letrec ([id e] ...) e1 e2 ...))
(define syn-print '(print e))

(define syn-imports '(imports id1 id2 ...))
(define syn-lib1 '(library id (exports id1 id2 ...) e1 e2 ...))
(define syn-lib2 '(library
                   id
                   (imports id1 id2 ...) (exports id1 id2 ...)
                   e1 e2 ...))



(define ast-of
  (lambda (codes)
    (a-program
     (map ast-of-exp codes))))


(define ast-of-exp
  (lambda (sexp)
    (if (list? sexp)
        (ast-of-list sexp)
        (ast-of-atom sexp))))


(define ast-of-atom
  (lambda (atom)
    (cond
      [(number? atom) (num-exp atom)]
      
      [(boolean? atom) (bool-exp atom)]
      
      [(identifier? atom)
       (let* ([str (symbol->string atom)]
              [idx (string-contains str ":")])
         (if (null? idx)
             (var-exp atom)
             (let* ([first (car idx)]
                    [i (car first)]
                    [j (list-ref first (sub1 (length first)))])
               (if (and (= 1 (length idx))
                        (not (= 0 i))
                        (not (= j (sub1 (string-length str)))))
                   (libvar-exp
                    (string->symbol (substring str 0 i))
                    (string->symbol (substring str (add1 j))))
                   (eopl:error 'ast-of-atom
                               "invalid library variable name ~s"
                               atom)))))]
      [else
       (eopl:error 'ast-of-atom err-invalid-syntax atom)])))


(define ast-of-list
  (lambda (sexp)
    (cond
      [(match? syn-eq? sexp)
       (eq?-exp (ast-of-exp (1st sexp))
                (ast-of-exp (2nd sexp)))]
      [(match? syn-sum sexp)
       (sum-exp (map ast-of-exp (cdr sexp)))]
      [(match? syn-diff sexp)
       (diff-exp (map ast-of-exp (cdr sexp)))]
      
      [(match? syn-def sexp)
       (def-exp (1st sexp)
                (ast-of-exp (2nd sexp)))]
      [(match? syn-func sexp)
       (func-exp (1st sexp)
                 (map ast-of-exp (list-tail sexp 2)))]
      [(or (match? syn-call1 sexp)
           (match? syn-call2 sexp))
       (call-exp (ast-of-exp (0th sexp))
                 (map ast-of-exp (cdr sexp)))]
      [(match? syn-if sexp)
       (if-exp (ast-of-exp (1st sexp))
               (ast-of-exp (2nd sexp))
               (ast-of-exp (3rd sexp)))]
      [(match? syn-begin sexp)
       (begin-exp (map ast-of-exp (cdr sexp)))]
      [(match? syn-set sexp)
       (set-exp (1st sexp)
                (ast-of-exp (2nd sexp)))]
      [(match? syn-let sexp)
       (let-exp (map (lambda (bound)
                       (list (0th bound)
                             (ast-of-exp (1st bound))))
                     (1st sexp))
                (map ast-of-exp (list-tail sexp 2)))]
      [(match? syn-letrec sexp)
       (letrec-exp (map (lambda (bound)
                          (list (0th bound)
                                (ast-of-exp (1st bound))))
                        (1st sexp))
                   (map ast-of-exp (list-tail sexp 2)))]

      [(match? syn-print sexp)
       (print-exp (ast-of-exp (1st sexp)))]

      [(match? syn-imports sexp)
       (imports-exp (cdr sexp))]
      [(match? syn-lib1 sexp)
       (lib-exp (1st sexp)
                (imports-exp '())
                (cdr (2nd sexp))
                (map ast-of-exp (list-tail sexp 3)))]
      [(match? syn-lib2 sexp)
       (lib-exp (1st sexp)
                (ast-of-exp (2nd sexp))
                (3rd sexp)
                (map ast-of-exp (list-tail sexp 4)))]
      [else
       (eopl:error 'ast-of-list err-invalid-syntax sexp)])))