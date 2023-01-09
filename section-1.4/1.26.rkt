#lang eopl


;; Exercise 1.26
(define up
  (lambda (lst)
    (letrec
        ([f (lambda (ls)
              (cond
                [(null? ls) '()]
                [(list? (car ls))
                 (g (car ls) (cdr ls))]
                [else
                 (cons (car ls)
                       (f (cdr ls)))]))]
         [g (lambda (pre nex)
              (if (null? pre)
                  (f nex)
                  (cons (car pre)
                        (g (cdr pre) nex))))])
      (f lst))))

;; test
(up '((x (y)) z))