#lang eopl


(define subst
  (lambda (new old slist)
    (cond
      [(null? slist) '()]
      [(symbol? (car slist))
       (if (eq? old (car slist))
           (cons new (subst new old (cdr slist)))
           (cons (car slist) (subst new old (cdr slist))))]
      [else
       (cons (subst new old (car slist))
             (subst new old (cdr slist)))])))


(define apply-cont
  (lambda (cont val)
    (cont val)))

(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))

(define subst-1
  (lambda (new old slist cont)
    (cond
      [(null? slist)
       (apply-cont cont '())]
      [(symbol? (car slist))
       (if (eq? old (car slist))
           (subst-1 new old (cdr slist)
                    (subst-cont new cont))
           (subst-1 new old (cdr slist)
                    (subst-cont (car slist) cont)))]
      [else
       (subst-1 new old (car slist)
                (subst1-cont new old (cdr slist) cont))])))

(define subst-cont
  (lambda (sym cont)
    (lambda (val)
      (apply-cont cont (cons sym val)))))

(define subst1-cont
  (lambda (new old slist cont)
    (lambda (val1)
      (subst-1 new old slist
               (subst2-cont val1 cont)))))

(define subst2-cont
  (lambda (val1 cont)
    (lambda (val2)
      (apply-cont cont (cons val1 val2)))))


(define subst-2
  (lambda (new old slist cont)
    (cond
      [(null? slist)
       (cont '())]
      [(symbol? (car slist))
       (if (eq? old (car slist))
           (subst-2 new old (cdr slist)
                    (lambda (val)
                      (cont (cons new val))))
           (subst-2 new old (cdr slist)
                    (lambda (val)
                      (cont (cons (car slist) val)))))]
      [else
       (subst-2 new old (car slist)
                (lambda (val1)
                  (subst-2 new old (cdr slist)
                           (lambda (val2)
                             (cont (cons val1 val2))))))])))

;; test
(subst-2 'z 'a '(a b (a (k (a (d a))) u v e)) (end-cont))