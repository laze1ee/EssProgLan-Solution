#lang eopl


(define pre
  (lambda (seq)
    (list-ref seq 1)))

(define nex
  (lambda (seq)
    (list-ref seq 2)))


;; Exercise 2.18
(define number->sequence
  (lambda (n)
    (list n '() '())))

(define current-element
  (lambda (seq)
    (car seq)))

(define move-to-left
  (lambda (seq)
    (let ([left (pre seq)]
          [right (nex seq)])
      (if (null? left)
          (eopl:error 'move-to-left "Already far left: ~s" seq)
          (list (car left)
                (cdr left)
                (cons (current-element seq) right))))))

(define move-to-right
  (lambda (seq)
    (let ([left (pre seq)]
          [right (nex seq)])
      (if (null? right)
          (eopl:error 'move-to-right "Already far right: ~s" seq)
          (list (car right)
                (cons (current-element seq) left)
                (cdr right))))))

(define insert-to-left
  (lambda (n seq)
    (list (current-element seq)
          (cons n (pre seq))
          (nex seq))))

(define insert-to-right
  (lambda (n seq)
    (list (current-element seq)
          (pre seq)
          (cons n (nex seq)))))