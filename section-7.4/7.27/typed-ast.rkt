#lang eopl


(require "help.rkt"
         "data-types.rkt"
         "ast-types.rkt")

(provide typed-ast)


(define typed-ast
  (lambda (exp)
    (cases expression exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]

      [eq?-exp
       (exp1 exp2)
       (eq?-exp (typed-ast exp1)
                (typed-ast exp2))]
      [sum-exp
       (exps)
       (sum-exp (map typed-ast exps))]
      [diff-exp
       (exps)
       (diff-exp (map typed-ast exps))]

      [var-exp (var) (var-exp var)]
      [func-exp
       (parameters body)
       (typed-func-exp
        (map (lambda (parameter)
               (list (unknow-type) parameter))
             parameters)
        (typed-ast body))]
      [call-exp
       (rator rands)
       (call-exp
        (typed-ast rator)
        (map typed-ast rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp (typed-ast exp1)
               (typed-ast exp2)
               (typed-ast exp3))]
      [let-exp
       (bounds body)
       (typed-let-exp
        (map (lambda (bound)
               (list (unknow-type)
                     (first bound)
                     (typed-ast (second bound))))
             bounds)
        (typed-ast body))]
      [letrec-exp
       (bounds body)
       (typed-letrec-exp
        (map (lambda (bound)
               (list (unknow-type)
                     (first bound)
                     (typed-ast (second bound))))
             bounds)
        (typed-ast body))]

      [null?-exp (exp) (null?-exp (typed-ast exp))]
      [emptylist-exp () (emptylist-exp)]
      [kar-exp (exp) (kar-exp (typed-ast exp))]
      [kdr-exp (exp) (kdr-exp (typed-ast exp))]
      [kons-exp
       (exp1 exp2)
       (kons-exp (typed-ast exp1)
                 (typed-ast exp2))]
      [list-exp
       (exps)
       (list-exp (map typed-ast exps))]
      [list?-exp (exp) (list?-exp (typed-ast exp))]
      
      [else
       (eopl:error 'add-type err-invalid-exp exp)])))