#lang eopl


(require "1.31.rkt")


;; Exercise 1.34
(define path
  (lambda (n bst)
    (cond
      [(null? bst) '(#f)] ;; add #f means not found
      [(< n (car bst))
       (cons 'left
             (path n (lson bst)))]
      [(> n (car bst))
       (cons 'right
             (path n (rson bst)))]
      [else '()])))

;; test
(path 17 '(14 (7 () (12 () ()))
              (26 (20 (15 () ())
                      ())
                  (31 () ()))))