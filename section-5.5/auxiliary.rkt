#lang eopl


(provide args-count-err invalid-exp-err invalid-cont-err
         print print-final-answer
         identifier? reference?
         get-vars get-exps
         member? list-head)


(define args-count-err
  "Incorrect argument count,~% expected: ~a~% given: ~a")

(define invalid-exp-err
  "Invalid expression~%  ~s")

(define invalid-cont-err
  "Invalid continuation~%  ~s")

(define print
  (lambda (val)
    (eopl:pretty-print val)))

(define print-final-answer
  (lambda (val)
    (eopl:printf "End of computation.~%")
    (print val)))

(define keywords
  '(let letrec proc if begin set! equ? + - * /
    raise try letcc spawn mutex wait signal wait-ending
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

(define list-head
  (lambda (ls i)
    (let ([sz (length ls)])
      (if (> i sz)
          (eopl:error 'list-head "index ~s is out of range for list ~s"
                      i ls)
          (let f ([i i] [ls ls])
            (if (= i 0)
                '()
                (cons (car ls)
                      (f (- i 1) (cdr ls)))))))))


(define reference?
  (lambda (ref)
    (and (integer? ref)
         (>= ref 0))))


(define get-vars
  (lambda (bounds)
    (if (null? bounds)
        '()
        (cons (caar bounds)
              (get-vars (cdr bounds))))))

(define get-exps
  (lambda (bounds)
    (if (null? bounds)
        '()
        (cons (cadar bounds)
              (get-exps (cdr bounds))))))