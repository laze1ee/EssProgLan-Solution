#lang eopl


(define remove-first
  (lambda (ls a)
    (cond
      [(null? ls) '()]
      [(eq? a (car ls)) (cdr ls)]
      [else
       (cons (car ls)
             (remove-first (cdr ls) a))])))


(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))


(define remove-first-2
  (lambda (cont ls a)
    (cond
      [(null? ls)
       (cont '())]
      [(eq? a (car ls))
       (cont (cdr ls))]
      [else
       (remove-first-2 (lambda (val)
                         (cont (cons (car ls) val)))
                       (cdr ls) a)])))

;;test
(remove-first-2 (end-cont) '(4 a b c a) 'a)
