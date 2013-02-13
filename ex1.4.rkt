;; This procedure calculates predicate b > 0
;; and returns corresponding expression.
;; What's amazing, is that in scheme operations (*, +, etc)
;; are also expressions, that can be evaluated.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 4 -3) ;; 7
