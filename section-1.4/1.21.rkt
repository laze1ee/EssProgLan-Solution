#lang eopl


;; Exercise 1.21
(define product
  (lambda (sos1 sos2)
    (let ([f #f] [g #f])
      (set! f
        (lambda (sos1)
          (if (null? sos1)
              '()
              (begin
                (set! g
                  (lambda (sos2)
                    (if (null? sos2)
                        (f (cdr sos1))
                        (cons (list (car sos1) (car sos2))
                              (g (cdr sos2))))))
                (g sos2)))))
      (f sos1))))


(define product1
  (lambda (sos1 sos2)
    (letrec
        ([f (lambda (s1)
              (if (null? s1)
                  '()
                  (g s1 sos2)))]
         [g (lambda (s1 s2)
              (if (null? s2)
                  (f (cdr s1))
                  (cons (list (car s1) (car s2))
                        (g s1 (cdr s2)))))])
      (f sos1))))


;; test
(product '(a b) '(1 2 3))
(product1 '(a b) '(1 2 3))