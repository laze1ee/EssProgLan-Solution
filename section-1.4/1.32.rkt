#lang eopl


(require "1.31.rkt")

(provide tree)


;; Exercise 1.32
(define double-tree
  (lambda (x)
    (if (leaf? x)
        (+ x x)
        (list (contents-of x)
              (double-tree (lson x))
              (double-tree (rson x))))))

;; test
(define tree
  (interior-node
   'a
   (interior-node
       'b (interior-node 'c 6 7) 9)
   (interior-node
    'd 4 3)))

(double-tree tree)