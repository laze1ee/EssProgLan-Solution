#lang eopl


(require "auxiliary.rkt")

(provide initialize-scheduler!
         place-on-ready-queue!
         run-next-thread
         set-final-answer!
         time-expired?
         decrement-timer!
         enqueue dequeue empty-queue?)


(define the-ready-queue 'uninitialized)
(define the-final-answer 'uninitialized)
(define the-max-time-slice 'uninitialized)
(define the-remaining-time 'uninitialized)


(define initialize-scheduler!
  (lambda (ticks)
    (set! the-ready-queue (init-queue))
    (set! the-final-answer 'uninitialized)
    (set! the-max-time-slice ticks)
    (set! the-remaining-time the-max-time-slice)))


(define place-on-ready-queue!
  (lambda (th)
    (set! the-ready-queue
      (enqueue the-ready-queue th))))


(define run-next-thread
  (lambda ()
    (if (empty-queue? the-ready-queue)
        (begin
         (print-final-answer the-final-answer)
         the-final-answer)
        (dequeue
         the-ready-queue
         (lambda (first others)
           (set! the-ready-queue others)
           (when (time-expired?)
             (set! the-remaining-time the-max-time-slice))
           (first))))))


(define set-final-answer!
  (lambda (val)
    (set! the-final-answer val)))


(define time-expired?
  (lambda ()
    (zero? the-remaining-time)))


(define decrement-timer!
  (lambda ()
    (set! the-remaining-time (- the-remaining-time 1))))



(define init-queue
  (lambda ()
    '()))

(define enqueue
  (lambda (queue val)
    (append queue (list val))))

(define dequeue
  (lambda (queue f)
    (f (car queue) (cdr queue))))

(define empty-queue?
  (lambda (queue)
    (null? queue)))