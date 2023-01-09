#lang eopl


(require "help.rkt"
         "ast-types.rkt"
         "type-env.rkt"
         "unifier.rkt")

(provide type-of-program type-of)


(define type-of-program
  (lambda (pgm)
    (cases program pgm
      [a-program
       (exp1)
       (let ([answer (type-of exp1 (init-tenv) (empty-subst))])
         (apply-subst-to-type (first answer) (second answer)))])))


(define type-of
  (lambda (exp tenv subst)
    (cases expression exp
      [num-exp (num) (list (Int) subst)]
      [bool-exp (bool) (list (Bool) subst)]
      [typed-func-exp
       (parameters body)
       (let ([types (map (lambda (parameter)
                           (optype->type (first parameter)))
                         parameters)]
             [vars (map second parameters)])
         (set! tenv (extend-tenv* vars types tenv))
         (let ([answer (type-of body tenv subst)])
           (list (Function types (first answer))
                 (second answer))))]

      [eq?-exp
       (exp1 exp2)
       (map (lambda (exp)
              (let ([answer (type-of exp tenv subst)])
                (set! subst (unifier (first answer) (Int)
                                     (second answer) exp))))
            (list exp1 exp2))
       (list (Bool) subst)]
      [sum-exp
       (exps)
       (map (lambda (exp)
              (let ([answer (type-of exp tenv subst)])
                (set! subst (unifier (first answer) (Int)
                                     (second answer) exp))))
            exps)
       (list (Int) subst)]
      [diff-exp
       (exps)
       (map (lambda (exp)
              (let ([answer (type-of exp tenv subst)])
                (set! subst (unifier (first answer) (Int)
                                     (second answer) exp))))
            exps)
       (list (Int) subst)]

      [call-exp
       (rator rands)
       (let ([t-result (fresh-tvar-type)]
             [answer (type-of rator tenv subst)]
             [t-rands #f])
         (set! subst (second answer))
         (set! t-rands
           (map (lambda (rand)
                  (let ([answer (type-of rand tenv subst)])
                    (set! subst (second answer))
                    (first answer)))
                rands))
         (set! subst
           (unifier (first answer)
                    (Function t-rands t-result)
                    subst exp))
         (list t-result subst))]
      [var-exp
       (var)
       (list (apply-tenv tenv var) subst)]
      [if-exp
       (exp1 exp2 exp3)
       (let ([anw1 (type-of exp1 tenv subst)]
             [anw2 #f]
             [anw3 #f])
         (set! subst (second anw1))
         (set! subst
           (unifier (first anw1) (Bool) subst exp1))
         (set! anw2 (type-of exp2 tenv subst))
         (set! anw3 (type-of exp3 tenv (second anw2)))
         (set! subst
           (unifier (first anw2) (first anw3)
                    (second anw3) (list exp2 exp3)))
         (list (first anw2) subst))]
      [typed-let-exp
       (bounds body)
       (let ([tvars (map (lambda (bound)
                           (optype->type (first bound)))
                         bounds)]
             [vars (map second bounds)]
             [exps (map third bounds)])
         (map (lambda (tvar exp)
                (let ([anw (type-of exp tenv subst)])
                  (set! subst
                    (unifier tvar (first anw)
                             (second anw) exp))))
              tvars exps)
         (set! tenv (extend-tenv* vars tvars tenv))
         (type-of body tenv subst))]
      [typed-letrec-exp
       (bounds body)
       (let ([tvars (map (lambda (bound)
                           (optype->type (first bound)))
                         bounds)]
             [vars (map second bounds)]
             [exps (map third bounds)])
         (set! tenv (extend-tenv* vars tvars tenv))
         (map (lambda (tvar exp)
                (let ([anw (type-of exp tenv subst)])
                  (set! subst
                    (unifier tvar (first anw)
                             (second anw) exp))))
              tvars exps)
         (type-of body tenv subst))]
      [else
       (eopl:error 'type-of err-invalid-exp exp)])))



(define tvar-type-sym?
  (lambda (sym)
    (and (symbol? sym)
         (char-numeric? (car (reverse (symbol->list sym)))))))

(define symbol->list
  (lambda (sym)
    (string->list (symbol->string sym))))

(define apply-subst-to-sexp
  (lambda (subst sexp)
    (cond
      [(null? sexp) sexp]
      [(tvar-type-sym? sexp)
       (cdr (assq sexp subst))]
      [(pair? sexp)
       (cons
        (apply-subst-to-sexp subst (car sexp))
        (apply-subst-to-sexp subst (cdr sexp)))]
      [else sexp])))

(define ctr->t
  (lambda (n)
    (string->symbol
     (string-append "Tvar" (number->string n)))))


(define canonical-subst
  (lambda (sexp)
    (let f ([sexp sexp] [table '()])
      (cond
        [(null? sexp) table]
        [(tvar-type-sym? sexp)
         (let ([s (assq sexp table)])
           (if (list? s)
               table
               (cons (cons sexp (ctr->t (length table)))
                     table)))]
        [(pair? sexp)
         (f (cdr sexp) (f (car sexp) table))]
        [else table]))))

(define equal-up-to-gensyms?
  (lambda (sexp1 sexp2)
    (equal?
     (apply-subst-to-sexp (canonical-subst sexp1) sexp1)
     (apply-subst-to-sexp (canonical-subst sexp2) sexp2))))
       