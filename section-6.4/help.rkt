#lang eopl


(provide err-invalid-syntax err-args-count
         err-arg-type err-invalid-exp
         identifier? first second bind
         every? list-index list-set list-head make-list
         print)


(define err-invalid-syntax
  "Invalid syntax ~s")

(define err-args-count
  "Incorrect argument count,~% expected: ~a~% given: ~a")

(define err-arg-type
  "Incorrect argument type,~% expcted: ~a~% given: ~a")

(define err-invalid-exp
  "Invalid expression~%  ~s")



(define keywords
  '(func = + - * / if let letrec begin set! letcc throw
    print))

(define member?
  (lambda (a la)
    (cond
      [(null? la) #f]
      [(eq? a (car la)) #t]
      [else (member? a (cdr la))])))

(define identifier?
  (lambda (s)
    (and (symbol? s)
         (not (member? s keywords)))))

(define first
  (lambda (ls)
    (car ls)))

(define second
  (lambda (ls)
    (list-ref ls 1)))

(define bind
  (lambda (vars exps)
    (if (null? vars)
        '()
        (cons (list (car vars) (car exps))
              (bind (cdr vars) (cdr exps))))))


(define every?
  (lambda (pred? ls)
    (cond
      [(null? ls) #t]
      [(pred? (car ls))
       (every? pred? (cdr ls))]
      [else #f])))

(define list-index
  (lambda (pred? ls)
    (let f ([i 0] [ls ls])
      (cond
        [(null? ls) #f]
        [(pred? (car ls)) i]
        [else
         (f (+ i 1) (cdr ls))]))))

(define list-set
  (lambda (ls index val)
    (if (or (< index 0) (> index (length ls)))
        (eopl:error 'list-set
                    "index ~s is out of range in ~s" index ls)
        (let f ([ls ls] [i index])
          (if (= i 0)
              (cons val (cdr ls))
              (cons (car ls)
                    (f (cdr ls) (- i 1))))))))

(define list-head
  (lambda (ls index)
    (if (or (< index 0) (> index (length ls)))
        (eopl:error 'list-head
                    "index ~s is out of range in ~s" index ls)
        (let f ([ls ls] [i index])
          (if (= i 0)
              '()
              (cons (car ls)
                    (f (cdr ls) (- i 1))))))))

(define make-list
  (lambda (n val)
    (if (= n 0)
        '()
        (cons val
              (make-list (- n 1) val)))))


(define print
  (lambda (val)
    (eopl:pretty-print val)))