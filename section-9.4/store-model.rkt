#lang eopl


(provide get-store init-store!
         newref newref* deref setref!)


(define the-store 'uninitialized)


(define empty-store
  (lambda ()
    '()))

(define get-store
  (lambda ()
    the-store))

(define init-store!
  (lambda ()
    (set! the-store (empty-store))))

(define newref
  (lambda (val)
    (let ([next-ref (length the-store)])
      (set! the-store (append the-store (list val)))
      next-ref)))

(define newref*
  (lambda (vals)
    (if (null? vals)
        '()
        (cons (newref (car vals))
              (newref* (cdr vals))))))

(define deref
  (lambda (ref)
    (list-ref the-store ref)))

(define setref!
  (lambda (ref val)
    (let ([f 0])
      (set! f
        (lambda (store n)
          (cond
            [(null? store)
             (eopl:error 'setref! "Invalid reference ~s in ~s" ref the-store)]
            [(= n 0)
             (cons val (cdr store))]
            [else
             (cons (car store) (f (cdr store) (- n 1)))])))
      (set! the-store (f the-store ref)))))