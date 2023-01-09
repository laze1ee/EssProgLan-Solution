#lang eopl


;; Exercise 1.12
(define subst
  (lambda (new old sexp)
    (cond
      [(null? sexp) '()]
      [(symbol? sexp)
       (if (eq? old sexp)
           new
           sexp)]
      [else
       (cons (subst new old (car sexp))
             (subst new old (cdr sexp)))])))


;; test
(subst 'n 'o '(a o (k (l (o) o) b)))