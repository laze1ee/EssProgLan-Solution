#lang eopl


(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (diff-exp
   (operand1 prefix-exp?)
   (operand2 prefix-exp?)))


;; Exercise 2.31
(define parse
  (lambda (datum)
    (let ([i 0]
          [size (length datum)])
      (let f ()
        (cond
          [(= i size)
           (eopl:error 'parse "error")]
          [else
           (let ([c (list-ref datum i)])
             (cond
               [(number? c)
                (set! i (+ i 1))
                (const-exp c)]
               [(eq? c '-)
                (set! i (+ i 1))
                (diff-exp
                 (f)
                 (f))]
               [else
                (eopl:error 'parse "error")]))])))))

;; test
(define exp
  '(- - 3 2 - 4 - 12 7))
(parse exp)