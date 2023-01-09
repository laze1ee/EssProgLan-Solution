#lang eopl


(define occurs-free?
  (lambda (exp var)
    (cond
      [(null? exp)
       #f]
      [(symbol? exp)
       (eq? var exp)]
      [(eq? (car exp) 'lambda)
       (and (not (eq? var (car (cadr exp))))
            (occurs-free? (caddr exp) var))]
      [else
       (or (occurs-free? (car exp) var)
           (occurs-free? (cdr exp) var))])))


(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))

(define occurs-free?-2
  (lambda (cont exp var)
    (cond
      [(null? exp)
       (cont #f)]
      [(symbol? exp)
       (cont (eq? var exp))]
      [(eq? (car exp) 'lambda)
       (if (eq? var (car (cadr exp)))
           (cont #f)
           (occurs-free?-2 cont (caddr exp) var))]
      [else
       (occurs-free?-2 (lambda (val1)
                         (occurs-free?-2 (lambda (val2)
                                           (cont (or val1 val2)))
                                         (cdr exp) var))
                       (car exp) var)])))

;; test
(occurs-free?-2 (end-cont) '(lambda (a) (+ a x)) 'x)