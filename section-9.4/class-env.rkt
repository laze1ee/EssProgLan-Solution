#lang eopl


(require "help.rkt"
         "ast-types.rkt"
         "store-model.rkt")

(provide init-class-env! extend-class-env!
         new-object find-method find-field find-class-id
         obj->super
         get-class-env)



(define the-class-env 'uninit)


(define get-class-env (lambda () the-class-env))


(define init-class-env!
  (lambda ()
    (set! the-class-env '())))


(define extend-class-env!
  (lambda (decl)
    (cases class-declaration decl
      [class-decl
       (class-id super-id fields methods)
       (let ([super-names
              (if (eq? 'object super-id)
                  '() (get-names super-id))]
             [super-fields
              (if (eq? 'object super-id)
                  '() (get-fields super-id))]
             [super-methods
              (if (eq? 'object super-id)
                  '() (get-methods super-id))]
             [current-methods
              (map (lambda (method)
                     (list (car method)
                           (newref (cdr method))))
                   methods)])
         (set! the-class-env
           (cons
            (list class-id
                  (list class-id super-names)
                  (list fields super-fields)
                  (list current-methods super-methods))
            the-class-env)))])))
         

(define err-no-class "not found class ~s")

(define search-class
  (lambda (class-id f)
    (let ([result (assq class-id the-class-env)])
      (if (list? result)
          (f result)
          (eopl:error 'search-class err-no-class class-id)))))

(define get-names
  (lambda (class-id)
    (search-class class-id 1st)))

(define get-fields
  (lambda (class-id)
    (search-class class-id 2nd)))

(define get-methods
  (lambda (class-id)
    (search-class class-id 3rd)))



(define new-object
  (lambda (class-id)
    (let* ([result (search-class class-id cdr)]
           [fields (1st result)]
           [fields (alloc-fields fields)])
      (list (0th result) fields (2nd result)))))

(define alloc-fields
  (lambda (fields)
    (if (null? fields)
        '()
        (let ([current (0th fields)]
              [super (1st fields)])
          (list (map (lambda (field)
                       (list field (newref 'uninit-field)))
                     current)
                (alloc-fields super))))))



(define err-no-method "not found method ~s")

(define find-method
  (lambda (obj method-id)
    (if (null? (car obj))
        (eopl:error 'find-method err-no-method method-id)
        (let ([names (0th obj)]
              [fields (1st obj)]
              [methods (2nd obj)]
              [result #f])
          (set! result (assq method-id (car methods)))
          (if (list? result)
              (list (deref (1st result))
                    (list names fields methods))
              (find-method
               (list (1st names) (1st fields) (1st methods))
               method-id))))))


(define err-no-field "not found field ~s")

(define find-field
  (lambda (obj field-id)
    (let iter ([fields (1st obj)])
      (if (null? fields)
          (eopl:error 'find-field err-no-field field-id)
          (let ([result (assq field-id (0th fields))])
            (if (list? result)
                (1st result)
                (iter (1st fields))))))))


(define obj->super
  (lambda (obj)
    (list (1st (0th obj))
          (1st (1st obj))
          (1st (2nd obj)))))


(define find-class-id
  (lambda (obj class-id)
    (let iter ([ids (0th obj)])
      (cond
        [(null? ids) #f]
        [(eq? class-id (0th ids)) #t]
        [else
         (iter (1st obj))]))))