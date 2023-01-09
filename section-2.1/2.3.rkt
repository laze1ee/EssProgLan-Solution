#lang eopl


(define lson
  (lambda (t)
    (cadr t)))

(define rson
  (lambda (t)
    (caddr t)))


;; Exercise 2.3
(define (zero) '(diff (one) (one)))

(define (one) '(one))

(define (is-zero? dt)
  (= 0 (evaluate dt)))

(define (evaluate dt)
  (cond
    [(null? dt) 0]
    [(eq? 'one (car dt))
     (+ 1 (evaluate (cdr dt)))]
    [(eq? 'diff (car dt))
     (- (evaluate (lson dt))
        (evaluate (rson dt)))]
    [else
     (eopl:error 'evaluate "~s is not a diff-tree." dt)]))

(define (successor dt)
  (list 'diff dt (list 'diff (zero) (one))))

(define (predecessor dt)
  (list 'diff dt (one)))

(define (diff-tree-plus dt1 dt2)
  (let ([v-dt1 (evaluate dt1)]
        [v-dt2 (evaluate dt2)])
    (cond
      [(= 0 v-dt1)
       dt2]
      [(= 0 v-dt2)
       dt1]
      [(> 0 v-dt1)
       (list 'diff dt2 (lr-swap dt1))]
      [else
       (list 'diff dt1 (lr-swap dt2))])))

(define (lr-swap dt)
  (list 'diff (rson dt) (lson dt)))

(define (make-diff n)
  (cond
    [(= n 0) (zero)]
    [(= n 1) (one)]
    [(> n 0)
     (successor (make-diff (- n 1)))]
    [else
     (predecessor (make-diff (+ n 1)))]))

;; test
(evaluate (diff-tree-plus (make-diff 3) (make-diff 4)))
