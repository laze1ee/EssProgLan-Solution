#lang eopl


(provide identifier? list-of
         expression?
         core-syntax core-syntax?
         num-exp bool-exp
         var-exp nameless-var-exp
         func-exp nameless-func-exp call-exp if-exp
         assign-exp nameless-assign-exp
         block-exp
         basic-arith basic-arith?
         =? add sub
         extended-syntax extended-syntax?
         let-exp nameless-let-exp letrec-exp nameless-letrec-exp
         array-syntax array-syntax?
         new-arr-exp arr-ref-exp arr-set-exp arr-length-exp)


;; ======
(define identifier?
  (lambda (var)
    (and (symbol? var)
         (not (eq? var 'if))
         (not (eq? var 'let)))))

(define list-of
  (lambda (pred)
    (lambda (exprs)
      (or (null? exprs)
          (and (pred (car exprs))
               ((list-of pred) (cdr exprs)))))))
;; ======


(define expression?
  (lambda (exp)
    (or (core-syntax? exp)
        (basic-arith? exp)
        (extended-syntax? exp)
        (array-syntax? exp))))

(define-datatype core-syntax core-syntax?
  (num-exp
   [num number?])
  (bool-exp
   [bool boolean?])
  (var-exp
   [var identifier?])
  (nameless-var-exp
   [num integer?])
  (func-exp
   [parameters (list-of identifier?)]
   [body expression?])
  (nameless-func-exp
   [num integer?]
   [body expression?])
  (call-exp
   [rator expression?]
   [rands (list-of expression?)])
  (if-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?])
  (assign-exp
   [var identifier?]
   [exp expression?])
  (nameless-assign-exp
   [num integer?]
   [exp expression?])
  (block-exp
   [exps (list-of expression?)]
   [exp expression?]))

(define-datatype basic-arith basic-arith?
  (=?
   [exp1 expression?]
   [exp2 expression?])
  (add
   [exp1 expression?]
   [exp2 expression?])
  (sub
   [exp1 expression?]
   [exp2 expression?]))

(define-datatype extended-syntax extended-syntax?
  (let-exp
   [bounds (list-of bound?)]
   [body expression?])
  (nameless-let-exp
   [exps (list-of expression?)]
   [body expression?])
  (letrec-exp
   [bounds (list-of bound?)]
   [body expression?])
  (nameless-letrec-exp
   [exps (list-of expression?)]
   [body expression?]))

(define bound?
  (lambda (bound)
    (and (identifier? (car bound))
         (expression? (cadr bound)))))

(define-datatype array-syntax array-syntax?
  (new-arr-exp
   [exp1 expression?]
   [exp2 expression?])
  (arr-ref-exp
   [exp1 expression?]
   [exp2 expression?])
  (arr-set-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?])
  (arr-length-exp
   [exp expression?]))