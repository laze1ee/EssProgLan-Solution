#lang eopl


;; It could be fake Exercise 2.1
(define 4-bigit
  (lambda (base n)
    (let* ([sign (if (> n 0) #t #f)]
           [n (if (> n 0) n (abs n))]
           [bg (make-4-digit base n)]
           [bg (if sign bg (complement base bg))])
      (cons base bg))))

(define make-4-digit
  (lambda (base n)
    (let f ([bg (make-list 4 0)]
            [q (quotient n base)]
            [r (remainder n base)])
      (cond
        [(null? bg) '()]
        [(and (= q 0) (= r 0)) bg]
        [else
         (cons r (f (cdr bg)
                    (quotient q base) (remainder q base)))]))))

(define complement-iter
  (lambda (base endian)
    (if (null? endian)
        '()
        (cons (- base 1 (car endian))
              (complement-iter base (cdr endian))))))

(define complement-add1
  (lambda (endian)
    (cons (+ (car endian) 1)
          (cdr endian))))

(define complement
  (lambda (base endian)
    (set! endian (complement-iter base endian))
    (set! endian (complement-add1 endian))
    (let f ([bg endian] [carry 0])
      (cond
        [(null? bg) '()]
        [else
         (let ([a (+ (car bg) carry)])
           (if (>= a base)
               (begin
                 (set! carry 1)
                 (set! a (- a base)))
               (set! carry 0))
           (cons a (f (cdr bg) carry)))]))))

(define make-list
  (lambda (n a)
    (if (= n 0)
        '()
        (cons a (make-list (- n 1) a)))))

(define base-of
  (lambda (bg)
    (car bg)))

(define endian-of
  (lambda (bg)
    (cdr bg)))

(define negtive?
  (lambda (bg)
    (= (- (base-of bg) 1)
       (list-ref (endian-of bg) 3))))

(define 4-bigit->num
  (lambda (bg)
    (let* ([sign (if (negtive? bg) #t #f)]
           [base (base-of bg)]
           [endian (endian-of bg)]
           [endian (if sign (complement base endian) endian)]
           [num (4-bigit->num-iter (cons base endian))])
      (if sign
          (* -1 num)
          num))))

(define 4-bigit->num-iter
  (lambda (bg)
    (let ([base (base-of bg)]
          [endian (endian-of bg)])
      (let f ([ls endian] [b 1])
        (if (null? ls)
            0
            (+ (* (car ls) b)
               (f (cdr ls) (* b base))))))))

;; 4-bigit
;; if base 2, range is -8 --> 7
;; if base 3, range is -27 --> 53
;; if base 10, range is -1000 --> 8999
;; ...
;; sign bit should be set in (/ base 2)
;; not (- base 1)

;; test
(4-bigit 10 -1)
(define test
  (lambda (n)
    (4-bigit 10 n)))

(map 4-bigit->num (map test '(7 9 53 -539 -9 -7)))