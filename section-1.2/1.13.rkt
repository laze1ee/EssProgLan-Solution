#lang eopl


;; Exercise 1.13
(define subst
  (lambda (new old sexp)
    (let ([f #f])
      (set! f
        (lambda (sexp)
          (if (symbol? sexp)
              (if (eq? old sexp)
                  new
                  sexp)
              (map f sexp))))
      (map f sexp))))

;; test
(subst 'n 'o '(a o (k (l (o) o) b)))