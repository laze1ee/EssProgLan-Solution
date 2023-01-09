#lang eopl

#|
(define code
  '(program
    (declar
     [x 0]
     [y 1]
     [z (+ 5 6)])
    (block
     [even
      (if (equ? x 0) 1 (begin (set! x (- x 1)) (goto odd)))]
     [odd
      (if (equ? x 0) 0 (begin (set! x (- x 1)) (goto even)))])
    (goto odd)))
|#


(define exp 'uninitialized)
(define env 'uninitialized)
(define cont 'uninitialized)
(define val 'uninitialized)


(define value-of-program
  (lambda (exp1)
    (set! exp exp1)
    (set! env (init-env))
    (set! cont (end-cont))
    (value-of)))

(define value-of
  (lambda ()
    (cases expression exp
      [num-exp
       (num)
       (set! val (num-val num))
       (apply-cont)]
      [equ?-exp
       (exp1 exp2)
       (set! exp exp1)
       (set! cont (equ?-cont '() (list exp2) cont))
       (value-of)]
      [add-exp
       (exps)
       (cond
         [(null? exps)
          (set! val (num-val 0))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! cont (add-cont '() (cdr exps) cont))
          (value-of)])]
      [sub-exp
       (exps)
       (cond
         [(null? exps)
          (eopl:error 'sub-exp args-count-err "at least 1" 0)]
         [else
          (set! exp (car exps))
          (set! cont (sub-cont '() (cdr exps) cont))
          (value-of)])]
      [if-exp
       (exp1 exp2 exp3)
       (set! exp exp1)
       (set! cont (if-cont exp2 exp3 cont))
       (value-of)]
      [set-exp
       (var exp1)
       (set! exp exp1)
       (set! cont (set-cont (apply-env env var) cont))
       (value-of)]
      [begin-exp
       (exps exp1)
       (cond
         [(null? exps)
          (set! exp exp1)
          (value-of)]
         [else
          (set! exp (car exps))
          (set! cont (begin-cont (cdr exps) exp1 cont))
          (value-of)])]
      [goto-exp
       (label)
       (set! exp (apply-env env label))
       (value-of)]
      [program-exp
       (bounds blocks body)
       (init-vars bounds)
       (store-exps blocks)
       (set! exp body)
       (value-of)]
      [else #f])))


(define apply-cont
  (lambda ()
    (cases continuation cont
      [end-cont
       ()
       (eopl:printf "End of computation.~%")
       (eopl:printf "Final answer: ~s~%" val)
       val]
      [equ?-cont
       (vals exps saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! val (num-equ? vals))
          (set! cont saved-cont)
          (apply-cont)]
         [eles
          (set! exp (car exps))
          (set! cont (equ?-cont vals (cdr exps) saved-cont))
          (value-of)])]
      [add-cont
       (vals exps saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! cont saved-cont)
          (set! val (num-add vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! cont (add-cont vals (cdr exps) saved-cont))
          (value-of)])]
      [sub-cont
       (vals exps saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! cont saved-cont)
          (set! val (num-sub vals))
          (apply-cont)]
         [else
          (set! exp (car exps))
          (set! cont (sub-cont vals (cdr exps) saved-cont))
          (value-of)])]
      [if-cont
       (exp2 exp3 saved-cont)
       (if (expval->bool val)
           (set! exp exp2)
           (set! exp exp3))
       (set! cont saved-cont)
       (value-of)]
      [set-cont
       (ref saved-cont)
       (set! val (setref! ref val))
       (set! cont saved-cont)
       (apply-cont)]
      [begin-cont
       (exps exp1 saved-cont)
       (cond
         [(null? exps)
          (set! exp exp1)
          (set! cont saved-cont)
          (value-of)]
         [else
          (set! exp (car exps))
          (set! cont (begin-cont (cdr exps) exp1 saved-cont))
          (value-of)])]
      [else #f])))