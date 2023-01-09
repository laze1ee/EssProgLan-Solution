#lang eopl


(define occurs-free?
  (lambda (var exp)
    (cond
      [(null? exp)
       #f]
      [(symbol? exp)
       (eq? var exp)]
      [(eq? (car exp) 'lambda)
       (and (not (eq? var (car (cadr exp))))
            (occurs-free? var (caddr exp)))]
      [else
       (or (occurs-free? var (car exp))
           (occurs-free? var (cdr exp)))])))


(define apply-cont
  (lambda (cont val)
    (cont val)))

(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))

(define occurs-free?-1
  (lambda (var exp cont)
    (cond
      [(null? exp)
       (apply-cont cont #f)]
      [(symbol? exp)
       (apply-cont cont (eq? var exp))]
      [(eq? (car exp) 'lambda)
       (if (eq? var (car (cadr exp)))
           (apply-cont cont #f)
           (occurs-free?-1 var (caddr exp) cont))]
      [else
       (occurs-free?-1 var (car exp)
                       (next-cont var (cdr exp) cont))])))

(define body-cont
  (lambda (test cont)
    (lambda (val)
      (apply-cont cont (and test val)))))

(define next-cont
  (lambda (var exp cont)
    (lambda (val1)
      (occurs-free?-1 var exp
                      (next1-cont val1 cont)))))

(define next1-cont
  (lambda (val1 cont)
    (lambda (val2)
      (apply-cont cont (or val1 val2)))))


(define occurs-free?-2
  (lambda (var exp cont)
    (cond
      [(null? exp)
       (cont #f)]
      [(symbol? exp)
       (cont (eq? var exp))]
      [(eq? (car exp) 'lambda)
       (if (eq? var (car (cadr exp)))
           (cont #f)
           (occurs-free?-2 var (caddr exp) cont))]
      [else
       (occurs-free?-2 var (car exp)
                       (lambda (val1)
                         (occurs-free?-2 var (cdr exp)
                                         (lambda (val2)
                                           (cont (or val1 val2))))))])))

;; test
(occurs-free?-2 'x '(lambda (a) (+ a x)) (end-cont))