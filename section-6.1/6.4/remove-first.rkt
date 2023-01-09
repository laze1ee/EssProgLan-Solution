#lang eopl


(define remove-first
  (lambda (a ls)
    (cond
      [(null? ls) '()]
      [(eq? a (car ls)) (cdr ls)]
      [else
       (cons (car ls)
             (remove-first a (cdr ls)))])))


(define remove-first-1
  (lambda (a ls cont)
    (cond
      [(null? ls)
       (apply-cont cont '())]
      [(eq? a (car ls))
       (apply-cont cont (cdr ls))]
      [else
       (remove-first-1 a (cdr ls)
                       (remove-cont (car ls) cont))])))

(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))

(define remove-cont
  (lambda (e cont)
    (lambda (val)
      (apply-cont cont (cons e val)))))

(define apply-cont
  (lambda (cont val)
    (cont val)))


(define remove-first-2
  (lambda (a ls cont)
    (cond
      [(null? ls)
       (cont '())]
      [(eq? a (car ls))
       (cont (cdr ls))]
      [else
       (remove-first-2 a (cdr ls)
                       (lambda (val)
                         (cont (cons (car ls) val))))])))



(define x 'uninit)

(define remove-first-3
  (lambda (a ls)
    (set! x a)
    (rm-first-3 ls (end-cont))))

(define rm-first-3
  (lambda (ls cont)
    (cond
      [(null? ls)
       (cont '())]
      [(eq? x (car ls))
       (cont (cdr ls))]
      [else
       (rm-first-3 (cdr ls)
                   (lambda (val)
                     (cont (cons (car ls) val))))])))

;;test
(remove-first-3 'a '(4 a b c a))
