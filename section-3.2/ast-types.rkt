#lang eopl


(provide identifier?
         expression?
         core-syntax core-syntax?
         num-exp bool-exp var-exp if-exp
         basic-arith basic-arith?
         equal? add sub minus mul div greater? less?
         extended-syntax extended-syntax?
         emptylist null?-exp cons-exp car-exp cdr-exp list-exp
         cond-exp print-exp
         let-exp let*-exp unpack-exp)


;; ======
(define identifier?
  (lambda (var)
    (and (symbol? var)
         (not (eq? var 'lambda)))))
;; ======


(define expression?
  (lambda (exp)
    (or (core-syntax? exp)
        (basic-arith? exp)
        (extended-syntax? exp))))


(define-datatype core-syntax core-syntax?
  (num-exp
   [num number?])

  ;; Exercise 3.14
  (bool-exp
   [bool boolean?])
  
  (var-exp
   [var identifier?])
  (if-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?]))


(define-datatype basic-arith basic-arith?
  (equal?
   [exp1 expression?]
   [exp2 expression?])
  (add
   [exp1 expression?]
   [exp2 expression?])
  (sub
   [exp1 expression?]
   [exp2 expression?])
  
  ;; Exercise 3.6
  (minus
   [exp expression?])
  
  ;; Exercise 3.7
  (mul
   [exp1 expression?]
   [exp2 expression?])
  (div
   [exp1 expression?]
   [exp2 expression?])
  
  ;; Exercise 3.8
  (greater?
   [exp1 expression?]
   [exp2 expression?])
  (less?
   [exp1 expression?]
   [exp2 expression?]))


(define-datatype extended-syntax extended-syntax?
  ;; Exercise 3.9
  (emptylist)
  (null?-exp
   [exp expression?])
  (cons-exp
   [exp1 expression?]
   [exp2 expression?])
  (car-exp
   [exp expression?])
  (cdr-exp
   [exp expression?])

  ;; Exercise 3.10
  (list-exp
   [exps (list-of expression?)])

  ;; Exercise 3.12
  (cond-exp
   [conds (list-of condition?)])

  ;; Exercise 3.15
  (print-exp
   [exp expression?])
  
  (let-exp
   [bounds (list-of bound?)]
   [body expression?])

  ;; Exercise 3.17
  (let*-exp
   [bounds (list-of bound?)]
   [body expression?])

  ;; Exercise 3.18
  (unpack-exp
   [vars (list-of identifier?)]
   [exps (list-of expression?)]
   [body expression?]))


(define bound?
  (lambda (bound)
    (and (identifier? (car bound))
         (expression? (cadr bound)))))

(define condition?
  (lambda (condition)
    (and (expression? (car condition))
         (expression? (cadr condition)))))