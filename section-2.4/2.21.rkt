#lang eopl



(define scheme-value?
  (lambda (val)
    #t))

;; Exercise 2.21
(define-datatype environment environment?
  (empty-env)
  (extend-env
   [var symbol?]
   [val scheme-value?]
   [env environment?]))

(define apply-env
  (lambda (env search-var)
    (cases environment env
      [empty-env
       ()
       (eopl:error 'apply-env "No binding for ~s" search-var)]
      [extend-env
       (var val saved-env)
       (if (eq? search-var var)
           val
           (apply-env saved-env search-var))])))

(define has-binding?
  (lambda (env search-var)
    (cases environment env
      [empty-env
       ()
       #f]
      [extend-env
       (var val saved-env)
       (if (eq? search-var var)
           #t
           (has-binding? saved-env search-var))])))