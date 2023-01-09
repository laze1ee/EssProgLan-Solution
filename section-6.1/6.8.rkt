#lang eopl


(define value-of-program
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exp)
       (value-of/k exp (init-env) (end-ncont) (end-econt))])))


(define value-of/k
  (lambda (exp env ncont econt)
    (cases expression exp
      ...
      [raise-exp
       (exp1)
       (value-of/k exp1 env
                   (lambda (val)
                     (econt val))
                   econt)]
      [try-exp
       (exp1 var except-exp)
       (value-of/k exp1 env ncont
                   (lambda (val)
                     (value-of/k except-exp
                                 (extend-env var (newref val) env)
                                 ncont econt)))]
      ...
      )))


(define end-ncont
  (lambda ()
    (lambda (val)
      (eopl:printf "Normal end of computation.~%")
      (eopl:printf "Final answer: ~s~%" val)
      val)))

(define end-econt
  (lambda ()
    (lambda (val)
      (eopl:printf "Exceptional end of compution.~%")
      (eopl:printf "Exceptional info: ~s~%" val)
      val)))