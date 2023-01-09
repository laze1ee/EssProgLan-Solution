#lang eopl


(define subst
  (lambda (slist old new)
    (cond
      [(null? slist) '()]
      [(symbol? (car slist))
       (if (eq? old (car slist))
           (cons new (subst (cdr slist) old new))
           (cons (car slist) (subst (cdr slist) old new)))]
      [else
       (cons (subst (car slist) old new)
             (subst (cdr slist) old new))])))

(define end-cont
  (lambda ()
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "This sentence should appear only once.~%")
      (eopl:printf "~s~%" val)
      val)))


(define subst-2
  (lambda (cont slist old new)
    (cond
      [(null? slist)
       (cont '())]
      [(symbol? (car slist))
       (if (eq? old (car slist))
           (subst-2 (lambda (val)
                      (cont (cons new val)))
                    (cdr slist) old new)
           (subst-2 (lambda (val)
                      (cont (cons (car slist) val)))
                    (cdr slist) old new))]
      [else
       (subst-2 (lambda (val1)
                  (subst-2 (lambda (val2)
                             (cont (cons val1 val2)))
                           (cdr slist) old new))
                (car slist) old new)])))

;; test
(subst-2 (end-cont) '(a b (a (k (a (d a))) u v e)) 'a 'z)