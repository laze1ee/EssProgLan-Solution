#lang eopl


(require "help.rkt"
         "ast-types.rkt")

(provide pass1=>f-call
         convert-exp convert-class)


(define pass1=>f-call
  (lambda (pgm)
    (cases program pgm
      [a-program
       (decls exp)
       (a-program
        (map convert-class decls)
        (convert-exp exp))])))


(define convert-exp
  (lambda (exp)
    (cases expression exp
      [num-exp (num) (num-exp num)]
      [bool-exp (bool) (bool-exp bool)]

      [eq?-exp
       (exp1 exp2)
       (eq?-exp (convert-exp exp1) (convert-exp exp2))]
      [sum-exp
       (exps)
       (sum-exp (map convert-exp exps))]
      [diff-exp
       (exps)
       (diff-exp (map convert-exp exps))]

      [var-exp (id) (var-exp id)]
      [func-exp
       (parameters body)
       (func-exp parameters (map convert-exp body))]
      [call-exp
       (rator rands)
       (call-exp (convert-exp rator) (map convert-exp rands))]
      [if-exp
       (exp1 exp2 exp3)
       (if-exp (convert-exp exp1) (convert-exp exp2) (convert-exp exp3))]
      [begin-exp
       (exps)
       (call-exp (func-exp '() (map convert-exp exps))
                 '())]
      [set-exp
       (id exp1)
       (set-exp id (convert-exp exp1))]
      [let-exp
       (bindings body)
       (let ([ids (map 0th bindings)]
             [exps (map 1st bindings)])
         (call-exp (func-exp ids body)
                   (map convert-exp exps)))]
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
                                 (list (set-exp id (convert-exp exp)))))
                       (bool-exp #f))
                      exp))
                ids exps))
         (call-exp (func-exp ids (append sets body))
                   (map convert-exp rands)))]
      [print-exp
       (exp)
       (print-exp (convert-exp exp))]

      [set-field-exp
       (field-id exp)
       (set-field-exp field-id
                      (convert-exp exp))]
      [new-object-exp
       (class-id rands)
       (new-object-exp class-id
                       (map convert-exp rands))]
      [method-call-exp
       (obj method-id rands)
       (method-call-exp (convert-exp obj)
                        method-id
                        (map convert-exp rands))]
      [self-field-exp
       (field-id)
       (self-field-exp field-id)]
      [self-call-exp
       (method-id rands)
       (self-call-exp method-id
                      (map convert-exp rands))]
      [super-call-exp
       (method-id rands)
       (super-call-exp method-id
                       (map convert-exp rands))]
      [instanceof-exp
       (exp1 class-id)
       (instanceof-exp (convert-exp exp1)
                       class-id)]

      [else
       (eopl:error 'pass1=>f-call err-invalid-exp exp)])))


(define convert-class
  (lambda (decl)
    (cases class-declaration decl
      [class-decl
       (class-id super-id fields methods)
       (class-decl
        class-id
        super-id
        fields
        (map (lambda (method)
               (list (0th method)
                     (1st method)
                     (map convert-exp (2nd method))))
             methods))])))