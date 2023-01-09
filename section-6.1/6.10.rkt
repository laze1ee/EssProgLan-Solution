#lang eopl


(define list-sum
  (lambda (ls cont)
    (if (null? ls)
        (cont 0)
        (list-sum (cdr ls)
                  (lambda (val)
                    (cont (+ (car ls) val)))))))

(define end-cont
  (lambda ()
    (lambda (val) val)))


; (lambda (val) val)
;   (lambda (val) (cont (+ 5 val)))
;     (lambda (val) (cont (+ 4 val)))
;       (lambda (val) (cont (+ 3 val)))
;         (cont 2)
;       (cont (+ 3 2))
;     (cont (+ 4 5))
;   (cont (+ 5 9))
; 14


(define list-sum/a
  (lambda (ls cont)
    (if (null? ls)
        cont
        (list-sum/a (cdr ls) (+ (car ls) cont)))))

;; test
(list-sum/a '(5 6 7) 0)