#lang eopl


;; Exercise 5.29
(define x 'uninitialized)
(define y 'uninitialized)

(define fact
  (lambda (n)
    (set! x n)
    (set! y 1)
    (fact-iter)))

(define fact-iter
  (lambda ()
    (if (= x 0)
        y
        (begin
         (set! y (* x y))
         (set! x (- x 1))
         (fact-iter)))))

;; test
(fact 10)