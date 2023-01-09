#lang eopl


(require "help.rkt")

(provide data-type
         Any Int Bool Function Tvar List
         Any? Tvar? Function? Function->args Function->result
         option-type option-type?
         unknow-type a-type option->dtype fresh-tvar)


(define-datatype data-type data-type?
  [Any]
  [Int]
  [Bool]
  [Function
   (args (list-of data-type?))
   (result data-type?)]
  [List]
  [Tvar
   (sn number?)])


(define Any?
  (lambda (d)
    (cases data-type d
      [Any () #t]
      [else #f])))

(define Tvar?
  (lambda (d)
    (cases data-type d
      [Tvar (sn) #t]
      [else #f])))

(define Function?
  (lambda (d)
    (cases data-type d
      [Function (args result) #t]
      [else #f])))


(define Function->args
  (lambda (d)
    (cases data-type d
      [Function (args result) args]
      [else
       (eopl:error 'Function->args
                   err-invalid-type d)])))


(define Function->result
  (lambda (d)
    (cases data-type d
      [Function (args result) result]
      [eles
       (eopl:error 'Function->result
                   err-invalid-type d)])))



(define-datatype option-type option-type?
  [unknow-type]
  [a-type
   (t data-type?)])


(define option->dtype
  (lambda (o)
    (cases option-type o
      [unknow-type () (fresh-tvar)]
      [a-type (t) t])))


(define fresh-tvar
  (let ([sn -1])
    (lambda ()
      (set! sn (+ sn 1))
      (Tvar sn))))