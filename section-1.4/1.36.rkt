#lang eopl


;; Exercise 1.36
(define number-elements
  (lambda (lst)
    (if (null? lst)
        '()
        (g (list 0 (car lst))
           (number-elements (cdr lst))))))

(define g
  (lambda (lst1 lst2)
    (let ([f #f])
      (set! f
        (lambda (lst)
          (if (null? lst)
              '()
              (cons
               (list (+ 1 (caar lst)) (cadar lst))
               (f (cdr lst))))))
      (cons lst1 (f lst2)))))

;; test
(number-elements '(a b c '(x e) '()))
    