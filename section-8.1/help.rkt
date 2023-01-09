#lang eopl


(provide err-invalid-syntax err-args-count
         err-arg-type err-invalid-exp err-invalid-type
         keyword? identifier? 0th 1st 2nd 3rd
         add1 sub1 last
         every? list-index list-set list-head make-list llist
         print)


(define err-invalid-syntax
  "Invalid syntax~% ~s")

(define err-args-count
  "Incorrect argument count,~% expected: ~a~% given: ~a")

(define err-arg-type
  "Incorrect argument type,~% expcted: ~a~% given: ~a")

(define err-invalid-exp
  "Invalid expression~% ~s")

(define err-invalid-type
  "Invalid type~% ~s")



(define keywords
  '(def func if = + - let letrec begin set! print
        library imports exports))

(define member?
  (lambda (a la)
    (cond
      [(null? la) #f]
      [(eq? a (car la)) #t]
      [else (member? a (cdr la))])))

(define keyword?
  (lambda (word)
    (member? word keywords)))

(define identifier?
  (lambda (id)
    (and (symbol? id)
         (not (keyword? id)))))


(define 0th (lambda (ls) (car ls)))
(define 1st (lambda (ls) (list-ref ls 1)))
(define 2nd (lambda (ls) (list-ref ls 2)))
(define 3rd (lambda (ls) (list-ref ls 3)))

(define add1 (lambda (n) (+ n 1)))
(define sub1 (lambda (n) (- n 1)))


(define last
  (lambda (f ls . more)
    (let ([result #f])
      (if (null? ls)
          (eopl:error 'last
                      "at least one argument to apply,~% you given: ~s"
                      ls)
          (if (null? more)
              (do ([ls ls (cdr ls)])
                ((null? ls) result)
                (set! result (f (car ls))))
              (do ([ls ls (cdr ls)] [more more (map cdr more)])
                ((null? ls) result)
                (set! result
                  (apply f (car ls) (map car more)))))))))


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

(define llist
  (lambda x
    (list x)))


(define print
  (lambda (val)
    (eopl:pretty-print val)))