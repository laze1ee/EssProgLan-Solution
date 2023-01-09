#lang eopl


(define list-sum
  (lambda (loi)
    (if (null? loi)
        0
        (+ (list-sum (cdr loi))
           (car loi)))))


(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))

(define list-sum-2
  (lambda (cont loi)
    (if (null? loi)
        (cont 0)
        (list-sum-2 (lambda (val)
                      (cont (+ val (car loi))))
                    (cdr loi)))))


;; test
(list-sum-2 (end-cont) '(5 7 9 6 0 5))