#lang eopl

(define normal-end
  (lambda ()
    (lambda (val)
      (eopl:printf "Normal end of computation.~%")
      (eopl:printf "Final answer: ~s~%" val)
      val)))

(define equ?-cont
  (lambda (vals exps saved-env saved-cont)
    (lambda ()
      (set! vals (append vals (list val)))
      (cond
        [(null? exps)
         (set! normal-cont saved-cont)
         (set! val (num-equ? vals))
         (apply-cont)]
        [else
         (set! exp (car exps))
         (set! env saved-env)
         (set! normal-cont (equ?-cont vals (cdr exps) saved-env saved-cont))
         (value-of/k)]))))