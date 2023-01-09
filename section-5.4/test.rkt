#lang eopl


(require "ast-types.rkt"
         "store-model.rkt"
         "parser.rkt"
         "evaluation.rkt")


(initialize-store!)


#|
(define code
  '(raise -54404))

(value-of-pgm (a-program (ast-of code)))


(define code1
  '(letrec ([div
             (proc (a b)
                   (if (equ? b 0)
                       (raise -54404)
                       (if (equ? a 0)
                           0
                           (+ 1 (div (- a b) b)))))])
     (+ 99 (try (div 20 0)
                (x)
                (raise -99)))))

(value-of-pgm (a-program (ast-of code1)))


(define code2
  '(letrec ([f1 (proc (n)
                      (if (equ? n 0)
                          (raise -54404)
                          (+ n n)))]
            [f2 (proc (n)
                      (try (f1 n)
                           x
                           (raise -99)))]
            [f3 (proc (n)
                      (try (f2 n)
                           x
                           (+ x -1)))])
     (f3 0)))

(value-of-pgm (a-program (ast-of code2)))


(define code3
  '(letcc hop
          (letrec ([g (proc (n)
                            (if (equ? n 0)
                                0
                                (if (equ? n 5)
                                    (hop -13)
                                    (+ n (g (- n 1))))))])
            (g 4))))

(value-of-pgm (a-program (ast-of code3)))


(define code4
  '(+ 11
      (letcc hop
             (letrec ([g (proc (n)
                               (if (equ? n 0)
                                   0
                                   (if (equ? n 5)
                                       (hop -13)
                                       (+ n (g (- n 1))))))])
               (g 14)))))

(value-of-pgm (a-program (ast-of code4)))
|#

(define code5
  '(letrec
       ([f 5]
        [g (proc
            (n)
            (if (equ? n 0)
                0
                (if (equ? n 5)
                    (letcc hop (begin (set! f hop) (hop -99)))
                    (+ n (g (- n 1))))))])
     (begin 7 (g 6) (f 100))))

;; failed, this will infinitely evaluate f
(value-of-pgm (a-program (ast-of code5)))