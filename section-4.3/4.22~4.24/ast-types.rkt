#lang eopl


(provide identifier?
         expression expression?
         num-exp bool-exp not-exp var-exp func-exp call-exp if-exp
         =? add sub mul
         statement statement?
         block assign multiple while print read-stmt
         do-while)
         

;; ======
(define identifier?
  (lambda (var)
    (and (symbol? var)
         (not (eq? var 'if))
         (not (eq? var 'while)))))

(define list-of
  (lambda (pred)
    (lambda (exprs)
      (or (null? exprs)
          (and (pred (car exprs))
               ((list-of pred) (cdr exprs)))))))
;; ======


(define-datatype expression expression?
  (num-exp
   [num number?])
  (bool-exp
   [bool boolean?])
  (not-exp
   [exp expression?])
  (var-exp
   [var identifier?])
  (func-exp
   [parameters (list-of identifier?)]
   [body expression?])
  (call-exp
   [rator expression?]
   [rands (list-of expression?)])
  (if-exp
   [exp1 expression?]
   [exp2 expression?]
   [exp3 expression?])
  (=?
   [exp1 expression?]
   [exp2 expression?])
  (add
   [exp1 expression?]
   [exp2 expression?])
  (sub
   [exp1 expression?]
   [exp2 expression?])
  (mul
   [exp1 expression?]
   [exp2 expression?]))

(define-datatype statement statement?
  (block
   [vars (list-of identifier?)]
   [stmt statement?])
  (assign
   [var identifier?]
   [exp expression?])
  (while
   [exp expression?]
   [stmt statement?])
  (multiple
   [stmts (list-of statement?)])  
  (print
   [exp expression?])
  (read-stmt
   [var identifier?])
  (do-while
   (stmt statement?)
   (exp expression?)))