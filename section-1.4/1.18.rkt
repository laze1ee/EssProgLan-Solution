#lang eopl


;; Exercise 1.18
(define swapper
  (lambda (s1 s2 slist)
    (if (null? slist)
        '()
        (let ([s (car slist)])
          (cond
            [(symbol? s)
             (cond
               [(eq? s s1)
                (cons s2 (swapper s1 s2 (cdr slist)))]
               [(eq? s s2)
                (cons s1 (swapper s1 s2 (cdr slist)))]
               [else
                (cons (car slist)
                      (swapper s1 s2 (cdr slist)))])]
            [(list? s)
             (cons (swapper s1 s2 s)
                   (swapper s1 s2 (cdr slist)))]
            [else
             (eopl:error 'swapper "Invalid type: ~s" s)])))))

;; test
(swapper 'x 'y '((x) y (z (x))))