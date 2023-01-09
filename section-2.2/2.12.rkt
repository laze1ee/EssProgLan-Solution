#lang eopl


;; Exercise 2.12
(define empty-stack
  (lambda ()
    (lambda ()
      (eopl:error "empty stack."))))

(define push
  (lambda (val stack)
    (list (lambda ()
            (list val stack))
          (lambda ()
            val))))

(define pop
  (lambda (stack)
    ((car stack))))

(define top
  (lambda (stack)
    ((cadr stack))))

;; test
(define stack
  (push 9
        (push 7
              (list (empty-stack) (empty-stack)))))