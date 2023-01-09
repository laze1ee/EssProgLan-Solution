#lang eopl


(require "auxiliary.rkt"
         "store-model.rkt"
         "scheduler.rkt")

(provide new-mutex
         wait-for-mutex signal-mutex
         wait-ending)


(define-datatype mutex mutex?
  [a-mutex
   (ref-closed? reference?)
   (ref-wait-queue reference?)])


(define new-mutex
  (lambda ()
    (a-mutex (newref #f) (newref '()))))


(define wait-for-mutex
  (lambda (m th)
    (cases mutex m
      [a-mutex
       (ref-closed? ref-wait-queue)
       (cond
         [(deref ref-closed?)
          (setref! ref-wait-queue
                   (enqueue (deref ref-wait-queue) th))
          (run-next-thread)]
         [else
          (setref! ref-closed? #t)
          (th)])])))


(define signal-mutex
  (lambda (m th)
    (cases mutex m
      [a-mutex
       (ref-closed? ref-wait-queue)
       (let ([closed? (deref ref-closed?)]
             [wait-queue (deref ref-wait-queue)])
         (when closed?
           (if (empty-queue? wait-queue)
               (setref! ref-closed? #f)
               (dequeue wait-queue
                        (lambda (first others)
                          (place-on-ready-queue! first)
                          (setref! ref-wait-queue others)))))
         (th))])))

(define wait-ending
  (lambda (m th)
    (cases mutex m
      [a-mutex
       (ref-closed? ref-wait-queue)
       (let ([closed? (deref ref-closed?)]
             [wait-queue (deref ref-wait-queue)])
         (if (and (not closed?)
                  (empty-queue? wait-queue))
             (th)
             (begin
              (place-on-ready-queue!
               (lambda ()
                 (wait-ending m th)))
              (run-next-thread))))])))