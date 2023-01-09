#lang eopl


(provide leaf leaf? interior-node lson rson contents-of)

;; Exercise 1.31
(define leaf
  (lambda (x)
    (if leaf?
        x
        (eopl:error 'leaf "~s is not a leaf" x))))

(define leaf?
  (lambda (x)
    (integer? x)))

(define interior-node
  (lambda (s l1 l2)
    (list s l1 l2)))

(define lson
  (lambda (t)
    (cadr t)))

(define rson
  (lambda (t)
    (caddr t)))

(define contents-of
  (lambda (x)
    (if (list? x)
        (car x)
        x)))