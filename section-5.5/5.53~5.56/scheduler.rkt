#lang eopl


(require "auxiliary.rkt"
         "thread-record.rkt")

(provide init-scheduler!)


(define num-threads 'uninit)
(define IDs 'uninit)
(define record 'uninit)
(define ready-Q 'uninit)
(define waiting-Q 'uninit)
(define time-slice 'uninit)
(define remaining-time time-slice)
(define final-answer 'uninit)


(define init-scheduler!
  (lambda (slice)
    (set! num-threads 0)
    (set! IDs 0)
    (set! record (init-thread-R))
    (set! ready-Q '())
    (set! waiting-Q '())
    (set! time-slice slice)
    (set! remaining-time time-slice)))


(define threads-add1
  (lambda () (set! num-threads (+ 1 num-threads))))

(define threads-sub1
  (lambda () (set! num-threads (- num-threads 1))))


(define identifier
  (lambda ()
    (set! IDs (+ 1 IDs))
    IDs))


(define self-id
  (lambda () (vector-ref record 0)))

(define parent-id
  (lambda () (vector-ref record 1)))

(define childs-id
  (lambda () (vector-ref record 2)))


(define running-statu (lambda () 0))
(define ready-statu (lambda () 1))
(define suspend-statu (lambda () 2))

(define statu-running?
  (lambda () (= 0 (vector-ref record 3))))
(define statu-running!
  (lambda () (vector-set! record 3 (running-statu))))

(define statu-ready?
  (lambda () (= 1 (vector-ref record 3))))
(define statu-reday!
  (lambda () (vector-set! record 3 (ready-statu))))

(define statu-suspend?
  (lambda () (= 2 (vector-ref record 3))))
(define statu-suspend!
  (lambda () (vector-set! record 3 (suspend-statu))))

(define self-inbox
  (lambda () (vector-ref record 4)))

(define add-child-id!
  (lambda (id)
    (vector-set! record 2
                 (cons id (childs-id)))))

;; remove chlid id from parent record
(define remove-child-id!
  (lambda ()
    (let ([parent (exist-record? (parent-id))])
      (if parent
          (begin
           (set! parent (find-record (parent-id)))
           (vector-set! parent 1
                        (remove (self-id) (vector-ref parent 1)))
           #t)
          #f))))


(define decrement-time!
  (lambda ()
    (set! remaining-time (- remaining-time 1))))

(define reset-time!
  (lambda ()
    (set! remaining-time time-slice)))

(define time-expired?
  (lambda ()
    (= 0 remaining-time)))


(define place-on-ready-Q!
  (lambda (th)
    (set! ready-Q (enqueue ready-Q th))))

(define place-on-waiting-Q!
  (lambda (th)
    (set! waiting-Q (enqueue waiting-Q th))))


(define run-next-thread
  (lambda ()
    (cond
      [(empty-Q?)
       (print-final-answer final-answer)
       final-answer]
      [else
       (dequeue ready-Q
                (lambda (first others)
                  (set! ready-Q others)
                  (when (time-expired?)
                    (reset-time!))
                  (set! record (car first))
                  ((cadr first))))])))

(define set-final-answer!
  (lambda (val)
    (set! final-answer val)))

(define empty-Q?
  (lambda ()
    (null? ready-Q)))

(define enqueue
  (lambda (Q th)
    (append Q (list th))))

(define dequeue
  (lambda (Q f)
    (f (car Q) (cdr Q))))