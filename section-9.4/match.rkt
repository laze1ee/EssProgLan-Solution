#lang eopl


(require "help.rkt")

(provide match? string-contains)



(define find
  (lambda (t src)
    (let f ([i 0])
      (cond
        [(= i (vector-length src)) '()]
        [(eq? t (vector-ref src i))
         (cons i (f (add1 i)))]
        [else
         (f (+ i 1))]))))

(define exchange!
  (lambda (src i j)
    (let ([tmp (vector-ref src i)])
      (vector-set! src i (vector-ref src j))
      (vector-set! src j tmp))))

(define find-exchange!
  (lambda (t src)
    (let iter ([idx (find t src)])
      (when (not (null? idx))
        (exchange! src (car idx) (sub1 (car idx)))
        (iter (cdr idx))))))

(define transform
  (lambda (pat)
    (let ([v (list->vector pat)])
      (find-exchange! '... v)
      (set! pat (vector->list v))
      (let f ([pat pat])
        (cond
          [(null? pat) '()]
          [(list? (car pat))
           (cons (transform (car pat))
                 (f (cdr pat)))]
          [else
           (cons (car pat)
                 (f (cdr pat)))])))))


(define string-numeric?
  (lambda (str)
    (let f ([i 0])
      (cond
        [(= i (string-length str)) #t]
        [(char-numeric? (string-ref str i))
         (f (+ i 1))]
        [else #f]))))



(define match?
  (lambda (pat sexp)
    (match?-recur (transform pat) sexp)))

(define match?-recur
  (lambda (pat code)
    (cond
      [(and (null? pat) (null? code)) #t]
      [(null? pat) #f]
      [(eq? '... (car pat))
       (if (null? code)
           (null? (cddr pat))
           (let ([a (cadr pat)]
                 [b (car code)])
             (if (match?-atom a b)
                 (match?-recur pat (cdr code))
                 (match?-recur (cddr pat) code))))]
      [(null? code) #f]
      [(match?-atom (car pat) (car code))
       (match?-recur (cdr pat) (cdr code))]
      [else #f])))

(define match?-atom
  (lambda (a b)
    (cond
      [(and (list? a) (list? b))
       (match?-recur a b)]
      [(list? a)
       #f]
      [(keyword? a)
       (eq? a b)]
      [(pat-contain? a 'id)
       (identifier? b)]
      [(pat-contain? a 'e)
       #t]
      [else #f])))


(define pat-contain?
  (lambda (pat subpat)
    (let* ([str1 (symbol->string pat)]
           [str2 (symbol->string subpat)]
           [idx (string-contains str1 str2)])
      (if (= 1 (length idx))
          (= 0 (caar idx))
          #f))))


(define string-contains
  (lambda (str substr)
    (let ([sz1 (string-length str)]
          [sz2 (string-length substr)]
          [init (lambda (val) val)]
          [iter #f])
      (set! iter
        (lambda (i j col1 col2)
          (cond
            [(= j sz2)
             (iter i 0
                   (lambda (val) (col1 (cons (col2 '()) val)))
                   init)]
            [(= i sz1) (col1 '())]
            [(char=? (string-ref str i) (string-ref substr j))
             (iter (+ i 1) (+ j 1)
                   col1
                   (lambda (val) (col2 (cons i val))))]
            [(< 0 j)
             (iter (+ i 1) 0
                   (lambda (val) (col1 (cons (col2 '()) val)))
                   init)]
            [else
             (iter (+ i 1) j col1 col2)])))
      (if (< sz1 sz2)
          '()
          (iter 0 0 init init)))))