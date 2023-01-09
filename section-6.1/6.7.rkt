#lang eopl


(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))


(define value-of-program
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exp1)
       (value-of/k exp1 (init-env) (end-cont))])))


(define value-of/k
  (lambda (exp env cont)
    (cases expression exp
      [const-exp
       (num)
       (cont (num-val num))]
      [func-exp
       (var body)
       (cont (func-val (func var body env)))]
      [letrec-exp
       (bounds body)
       (let* ([vars (get-vars bounds)]
              [exps (get-exps bounds)]
              [refs (newref* vars)]
              [new-env (extend-env* vars refs env)])
         (if (null? vars)
             (value-of/k body env cont)
             (value-of/k (car exps) new-env
                         (letrec-cont refs (cdr exps) new-env body cont))))]
      [zero?-exp
       (exp1)
       (value-of/k exp1 env
                   (lambda (val)
                     (if (expval->bool val)
                         (cont (bool-val #t))
                         (cont (bool-val #f)))))]
      [if-exp
       (exp1 exp2 exp3)
       (value-of/k exp1 env
                   (lambda (val)
                     (if (expval->bool val)
                         (value-of/k exp2 env cont)
                         (value-of/k exp3 env cont))))]
      [let-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [exps (get-exps bounds)])
         (if (null? vars)
             (value-of/k body env cont)
             (value-of/k (car exps) env
                         (let-cont '() vars (cdr exps)
                                   env body cont))))]
      [call-exp
       (rator rands)
       (value-of/k rator env
                   (call-cont '() rands env cont))]
      [else
       #f])))


(define letrec-cont
  (lambda (refs exps env body cont)
    (lambda (val)
      (setref! (car refs) val)
      (if (null? exps)
          (value-of/k body env cont)
          (value-of/k (car exps) env
                      (letrec-cont (cdr refs) (cdr exps)
                                   env body cont))))))
         
(define let-cont
  (lambda (vals vars exps env body cont)
    (lambda (val)
      (set! vals (append vals (list val)))
      (if (null? exps)
          (begin
           (set! env (extend-env* vars (newref* vals) env))
           (value-of/k body env cont))
          (value-of/k (car exps) env
                      (let-cont vals vars (cdr exps)
                                env body cont))))))

(define call-cont
  (lambda (vals rands env cont)
    (lambda (val)
      (set! vals (append vals (list val)))
      (if (null? rands)
          (apply-func/k vals cont)
          (value-of/k (car rands) env
                      (call-cont vals (cdr rands) env cont))))))

(define apply-func/k
  (lambda (vals cont)
    (cases function (car vals)
      [func
       (parameters body env)
       (value-of/k body
                   (extend-env* parameters (newref* (cdr vals)) env)
                   cont)])))