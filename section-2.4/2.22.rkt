#lang eopl


(define scheme-value?
  (lambda (val)
    #t))

;; Exercise 2.22
(define-datatype stack stack?
  (empty-stack)
  (push-stack
   [val scheme-value?]
   [s stack?]))

(define empty-stack?
  (lambda (s)
    (cases stack s
      [empty-stack () #t]
      [push-stack (val s) #f])))

(define pop-stack
  (lambda (s)
    (cases stack s
      [empty-stack
       ()
       (eopl:error 'pop-stack "empty stack.")]
      [push-stack
       (val s)
       (list val s)])))

(define top-stack
  (lambda (s)
    (cases stack s
      [empty-stack
       ()
       (eopl:error 'top-stack "empty stack.")]
      [push-stack
       (val s)
       val])))