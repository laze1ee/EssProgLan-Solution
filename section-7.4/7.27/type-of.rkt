#lang eopl


(require "help.rkt"
         "data-types.rkt"
         "ast-types.rkt"
         "type-env.rkt"
         "unifier.rkt")

(provide eqs-of subst-of)


(define eqs-of
  (lambda (tvar exp)
    (let ([eqs '()]
          [recur #f])
      (set! recur
        (lambda (tvar exp tenv)
          (cases expression exp
            [num-exp
             (num)
             (set! eqs
               (append eqs (llist tvar (Int))))]
            [bool-exp
             (bool)
             (set! eqs
               (append eqs (llist tvar (Bool))))]

            [eq?-exp
             (exp1 exp2)
             (set! eqs
               (append eqs (llist tvar (Bool))))
             (map (lambda (exp1)
                    (let ([t (fresh-tvar)])
                      (set! eqs
                        (append eqs (llist t (Int))))
                      (recur t exp1 tenv)))
                  (list exp1 exp2))]
            [sum-exp
             (exps)
             (set! eqs
               (append eqs (llist tvar (Int))))
             (map (lambda (exp1)
                    (let ([t (fresh-tvar)])
                      (set! eqs
                        (append eqs (llist t (Int))))
                      (recur t exp1 tenv)))
                  exps)]
            [diff-exp
             (exps)
             (set! eqs
               (append eqs (llist tvar (Int))))
             (map (lambda (exp1)
                    (let ([t (fresh-tvar)])
                      (set! eqs
                        (append eqs (llist t (Int))))
                      (recur t exp1 tenv)))
                  exps)]

            [var-exp
             (var)
             (set! eqs
               (append eqs
                       (llist tvar (apply-tenv tenv var))))]
            [typed-func-exp
             (parameters body)
             (let ([t-ps (map (lambda (parameter)
                                (option->dtype (first parameter)))
                              parameters)]
                   [prms (map second parameters)]
                   [t-rt (fresh-tvar)])
               (set! eqs
                 (append eqs
                         (llist tvar (Function t-ps t-rt))))
               (set! tenv (extend-tenv* prms t-ps tenv))
               (recur t-rt body tenv))]
            [call-exp
             (rator rands)
             (let ([f (fresh-tvar)]
                   [ts #f])
               (recur f rator tenv)
               (set! f (apply-subst-to-type eqs f))
               (set! ts
                 (map (lambda (rand)
                        (let ([t (fresh-tvar)])
                          (recur t rand tenv)
                          t))
                      rands))
               (set! eqs
                 (append eqs (llist f (Function ts tvar)))))]
            [if-exp
             (exp1 exp2 exp3)
             (let ([t1 (fresh-tvar)]
                   [t2 (fresh-tvar)]
                   [t3 (fresh-tvar)])
               (set! eqs
                 (append eqs (llist t1 (Bool))))
               (recur t1 exp1 tenv)
               (set! eqs
                 (append eqs (llist t2 t3)))
               (recur t2 exp2 tenv)
               (recur t3 exp3 tenv))]
            [typed-let-exp
             (bounds body)
             (let ([t-ps (map (lambda (bound)
                                (option->dtype (first bound)))
                              bounds)]
                   [vars (map second bounds)]
                   [exps (map third bounds)])
               (map (lambda (t exp1)
                      (recur t exp1 tenv))
                    t-ps exps)
               (set! tenv (extend-tenv* vars t-ps tenv))
               (recur tvar body tenv))]
            [typed-letrec-exp
             (bounds body)
             (let ([t-ps (map (lambda (bound)
                                (option->dtype (first bound)))
                              bounds)]
                   [vars (map second bounds)]
                   [exps (map third bounds)])
               (set! tenv (extend-tenv* vars t-ps tenv))
               (map (lambda (t exp1)
                      (recur t exp1 tenv))
                    t-ps exps)
               (recur tvar body tenv))]

            [null?-exp
             (exp1)
             (set! eqs
               (append eqs (llist tvar (Bool))))
             (let ([t (fresh-tvar)])
               (set! eqs
                 (append eqs (llist t (Any))))
               (recur t exp1 tenv))]
            [emptylist-exp
             ()
             (set! eqs
               (append eqs (llist tvar (List))))]
            [kar-exp
             (exp1)
             (set! eqs
               (append eqs (llist tvar (Any))))
             (let ([t (fresh-tvar)])
               (set! eqs
                 (append eqs (llist t (List))))
               (recur t exp1 tenv))]
            [kdr-exp
             (exp1)
             (set! eqs
               (append eqs (llist tvar (List))))
             (let ([t (fresh-tvar)])
               (set! eqs
                 (append eqs (llist t (List))))
               (recur t exp1 tenv))]
            [kons-exp
             (exp1 exp2)
             (set! eqs
               (append eqs (llist tvar (List))))
             (let ([t1 (fresh-tvar)]
                   [t2 (fresh-tvar)])
               (set! eqs
                 (append eqs (llist t1 (Any))))
               (recur t1 exp1 tenv)
               (set! eqs
                 (append eqs (llist t2 (List))))
               (recur t2 exp2 tenv))]
            [list-exp
             (exps)
             (set! eqs
               (append eqs (llist tvar (List))))
             (map (lambda (exp1)
                    (let ([t (fresh-tvar)])
                      (set! eqs
                        (append eqs (llist t (Any))))
                      (recur t exp1 tenv)))
                  exps)]
            [list?-exp
             (exp1)
             (set! eqs
               (append eqs (llist tvar (Bool))))
             (let ([t (fresh-tvar)])
               (set! eqs
                 (append eqs (llist t (Any))))
               (recur t exp1 tenv))]
            
            [eles
             (eopl:error 'eqs-of err-invalid-exp exp)])))
      (recur tvar exp (init-tenv))
      eqs)))


(define subst-of
  (lambda (eqs)
    (let* ([subst '()])
      (map (lambda (pair)
             (set! subst
               (unifier (first pair) (second pair) subst (num-exp -99))))
           eqs)
      subst)))