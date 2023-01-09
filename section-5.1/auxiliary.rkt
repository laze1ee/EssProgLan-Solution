#lang eopl


(provide identifier? member? list-head
         args-count-error
         collect-1
         get-vars get-exps)


(define keywords
  '(let letrec if begin set! equ? + - * /))


(define member?
  (lambda (a la)
    (cond
      [(null? la) #f]
      [(eq? a (car la)) #t]
      [else (member? a (cdr la))])))

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

(define identifier?
  (lambda (s)
    (and (symbol? s)
         (not (member? s keywords)))))


(define args-count-error
  "Incorrect argument count,~% expected: ~a~% given: ~a")


(define collect-1
  (lambda (a)
    a))


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