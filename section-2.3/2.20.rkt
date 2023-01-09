#lang eopl


(define lson
  (lambda (t)
    (list-ref t 1)))

(define rson
  (lambda (t)
    (list-ref t 2)))


;; Exercise 2.20
(define num->nbintree
  (lambda (n)
    (list '() (list n '() '()))))

(define current
  (lambda (nbt)
    (cadr nbt)))

(define at-root?
  (lambda (nbt)
    (null? (car nbt))))

(define at-leaf?
  (lambda (nbt)
    (null? (current nbt))))

(define move-to-lson
  (lambda (nbt)
    (if (at-leaf? nbt)
        (eopl:error 'move-to-lson "current node is empty: ~s" nbt)
        (let* ([curr (current nbt)]
               [l-sn (lson curr)]
               [r-sn (rson curr)])
          (list (cons (list (car curr)
                            'crr
                            r-sn)
                      (car nbt))
                l-sn)))))

(define move-to-rson
  (lambda (nbt)
    (if (at-leaf? nbt)
        (eopl:error 'move-to-rson "current node is empty: ~s" nbt)
        (let* ([curr (current nbt)]
               [l-sn (lson curr)]
               [r-sn (rson curr)])
          (list (cons (list (car curr)
                            l-sn
                            'crr)
                      (car nbt))
                r-sn)))))
  
(define move-up
  (lambda (nbt)
    (if (at-root? nbt)
        (eopl:error 'move-up "current node is root: ~s" nbt)
        (let* ([ups (car nbt)]
               [up  (car ups)]
               [upp (cdr ups)])
          (if (eq? (lson up) 'crr)
              (list upp
                    (list (car up)
                          (current nbt)
                          (rson up)))
              (list upp
                    (list (car up)
                          (lson up)
                          (current nbt))))))))