#lang eopl


;; Exercise 1.27
(define flatten
  (lambda (slist)
    (let ([store '()])
      (let f ([ls slist])
        (when (not (null? ls))
          (if (list? (car ls))
              (begin
                (f (car ls))
                (f (cdr ls)))
              (begin
                (set! store (append store (list (car ls))))
                (f (cdr ls))))))
      store)))

;; test
(flatten '((a b) c (((d)) e)))