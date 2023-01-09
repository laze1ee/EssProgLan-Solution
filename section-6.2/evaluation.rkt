#lang eopl


(define exp 'uninit)
(define env 'uninit)
(define cont 'uninit)


(define value-of-program
  (lambda (pgm)
    (init-store!)
    (cases program pgm
      [a-program
       (exp1)
       (set! exp exp1)
       (set! env (init-env!))
       (set! cont (end-cont))
       (trampoline value-of/k)])))


(define trampoline
  (lambda (p)
    (if (procedure? p)
        (trampoline (p))
        p)))


(define value-of/k
  (lambda ()
    (cases tfexp exp
      [simple-exp->exp
       (simple)
       (set! exp simple)
       ((end-cont) (value-of-simple-exp))]
      [cps-if-exp
       (simple1 body1 body2)
       (if (expval->bool (begin
                          (set! exp simple1)
                          (value-of-simple-exp env)))
           (set! exp body1)
           (set! exp body2))
       value-of/k]
      [cps-call-exp
       (rator rands)
       (let ([f (expval->func (begin
                               (set! exp rator)
                               (value-of-simple-exp env)))]
             [vals (map (lambda (simple)
                          (set! exp simple)
                          (value-of-simple-exp env))
                        rands)])
         (apply-func/k f vals))]
      [cps-let-exp
       (var simple body)
       (let ([val (begin
                   (set! exp simple)
                   (value-of-simple-exp simple env))])
         (set! exp body)
         (set! env (extend-env var (newref val) env))
         value-of/k)]
      [cps-letrec-exp
       (bounds body)
       (let ([vars (get-vars bounds)]
             [funcs (map (lambda (simple)
                           (set! exp simple)
                           (value-of-simple-exp env))
                         (get-funcs bounds))])
         (set! exp body)
         (set! env (extend-env* vars (newref* funcs) env))
         value-of/k)])))


(define apply-func/k
  (lambda (f args)
    (cases function f
      [func
       (parameters body env)
       (set! exp body)
       (set! env (extend-env* parameters (newref* args) env))
       value-of/k])))


(define value-of-simple-exp
  (lambda ()
    (cases simple-exp exp
      [const-exp
       (num)
       num]
      [var-exp
       (var)
       (deref (apply-env env var))]
      [cps-func-exp
       (parameters body)
       (func-val (func parameters body env))]
      [cps-sub-exp
       (exp1 exp2)
       (let ([val1 (begin
                    (set! exp exp1)
                    (value-of-simple-exp env))]
             [val2 (begin
                    (set! exp exp2)
                    (value-of-simple-exp env))])
         (num-val (- (expval->num val1)
                     (expval->num val2))))]
      [cps-zero?-exp
       (exp1)
       (let ([val1 (begin
                    (set! exp exp1)
                    (value-of-simple-exp env))])
         (if (expval->bool val1)
             (bool-val #t)
             (bool-val #f)))]
      [else
       (eopl:error 'value-of-simple-exp
                   "Invalid expression: ~s" exp)])))


(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))