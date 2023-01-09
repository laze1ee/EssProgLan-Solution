#lang eopl


(require "help.rkt"
         "match.rkt"
         "ast-types.rkt")

(provide ast-of ast-of-exp)



(define sp-eq? '(= e1 e2))
(define sp-sum '(+ e ...))
(define sp-diff '(- e1 e2 ...))

(define sp-def '(def id e))
(define sp-func '(func (id ...) e1 e2 ...))
(define sp-call1 '(id e ...))
(define sp-call2 '((func (id ...) e1 e2 ...) e ...))
(define sp-if '(if e1 e2 e3))
(define sp-begin '(begin e1 e2 ...))
(define sp-set '(set! id e))

(define sp-let '(let ([id e] ...) e1 e2 ...))
(define sp-letrec '(letrec ([id e] ...) e1 e2 ...))
(define sp-print '(print e))

(define sp-class1 '(class id
                          (field id) ...
                          (id (id ...) e1 e2 ...)
                          (id (id ...) e1 e2 ...)
                          ...))
(define sp-class2 '(class id (extend id)
                          (field id) ...
                          (id (id ...) e1 e2 ...)
                          (id (id ...) e1 e2 ...)
                          ...))
(define sp-new-object  '(new id e ...))
(define sp-set-field   '(set! (self id) e))
(define sp-self-field  '(self id))
(define sp-method-call '(method-call id1 id2 e ...))
(define sp-self-call  '(self-call id e ...))
(define sp-super-call '(super-call id e ...))
(define sp-instanceof '(instanceof e id))



(define ast-of
  (lambda (code)
    (let ([ast (map ast-of-exp code)]
          [sz (length code)])
      (a-program (list-head ast (sub1 sz))
                 (list-ref ast (sub1 sz))))))
    

(define ast-of-exp
  (lambda (sexp)
    (if (list? sexp)
        (ast-of-list sexp)
        (ast-of-atom sexp))))


(define ast-of-atom
  (lambda (atom)
    (cond
      [(number? atom) (num-exp atom)]
      
      [(boolean? atom) (bool-exp atom)]
      
      [(identifier? atom)
       (var-exp atom)]
      [else
       (eopl:error 'ast-of-atom err-invalid-syntax atom)])))


(define ast-of-list
  (lambda (sexp)
    (cond
      [(match? sp-eq? sexp)
       (eq?-exp (ast-of-exp (1st sexp))
                (ast-of-exp (2nd sexp)))]
      [(match? sp-sum sexp)
       (sum-exp (map ast-of-exp (cdr sexp)))]
      [(match? sp-diff sexp)
       (diff-exp (map ast-of-exp (cdr sexp)))]

      [(match? sp-func sexp)
       (func-exp (1st sexp)
                 (map ast-of-exp (list-tail sexp 2)))]
      [(or (match? sp-call1 sexp)
           (match? sp-call2 sexp))
       (call-exp (ast-of-exp (0th sexp))
                 (map ast-of-exp (cdr sexp)))]
      [(match? sp-if sexp)
       (if-exp (ast-of-exp (1st sexp))
               (ast-of-exp (2nd sexp))
               (ast-of-exp (3rd sexp)))]
      [(match? sp-begin sexp)
       (begin-exp (map ast-of-exp (cdr sexp)))]
      [(match? sp-set sexp)
       (set-exp (1st sexp)
                (ast-of-exp (2nd sexp)))]
      [(match? sp-let sexp)
       (let-exp (map (lambda (bound)
                       (list (0th bound)
                             (ast-of-exp (1st bound))))
                     (1st sexp))
                (map ast-of-exp (list-tail sexp 2)))]
      [(match? sp-letrec sexp)
       (letrec-exp (map (lambda (bound)
                          (list (0th bound)
                                (ast-of-exp (1st bound))))
                        (1st sexp))
                   (map ast-of-exp (list-tail sexp 2)))]

      [(match? sp-print sexp)
       (print-exp (ast-of-exp (1st sexp)))]

      [(match? sp-class1 sexp)
       (let* ([tail (list-tail sexp 2)]
              [fields (get-fields tail)]
              [methods (get-methods tail)])
         (class-decl (1st sexp) 'object fields methods))]
      [(match? sp-class2 sexp)
       (let* ([tail (list-tail sexp 3)]
              [fields (get-fields tail)]
              [methods (get-methods tail)])
         (class-decl (1st sexp) (1st (2nd sexp)) fields methods))]
      
      [(match? sp-new-object sexp)
       (new-object-exp (1st sexp)
                       (map ast-of-exp (list-tail sexp 2)))]
      [(match? sp-set-field sexp)
       (set-field-exp (1st (1st sexp))
                      (ast-of-exp (2nd sexp)))]
      [(match? sp-self-field sexp)
       (self-field-exp (1st sexp))]
      [(match? sp-method-call sexp)
       (method-call-exp
        (ast-of-exp (1st sexp))
        (2nd sexp)
        (map ast-of-exp (list-tail sexp 3)))]
      [(match? sp-self-call sexp)
       (self-call-exp
        (1st sexp)
        (map ast-of-exp (list-tail sexp 2)))]
      [(match? sp-super-call sexp)
       (super-call-exp
        (1st sexp)
        (map ast-of-exp (list-tail sexp 2)))]
      [(match? sp-instanceof sexp)
       (instanceof-exp (ast-of-exp (1st sexp))
                       (2nd sexp))]

      [else
       (eopl:error 'ast-of-list err-invalid-syntax sexp)])))


(define get-fields
  (lambda (sexp)
    (if (not (eq? 'field (caar sexp)))
        '()
        (cons (cadar sexp)
              (get-fields (cdr sexp))))))

(define get-methods
  (lambda (sexp)
    (let ([iter #f])
      (set! iter
        (lambda (sexp)
          (if (not (eq? 'field (caar sexp)))
              sexp
              (iter (cdr sexp)))))
      (map (lambda (m)
             (list (0th m) (1st m)
                   (map ast-of-exp (list-tail m 2))))
           (iter sexp)))))