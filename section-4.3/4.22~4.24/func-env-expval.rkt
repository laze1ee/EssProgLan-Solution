#lang eopl


(require "ast-types.rkt")

(provide function func
         empty-env extend-env* apply-env
         num-val bool-val func-val
         expval->num expval->bool expval->func expval->any)


;; function
(define-datatype function function?
  (func
   [vars (list-of identifier?)]
   [body expression?]
   [env  list?]))
;; function


;; environment
(define empty-env
  (lambda ()
    '()))

(define extend-refenv
  (lambda (var ref env)
    (cons (list var ref) env)))

(define extend-env*
  (lambda (vars refs env)
    (let ([a (length vars)]
          [b (length refs)])
      (if (not (= a b))
          (eopl:error 'apply-func "mismatch, expected: ~s, given: ~s"
                      a b)
          (let f ([vars vars] [refs refs] [env env])
            (if (null? vars)
                env
                (f (cdr vars) (cdr refs)
                   (extend-refenv (car vars) (car refs) env))))))))

(define apply-env
  (lambda (env var)
    (cond
      [(null? env)
       (eopl:error 'apply-env "No binding for ~s" var)]
      [(eq? var (caar env))
       (cadar env)]
      [else
       (apply-env (cdr env) var)])))
;; environment


;; expressed value
(define-datatype expval expval?
  (num-val
   [num number?])
  (bool-val
   [bool boolean?])
  (func-val
   [func function?]))

(define extract-expval-error
  (lambda (expval type)
    (eopl:error 'extract-expval-error "~s is not a ~s type" expval type)))

(define expval->num
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [else (extract-expval-error val 'num-val)])))

(define expval->bool
  (lambda (val)
    (cases expval val
      [bool-val (bool) bool]
      [else (extract-expval-error val 'bool-val)])))

(define expval->func
  (lambda (val)
    (cases expval val
      [func-val (func) func]
      [else (extract-expval-error val 'func-val)])))

(define expval->any
  (lambda (val)
    (cases expval val
      [num-val (num) num]
      [bool-val (bool) bool]
      [func-val (func) func])))
;; expressed value