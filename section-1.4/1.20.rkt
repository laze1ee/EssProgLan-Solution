#lang eopl


;; Exercise 1.20
(define count-occurrences
  (lambda (s slist)
    (if (null? slist)
        0
        (let ([x (car slist)])
          (cond
            [(symbol? x)
             (if (eq? s x)
                 (+ 1 (count-occurrences s (cdr slist)))
                 (count-occurrences s (cdr slist)))]
            [(list? x)
             (+ (count-occurrences s x)
                (count-occurrences s (cdr slist)))]
            [else
             (eopl:error 'count-occurrences
                         "Invalid type: ~s" x)])))))

;; test
(count-occurrences 'x '((f x) y (((x z) () x))))