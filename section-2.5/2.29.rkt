#lang eopl


(define identifier?
  (lambda (s)
    (and (symbol? s)
         (not (eq? 'lambda s)))))

;; Exercise 2.29
(define-datatype lc-exp lc-exp?
  (var-exp
   (var identifier?))
  (lambda-exp
   (bound-vars (list-of identifier?))
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rands (list-of lc-exp?))))


;; Exercise 2.30
(define parse-expression
  (lambda (datum)
    (cond
      [(identifier? datum)
       (var-exp datum)]
      [(lambda-exp? datum)
       (lambda-exp (cadr datum)
                   (parse-expression (caddr datum)))]
      [(or (identifier? (car datum))
           (lambda-exp? (car datum)))
       (app-exp
        (parse-expression (car datum))
        (multi-lc-exp (cdr datum)))]
      [else
       (eopl:error 'parse-expression "syntactic error: ~a" datum)])))

(define multi-lc-exp
  (lambda (datum)
    (if (null? datum)
        '()
        (cons (parse-expression (car datum))
              (multi-lc-exp (cdr datum))))))

(define lambda-exp?
  (lambda (exp)
    (and (eq? (car exp) 'lambda)
         (= (length exp) 3)
         (list? (cadr exp)))))
