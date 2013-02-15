;; UPDATED
;; The commented out procedure is way uneffective
;; (in worst case up to six comparisons)

(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x) (square y)))
(define (maximum x y) (if (> x y) x y)) ;; max is already defined and does the same, defined here for learning purposes

(define (square-two-largest x y z)
  (cond
    ((> x y) (sum-of-square x (maximum y z)))
    (else (sum-of-square y (maximum x z)))))

;;(define (square_two_largest x y z)
;;  (cond
;;    ((and (> x z) (> y z)) (sum_of_square x y))
;;    ((and (> y x) (> z x)) (sum_of_square y z))
;;    ((and (> z y) (> x y)) (sum_of_square z x))
;;    (else (sum_of_square x y)))) ;; all 3 are equal, any two numbers


;; Call procedure
(square-two-largest 1 2 3) ;; 4 + 9 = 13
(square-two-largest 1 3 2) ;; 4 + 9 = 13
(square-two-largest 2 3 1) ;; 4 + 9 = 13
(square-two-largest 3 2 1) ;; 4 + 9 = 13