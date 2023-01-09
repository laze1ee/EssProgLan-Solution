#lang eopl


(require "help.rkt"
         "env.rkt"
         "store-model.rkt"
         "func-expval.rkt"
         "ast-types.rkt")

(provide value-of)



;; library environment
(define lenv 'uninit)


(define value-of
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exps)
       (set! lenv 'uninit)
       (let ([env (init-env)])
         (last (lambda (exp) (value-of-exp exp env))
               exps))])))


(define value-of-exp
  (lambda (exp env)
    (cases expression exp
      [def-exp
       (id exp1)
       ;; By extend-env! change the environment
       (extend-env! id
                    (newref (value-of-exp exp1 env))
                    env)
       (void-val '(void))]
      [imports-exp
       (lib-ids)
       (map (lambda (lib-id)
              (if (find-in-lenv? lib-id lenv)
                  (extend-env! lib-id
                               (apply-env lenv id)
                               env)
                  (begin
                   (search-local-directory)
                   (valuate)
                   (load-into-env))))
            lib-ids)
       (void-val '(void))]
      [lib-exp
       (lib-id imports exports body)
       (value-of-exp imports env)
       (last (lambda (exp) (value-of-exp exp env))
             body)
       (store-exports)
       (catelog-into-lenv)
       (load-into-env)
       (void-val '(void))]
      [else
       (eopl:error 'value-of-exp err-invalid-exp exp)])))