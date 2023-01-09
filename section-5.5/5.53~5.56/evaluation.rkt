#lang eopl

(require "ast-types.rkt"
         "environment.rkt"
         "func-cont-expval.rkt"
         "store-model.rkt"
         "thread-record.rkt"
         "scheduler.rkt")

(provide value-of-program)


(define exp 'uninit)
(define env 'uninit)


(define value-of-program
  (lambda (pgm slice)
    (cases program pgm
      [a-program
       (exp1)
       (init-store!)
       (init-scheduler!)
       (set! exp exp1)
       (set! env (init-env))
       (value-of/k (end-main-thread-cont))])))


(define value-of/k
  (lambda (cont)
    ...
    [spawn-exp
     (exp1)
     (apply-cont (spawn-cont exp1 env cont) (identifier))]
    ...
    ))

(define apply-cont
  (lambda (cont val)
    ...
    [end-main-thread-cont
     ()
     (set-final-answer! val)
     (run-next-thread)]
    [end-subthread-cont
     ()
     (remove-child-id!)
     (remove-record! (self-id))
     (run-next-thread)]
    ...
    [spawn-cont
     (exp1 saved-env saved-cont)
     (threads-add1)
     (add-child-id! val record)
     (place-on-ready-Q!
      (list (new-info val (self-id) '() (ready-statu) '())
            (lambda ()
              (set! exp exp1)
              (set! env saved-env)
              (value-of/k saved-cont))))]
    [else
     (eopl:error 'apply-cont invalid-cont cont)]))