#lang eopl


(require "help.rkt"
         "ast-types.rkt")

(provide add-type)


(define add-type
  (lambda (exp)
    (cases expression exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]

      [eq?-exp
       (exp1 exp2)
       (eq?-exp (add-type exp1)
                (add-type exp2))]
      [sum-exp
       (exps)
       (sum-exp (map add-type exps))]
      [diff-exp
       (exps)
       (diff-exp (map add-type exps))]

      [var-exp (var) (var-exp var)]
      [func-exp
       (parameters body)
       (typed-func-exp
        (map (lambda (parameter)
               (list (unknow-type) parameter))
             parameters)
        (add-type body))]
      [call-exp
       (rator rands)
       (call-exp
        (add-type rator)
        (map add-type rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp (add-type exp1)
               (add-type exp2)
               (add-type exp3))]
      [let-exp
       (bounds body)
       (typed-let-exp
        (map (lambda (bound)
               (list (unknow-type)
                     (first bound)
                     (add-type (second bound))))
             bounds)
        (add-type body))]
      [letrec-exp
       (bounds body)
       (typed-letrec-exp
        (map (lambda (bound)
               (list (unknow-type)
                     (first bound)
                     (add-type (second bound))))
             bounds)
        (add-type body))]
      [else
       (eopl:error 'add-type err-invalid-exp exp)])))