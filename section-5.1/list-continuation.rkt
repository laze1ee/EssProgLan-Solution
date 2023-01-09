#lang eopl


(require "auxiliary.rkt"
         "ast-types.rkt"
         "func-env-expval.rkt"
         "store-model.rkt")

(define end-cont
  (lambda () '()))

(define equ?-cont
  (lambda (vals exps env cont)
    (list 'equ?
          (vector vals exps env)
          cont)))

(define add-cont
  (lambda (vals exps env cont)
    (list 'add
          (vector vals exps env)
          cont)))

(define sub-cont
  (lambda (vals exps env cont)
    (list 'sub
          (vector vals exps env)
          cont)))

(define call-cont
  (lambda (vals rands env cont)
    (list 'call
          (vector vals rands env)
          cont)))

(define set-cont
  (lambda (ref cont)
    (list 'set
          (vector ref)
          cont)))

(define if-cont
  (lambda (exp2 exp3 env cont)
    (list 'if
          (vector exp2 exp3 env)
          cont)))

(define let-cont
  (lambda (vals vars exps body env cont)
    (list 'let
          (vector vals vars exps body env)
          cont)))

(define letrec-cont
  (lambda (refs exps body env cont)
    (list 'letrec
          (vector refs exps body env)
          cont)))

(define begin-cont
  (lambda (exps exp env cont)
    (list 'begin
          (vector exps exp env)
          cont)))


(define apply-cont
  (lambda (cont val)
    (if (null? cont)
        (begin
         (eopl:printf "End of computation.~%")
         (eopl:printf "~s~%" val)
         val)
        (let ([flag (car cont)]
              [datum (list-ref cont 1)]
              [saved-cont (list-ref cont 2)])
          (cond
            [(= 1 (vector-length datum))
             (let ([data (vector-ref datum 0)])
               (cond
                 [(eq? 'set flag)
                  (apply-cont saved-cont (setref! data val))]))]
            [(= 3 (vector-length datum))
             (let ([vals (vector-ref datum 0)]
                   [exps (vector-ref datum 1)]
                   [env  (vector-ref datum 2)])
               (cond
                 [(eq? 'equ flag)
                  (set! vals (append vals (list val)))
                  (if (null? exps)
                      (apply-cont saved-cont (equ? vals))
                      (value-of/k (car exps) env
                                  (equ?-cont vals (cdr exps) env saved-cont)))]
                 [(eq? 'add flag)
                  (set! vals (append vals (list val)))
                  (if (null? exps)
                      (apply-cont saved-cont (add vals))
                      (value-of/k (car exps) env
                                  (add-cont vals (cdr exps) env saved-cont)))]
                 [(eq? 'sub flag)
                  (set! vals (append vals (list val)))
                  (if (null? exps)
                      (apply-cont saved-cont (sub vals))
                      (value-of/k (car exps) env
                                  (sub-cont vals (cdr exps) env saved-cont)))]
                 [(eq? 'call flag)
                  (set! vals (append vals (list val)))
                  (if (null? exps)
                      (apply-func (expval->func (car vals)) (cdr vals) saved-cont)
                      (value-of/k (car exps) env
                                  (call-cont vals (cdr exps) env saved-cont)))]
                 [(eq? 'if flag)
                  (let ([b (expval->bool val)]
                        [exp2 vals]
                        [exp3 exps])
                    (if b
                        (value-of/k exp2 env saved-cont)
                        (value-of/k exp3 env saved-cont)))]
                 [(eq? 'begin flag)
                  (let ([exps vals]
                        [exp exps])
                    (if (null? exps)
                        (value-of/k exp env saved-cont)
                        (value-of/k (car exps) env
                                    (begin-cont (cdr exps) exp env saved-cont))))]))]
            [(= 4 (vector-length datum))
             (let ([refs (vector-ref datum 0)]
                   [exps (vector-ref datum 1)]
                   [body (vector-ref datum 2)]
                   [env  (vector-ref datum 3)])
               (cond
                 [(eq? 'letrec flag)
                  (setref! (car refs) val)
                  (if (null? exps)
                      (value-of/k body env saved-cont)
                      (value-of/k (car exps) env
                                  (letrec-cont (cdr refs) (cdr exps)
                                               body env saved-cont)))]))]
            [(= 5 (vector-length datum))
             (let ([vals (vector-ref datum 0)]
                   [vars (vector-ref datum 1)]
                   [exps (vector-ref datum 2)]
                   [body (vector-ref datum 3)]
                   [env  (vector-ref datum 4)])
               (cond
                 [(eq? 'let flag)
                  (set! vals (append vals (list val)))
                  (if (null? exps)
                      (let ([refs (newref* vals)])
                        (value-of/k body (extend-env* vars refs env) saved-cont))
                      (value-of/k (car exps) env
                                  (let-cont
                                   vals vars (cdr exps) body env saved-cont)))]))])))))


(define equ?
  (lambda (vals)
    (bool-val
     (= (expval->num (car vals))
        (expval->num (cadr vals))))))

(define add
  (lambda (vals)
    (let ([f #f])
      (set! f
        (lambda (ls)
          (if (null? ls)
              0
              (+ (expval->num (car ls))
                 (f (cdr ls))))))
      (num-val (f vals)))))

(define sub
  (lambda (vals)
    (if (= 1 (length vals))
        (num-val
         (- 0 (expval->num (car vals))))
        (let f ([ls (cdr vals)]
                [a (expval->num (car vals))])
          (if (null? ls)
              (num-val a)
              (f (cdr ls) (- a (expval->num (car ls)))))))))

(define apply-func
  (lambda (f vals cont)
    (cases function f
      [func
       (vars body env)
       (let ([a (length vars)]
             [b (length vals)])
         (if (not (= a b))
             (eopl:error 'apply-func args-count-error a b)
             (let ([refs (newref* vals)])
               (value-of/k body (extend-env* vars refs env) cont))))])))


(define value-of/k
  (lambda (exp env cont)
    #f))