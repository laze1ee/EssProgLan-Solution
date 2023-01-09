#lang eopl


(require "1.31.rkt"
         "1.32.rkt")


;; Exercise 1.33
(define mark-leaves-with-red-depth
  (lambda (x)
    (cond
      [(leaf? x) x]
      [(or (list? (lson x))
           (list? (rson x)))
       (interior-node
        'red
        (mark-leaves-with-red-depth (lson x))
        (mark-leaves-with-red-depth (rson x)))]
      [else x])))

;; test
(mark-leaves-with-red-depth tree)