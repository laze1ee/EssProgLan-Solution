#lang eopl


(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))

;; Exercise 2.24
(define bintree-to-list
  (lambda (bt)
    (cases bintree bt
      [leaf-node
       (num)
       (list 'leaf-node num)]
      [interior-node
       (key left right)
       (list 'interior-nod
             key
             (bintree-to-list left)
             (bintree-to-list right))])))


;; Exercise 2.25
(define max-interior
  (lambda (bt)
    (let ([node #f]
          [max -inf.0]
          [f #f])
      (set! f
        (lambda (bt)
          (cases bintree bt
            [leaf-node
             (num)
             num]
            [interior-node
             (key left right)
             (let ([sum (+ (f left)
                           (f right))])
               (when (> sum max)
                 (set! node key)
                 (set! max sum))
               sum)])))
      (f bt)
      node)))


;; test
(define tree-1
  (interior-node 'foo (leaf-node 2) (leaf-node 3)))
(define tree-2
  (interior-node 'bar (leaf-node -1) tree-1))
(define tree-3
  (interior-node 'baz tree-2 (leaf-node 1)))

(max-interior tree-3)
(max-interior tree-2)