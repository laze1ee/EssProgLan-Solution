#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt"
         "environment.rkt"
         "store-model.rkt"
         "func-cont-expval.rkt"
         "mutex.rkt"
         "scheduler.rkt")

(provide value-of-program)


(define exp 'uninitialized)
(define env 'uninitialized)


(define value-of-program
  (lambda (timeslice pgm)
    (initialize-store!)
    (initialize-scheduler! timeslice)
    (cases program pgm
      [a-program
       (exp1)
       (set! exp exp1)
       (set! env (init-env))
       (value-of/k (end-main-thread-cont))])))


(define value-of/k
  (lambda (cont)
    (cond
      [(primitive? exp)
       (eval-primitive cont)]
      [(arithmetic? exp)
       (eval-arithmetic cont)]
      [(syntax? exp)
       (eval-syntax cont)])))


(define eval-primitive
  (lambda (cont)
    (cases primitive exp
      [num-exp
       (num)
       (apply-cont cont (num-val num))]
      [bool-exp
       (bool)
       (apply-cont cont (bool-val bool))]
      [func-exp
       (parameters body)
       (apply-cont cont (func-val (func parameters body env)))])))


(define eval-arithmetic
  (lambda (cont)
    (cases arithmetic exp
      [equ?-exp
       (exp1 exp2)
       (set! exp exp1)
       (value-of/k (equ?-cont '() (list exp2) env cont))]
      [add-exp
       (exps)
       (if (null? exps)
           (apply-cont cont (num-val 0))
           (begin
            (set! exp (car exps))
            (value-of/k (add-cont '() (cdr exps) env cont))))]
      [sub-exp
       (exps)
       (if (null? exps)
           (eopl:error 'sub-exp args-count-err "at least 1" 0)
           (begin
            (set! exp (car exps))
            (value-of/k (sub-cont '() (cdr exps) env cont))))])))


(define eval-syntax
  (lambda (cont)
    (cases syntax exp
      [var-exp
       (var)
       (apply-cont cont (deref (apply-env env var)))]
      [call-exp
       (rator rands)
       (set! exp rator)
       (value-of/k (call-cont '() rands env cont))]
      [if-exp
       (exp1 exp2 exp3)
       (set! exp exp1)
       (value-of/k (if-cont exp2 exp3 env cont))]
      [let-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [exps (get-exps bounds)])
         (cond
           [(null? vars)
            (set! exp (car body))
            (value-of/k (begin-cont (cdr body) env cont))]
           [else
            (set! exp (car exps))
            (value-of/k (let-cont '() vars (cdr exps) body env cont))]))]
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [refs (newref* vars)])
         (set! env (extend-env* vars refs env))
         (cond
           [(null? vars)
            (set! exp (car body))
            (value-of/k (begin-cont (cdr body) env cont))]
           [else
            (set! exp (car exps))
            (value-of/k (letrec-cont refs (cdr exps) body env cont))]))]
      [set-exp
       (var exp1)
       (set! exp exp1)
       (value-of/k (set-cont (apply-env env var) cont))]
      [begin-exp
       (exps)
       (if (null? exps)
           (apply-cont cont (num-val -21))
           (begin
            (set! exp (car exps))
            (value-of/k (begin-cont (cdr exps) env cont))))]

      [spawn-exp
       (exp1)
       (apply-cont (spawn-cont exp1 env cont) (num-val -22))]
      [mutex-exp
       ()
       (apply-cont cont (new-mutex))]
      [wait-exp
       (exp1)
       (set! exp exp1)
       (value-of/k (wait-cont cont))]
      [signal-exp
       (exp1)
       (set! exp exp1)
       (value-of/k (signal-cont cont))]
      [wait-ending-exp
       (exp1)
       (set! exp exp1)
       (value-of/k (wait-ending-cont cont))]

      [print-exp
       (exp1)
       (set! exp exp1)
       (value-of/k (print-cont cont))]
      
      [eles
       (eopl:error 'eval-syntax invalid-exp-err cont)])))


(define apply-cont
  (lambda (cont val)
    (cond
      [(time-expired?)
       (place-on-ready-queue!
        (lambda () (apply-cont cont val)))
       (run-next-thread)]
      [else
       (decrement-timer!)
       (apply-cont-help cont val)])))


(define apply-cont-help
  (lambda (cont val)
    (cases continuation cont
      [end-main-thread-cont
       ()
       (set-final-answer! val)
       (run-next-thread)]
      [end-subthread-cont
       ()
       (run-next-thread)]

      [equ?-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (if (null? exps)
           (apply-cont saved-cont (num-equ? vals))
           (begin
            (set! exp (car exps))
            (set! env saved-env)
            (value-of/k (equ?-cont vals (cdr exps) env saved-cont))))]
      [add-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (if (null? exps)
           (apply-cont saved-cont (num-add vals))
           (begin
            (set! exp (car exps))
            (set! env saved-env)
            (value-of/k (add-cont vals (cdr exps) env saved-cont))))]
      [sub-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (if (null? exps)
           (apply-cont saved-cont (num-sub vals))
           (begin
            (set! exp (car exps))
            (set! env saved-env)
            (value-of/k (sub-cont vals (cdr exps) env saved-cont))))]
      [call-cont
       (vals exps saved-env saved-cont)
       (set! vals (append vals (list val)))
       (if (null? exps)
           (apply-func/k vals saved-cont)
           (begin
            (set! exp (car exps))
            (set! env saved-env)
            (value-of/k (call-cont vals (cdr exps) env saved-cont))))]

      [if-cont
       (exp2 exp3 saved-env saved-cont)
       (if (expval->bool val)
           (set! exp exp2)
           (set! exp exp3))
       (set! env saved-env)
       (value-of/k saved-cont)]

      [let-cont
       (vals vars exps body saved-env saved-cont)
       (set! vals (append vals (list val)))
       (cond
         [(null? exps)
          (set! exp (car body))
          (set! env (extend-env* vars (newref* vals) saved-env))
          (value-of/k (begin-cont (cdr body) env saved-cont))]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (value-of/k (let-cont vals vars (cdr exps)
                                body env saved-cont))])]

      [letrec-cont
       (refs exps body saved-env saved-cont)
       (setref! (car refs) val)
       (cond
         [(null? exps)
          (set! exp (car body))
          (set! env saved-env)
          (value-of/k (begin-cont (cdr body) env saved-cont))]
         [else
          (set! exp (car exps))
          (set! env saved-env)
          (value-of/k (letrec-cont (cdr refs) (cdr exps)
                                   body env saved-cont))])]

      [set-cont
       (ref saved-cont)
       (setref! ref val)
       (apply-cont saved-cont (num-val -30))]

      [begin-cont
       (exps saved-env saved-cont)
       (if (null? exps)
           (apply-cont saved-cont val)
           (begin
            (set! exp (car exps))
            (set! env saved-env)
            (value-of/k (begin-cont (cdr exps) env saved-cont))))]

      [spawn-cont
       (exp1 saved-env saved-cont)
       (place-on-ready-queue!
        (lambda ()
          (set! exp exp1)
          (set! env saved-env)
          (value-of/k (end-subthread-cont))))
       (apply-cont saved-cont (num-val -31))]
      [wait-cont
       (saved-cont)
       (wait-for-mutex
        val
        (lambda ()
          (apply-cont saved-cont (num-val -32))))]
      [signal-cont
       (saved-cont)
       (signal-mutex
        val
        (lambda ()
          (apply-cont saved-cont (num-val -33))))]
      [wait-ending-cont
       (saved-cont)
       (wait-ending
        val
        (lambda ()
          (apply-cont saved-cont (num-val -34))))]

      [print-cont
       (saved-cont)
       (print (expval->any val))
       (apply-cont saved-cont (num-val -34))]
      
      [else
       (eopl:error 'apply-cont invalid-cont-err cont)])))


(define apply-func/k
  (lambda (vals cont)
    (let ([rator (expval->func (car vals))]
          [rands (cdr vals)])
      (cases function rator
        [func
         (parameters body saved-env)
         (let ([a (length parameters)]
               [b (length rands)])
           (if (not (= a b))
               (eopl:error 'apply-func/k args-count-err a b)
               (begin
                (set! exp (car body))
                (set! env (extend-env* parameters (newref* rands) saved-env))
                (value-of/k (begin-cont (cdr body) env cont)))))]))))

(define num-equ?
  (lambda (vals)
    (bool-val
     (= (expval->num (car vals))
        (expval->num (cadr vals))))))

(define num-add
  (lambda (vals)
    (let ([f #f])
      (set! f
        (lambda (ls)
          (if (null? ls)
              0
              (+ (expval->num (car ls))
                 (f (cdr ls))))))
      (num-val (f vals)))))

(define num-sub
  (lambda (vals)
    (if (= 1 (length vals))
        (num-val
         (- 0 (expval->num (car vals))))
        (let f ([ls (cdr vals)]
                [a (expval->num (car vals))])
          (if (null? ls)
              (num-val a)
              (f (cdr ls) (- a (expval->num (car ls)))))))))