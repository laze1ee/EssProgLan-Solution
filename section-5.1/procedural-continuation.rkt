#lang eopl


(define end-cont
  (lambda (cont)
    (lambda (val)
      (eopl:printf "End of computation.~%")
      (eopl:printf "~s~%" val)
      val)))

(define equ?-cont
  (lambda (vals exps env saved-cont)
    (lambda (val)
      (let ([vals (append vals (list val))])
        (if (null? exps)
            (apply-cont saved-cont (=? vals))
            (value-of/k (car exps) env
                        (equ?-cont vals (cdr exps) env saved-cont)))))))

;; ...


(define apply-cont
  (lambda (cont val)
    (cont val)))