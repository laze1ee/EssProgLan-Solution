#lang eopl


(define list-sum
  (lambda (loi)
    (if (null? loi)
        0
        (+ (car loi)
           (list-sum (cdr loi))))))


(define list-sum-1
  (lambda (loi cont)
    (if (null? loi)
        (apply-cont cont 0)
        (list-sum-1 (cdr loi)
                    (list-sum-cont (car loi) cont)))))

(define apply-cont
  (lambda (cont val)
    (cont val)))

(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))

(define list-sum-cont
  (lambda (n cont)
    (lambda (val)
      (apply-cont cont (+ n val)))))


(define list-sum-2
  (lambda (loi cont)
    (if (null? loi)
        (cont 0)
        (list-sum-2 (cdr loi)
                    (lambda (val)
                      (cont (+ (car loi) val)))))))


;; test
(list-sum-2 '(5 7 9 6 0 5) (end-cont))