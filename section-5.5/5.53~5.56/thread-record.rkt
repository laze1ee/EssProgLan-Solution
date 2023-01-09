#lang eopl


(require "auxiliary.rkt")

(provide init-thread-R
         new-record exist-record? find-record remove-record!)


(define thread-R 'uninit)


(define init-thread-R
  (lambda ()
    (new-record 0 'null '() 0 '())))

(define new-record
  (lambda (id parent childs statu inbox)
    (set! thread-R
      (cons (vector id parent childs statu inbox) thread-R))
    (car thread-R)))


(define exist-record?
  (lambda (id)
    (let f ([ls thread-R])
    (cond
      [(null? ls) #f]
      [(= id (vector-ref (car ls) 0)) #t]
      [else (f (cdr ls))]))))

(define find-record
  (lambda (id)
    (let f ([ls thread-R])
      (cond
        [(null? ls)
         (eopl:error 'find-record "No found thread id: ~s" id)]
        [(= id (vector-ref (car ls) 0))
         (car ls)]
        [else
         (f (cdr ls))]))))

(define remove-record!
  (lambda (id)
    (set! thread-R
      (let f ([ls thread-R])
        (cond
          [(null? ls)
           (eopl:error 'remove-record! "No found thread id: ~s" id)]
          [(= id (vector-ref (car ls) 0))
           (cdr ls)]
          [else
           (cons (car ls) (f (cdr ls)))])))))