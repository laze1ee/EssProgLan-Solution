#lang eopl


(require "1.31.rkt"
         "1.32.rkt")


;; Exercise 1.35
(define number-leaves
  (lambda (x)
    (let ([count 0])
      (let f ([x x])
        (cond
          [(leaf? x)
           (set! count (+ count 1))
           (- count 1)]
          [else
           (interior-node
            (contents-of x)
            (f (lson x))
            (f (rson x)))])))))

;; test
(number-leaves tree)