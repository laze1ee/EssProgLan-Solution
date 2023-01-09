#lang eopl


(require "store-model.rkt")

(provide array array?
         new-arr arr-ref arr-set! arr-length)


(define reference?
  (lambda (ref)
    (integer? ref)))


(define-datatype array array?
  (empty-array)
  (make-array
   [size integer?]
   [first reference?]))


(define arr-length
  (lambda (a)
    (cases array a
      [empty-array () 0]
      [make-array
       (size first)
       size])))


(define new-arr
  (lambda (n val)
    (if (= n 0)
        (empty-array)
        (make-array n (fill-arr n val)))))

(define fill-arr
  (lambda (n val)
    (let ([ref (newref val)])
      (let f ([n (- n 1)])
        (if (= n 0)
            ref
            (begin
              (newref val)
              (f (- n 1))))))))


(define report-empty-array
  (lambda (f)
    (eopl:error f "Empty array")))

(define report-out-range
  (lambda (f i a)
    (eopl:error f "Out of range\n index: ~s\n in: ~s" i a)))

(define arr-ref
  (lambda (a i)
    (cases array a
      [empty-array
       ()
       (report-empty-array 'arr-ref)]
      [make-array
       (size first)
       (if (in-range? i size)
           (deref (+ first i))
           (report-out-range 'arr-ref i a))])))

(define arr-set!
  (lambda (a i val)
    (cases array a
      [empty-array
       ()
       (report-empty-array 'arr-set!)]
      [make-array
       (size first)
       (if (in-range? i size)
           (setref! (+ first i) val)
           (report-out-range 'arr-set! i a))])))


(define in-range?
  (lambda (i size)
    (if (and (<= 0 i) (< i size))
        #t
        #f)))