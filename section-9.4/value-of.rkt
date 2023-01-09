#lang eopl


(require "help.rkt"
         "ast-types.rkt"
         "class-env.rkt"
         "env.rkt"
         "func-expval.rkt"
         "store-model.rkt")

(provide value-of-program value-of)



(define value-of-program
  (lambda (pgm)
    (init-store!)
    (cases program pgm
      [a-program
       (class-decls exp)
       (init-class-env!)
       (map extend-class-env! class-decls)
       (value-of exp (init-env))])))


(define value-of
  (lambda (exp env)
    (cases expression exp
      [num-exp (num) (num-val num)]
      [bool-exp (bool) (bool-val bool)]

      [eq?-exp
       (exp1 exp2)
       (let ([val1 (value-of exp1 env)]
             [val2 (value-of exp2 env)])
         (bool-val
          (= (expval->num val1) (expval->num val2))))]
      [sum-exp
       (exps)
       (let ([vals (map (lambda (exp)
                          (value-of exp env))
                        exps)])
         (num-val
          (apply + (map expval->num vals))))]
      [diff-exp
       (exps)
       (let ([vals (map (lambda (exp)
                          (value-of exp env))
                        exps)])
         (num-val
          (apply - (map expval->num vals))))]

      [var-exp
       (id)
       (deref (apply-env env id))]
      [func-exp
       (parameters body)
       (func-val (func parameters body env))]
      [call-exp
       (rator rands)
       (let ([f (value-of rator env)]
             [vals (map (lambda (rand)
                          (value-of rand env))
                        rands)])
         (apply-func (expval->func f) vals))]
      [if-exp
       (exp1 exp2 exp3)
       (let ([val (value-of exp1 env)])
         (if (expval->bool val)
             (value-of exp2 env)
             (value-of exp3 env)))]
      [set-exp
       (id exp1)
       (setref! (apply-env env id)
                (value-of exp1 env))
       (void-val)]

      [new-object-exp
       (class-id rands)
       (let ([args (map (lambda (rand)
                          (value-of rand env))
                        rands)]
             [obj (new-object class-id)])
         (apply-method obj class-id args env)
         (object-val obj))]
      [set-field-exp
       (field-id exp)
       (let ([obj (deref (apply-env env '%self))]
             [val (value-of exp env)]
             [ref #f])
         (set! ref (find-field obj field-id))
         (setref! ref val)
         (void-val))]
      [self-field-exp
       (field-id)
       (deref (find-field
               (deref (apply-env env '%self))
               field-id))]
      [method-call-exp
       (var method-id rands)
       (let ([obj (expval->obj (value-of var env))]
             [args (map (lambda (rand)
                          (value-of rand env))
                        rands)])
         (apply-method obj method-id args env))]
      [self-call-exp
       (method-id rands)
       (let ([obj (deref (apply-env env '%self))]
             [args (map (lambda (rand)
                          (value-of rand env))
                        rands)])
         (apply-method obj method-id args env))]
      [super-call-exp
       (method-id rands)
       (let ([obj (deref (apply-env env '%self))]
             [args (map (lambda (rand)
                          (value-of rand env))
                        rands)])
         (set! obj (obj->super obj))
         (apply-method obj method-id args env))]
      [instanceof-exp
       (exp1 class-id)
       (let ([obj (value-of exp1 env)])
         (if (object-val? obj)
             (begin
              (set! obj (expval->obj obj))
              (if (eq? 'object class-id)
                  (bool-val #t)
                  (bool-val
                   (find-class-id obj class-id))))
             (bool-val #f)))]
      
      [else
       (eopl:error 'value-of err-invalid-exp exp)])))



(define apply-func
  (lambda (f vals)
    (cases function f
      [func
       (parameters body env)
       (set! env (extend-env* parameters (newref* vals) env))
       (last (lambda (exp)
               (value-of exp env))
             body)])))

(define apply-method
  (lambda (obj method-id args env)
    (let* ([result (find-method obj method-id)]
           [method (0th result)]
           [obj (1st result)])
      (set! env (extend-env '%self (newref obj) env))
      (set! env (extend-env* (0th method) (newref* args) env))
      (last (lambda (exp)
              (value-of exp env))
            (1st method)))))

(define object-val?
  (lambda (val)
    (cases expval val
      [object-val (obj) #t]
      [else #f])))