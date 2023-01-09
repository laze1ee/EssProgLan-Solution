#lang eopl


(provide store?
         newref deref setref!)


(define store?
  (lambda (val)
    (list? val)))


(define newref
  (lambda (val store)
    (let ([next-ref (length store)])
      (set! store (append store (list val)))
      (list next-ref store))))

(define deref
  (lambda (ref store)
    (list-ref store ref)))

(define setref!
  (lambda (store ref val)
    (let ([f 0])
      (set! f
        (lambda (store n)
          (cond
            [(null? store)
             (eopl:error 'setref! "Invalid reference ~s in ~s" ref store)]
            [(= n 0)
             (cons val (cdr store))]
            [else
             (cons (car store) (f (cdr store) (- n 1)))])))
      (f store ref))))