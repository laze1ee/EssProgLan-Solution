#lang eopl


(provide init-tenv extend-tenv extend-tenv* apply-tenv set-tenv!)



(define init-tenv '())


(define extend-tenv
  (lambda (var type tenv)
    (list var type tenv)))


(define extend-tenv*
  (lambda (vars types tenv)
    (if (null? vars)
        tenv
        (extend-tenv*
         (cdr vars) (cdr types)
         (extend-tenv (car vars) (car types) tenv)))))


(define apply-tenv
  (lambda (tenv var)
    (cond
      [(null? tenv)
       (eopl:error 'apply-tenv
                   "Not found type for variable ~s" var)]
      [(eq? (car tenv) var)
       (list-ref tenv 1)]
      [else
       (apply-tenv (list-ref tenv 2) var)])))

(define set-tenv!
  (lambda (tenv var type)
    ;; cannont impletment this, just reserved.
    #f))