#lang eopl


;; Exercise 2.26
(define-datatype red-blue-tree red-blue-tree?
  (leaf-node
   (n integer?))
  (blue-node
   (blues (list-of red-blue-tree?)))
  (red-node
   (left  red-blue-tree?)
   (right red-blue-tree?)))


(define depth
  (lambda (tree d)
    (cases red-blue-tree tree
      [leaf-node
       (n)
       (leaf-node d)]
      [blue-node
       (blues)
       (blue-node
        (depth-trees blues d))]
      [red-node
       (left right)
       (red-node
        (depth left (+ d 1))
        (depth right (+ d 1)))])))

(define depth-trees
  (lambda (trees d)
    (if (null? trees)
        '()
        (cons (depth (car trees) (+ d 1))
              (depth-trees (cdr trees) d)))))


;; test
(define tree
  (red-node
   (blue-node
    (list (leaf-node 11) (red-node (leaf-node 15) (leaf-node 62))))
   (red-node
    (red-node
     (red-node (leaf-node 9)
               (red-node (leaf-node 99) (blue-node '())))
     (blue-node
      (list (blue-node
             (list (leaf-node 75))))))
    (leaf-node 19))))

(depth tree 0)