#lang eopl


(define tail-form?
  (lambda (s exp)
    (cases input-exp exp
      [diff-exp
       (exp1 exp2)
       #f]
      [zero?-exp
       #f]
      [call-exp
       (rator rands)
       #f]
      [if-exp
       (exp1 exp2 exp2)
       (if (or (eq? s exp2) (eq? s exp3))
           #t
           #f)]
      [let-exp
       (var exp1 body)
       (if (eq? s body)
           #t
           #f)]
      [letrec-exp
       (bounds body)
       (if (eq? s body)
           #t
           #f)]
      [else
       (eopl:error 'tail-form? "Invalid expression ~s" exp)])))