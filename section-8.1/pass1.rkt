#lang eopl


(require "help.rkt"
         "ast-types.rkt")

(provide pass1=>f-call)


(define pass1=>f-call
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exps)
       (a-program (map convert exps))])))


(define convert
  (lambda (exp)
    (cases expression exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]

      [eq?-exp
       (exp1 exp2)
       (eq?-exp (convert exp1) (convert exp2))]
      [sum-exp
       (exps)
       (sum-exp (map convert exps))]
      [diff-exp
       (exps)
       (diff-exp (map convert exps))]

      [def-exp
       (id exp1)
       (def-exp id (convert exp1))]
      [var-exp (id) (var-exp id)]
      [func-exp
       (parameters body)
       (func-exp parameters (map convert body))]
      [call-exp
       (rator rands)
       (call-exp (convert rator) (map convert rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp (convert exp1) (convert exp2) (convert exp3))]
      [begin-exp
       (exps)
       (call-exp (func-exp '() (map convert exps))
                 '())]
      [set-exp
       (id exp1)
       (set-exp id (convert exp1))]
      [let-exp
       (bindings body)
       (let ([ids (map 0th bindings)]
             [exps (map 1st bindings)])
         (call-exp (func-exp ids body)
                   (map convert exps)))]
      [letrec-exp
       (bindings body)
       (let ([ids (map 0th bindings)]
             [exps (map 1st bindings)]
             [rands #f]
             [sets '()])
         (set! rands
           (map (lambda (id exp)
                  (if (func-exp? exp)
                      (begin
                       (set! sets
                         (append sets
                                 (list (set-exp id (convert exp)))))
                       (bool-exp #f))
                      exp))
                ids exps))
         (call-exp (func-exp ids (append sets body))
                   (map convert rands)))]
      [print-exp
       (exp)
       (print-exp (convert exp))]

      [imports-exp
       (ids)
       (imports-exp ids)]
      [lib-exp
       (id imports exports body)
       (lib-exp id
                (convert imports) exports
                (map convert body))]
      [libvar-exp
       (lib-id id)
       (libvar-exp lib-id id)]
      [else
       (eopl:error 'pass1=>f-call err-invalid-exp exp)])))
