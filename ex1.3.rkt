(define (square x) (* x x))
(define (sum_of_square x y) (+ (square x) (square y)))

(define (square_two_largest x y z)
  (cond
    ((and (> x z) (> y z)) (sum_of_square x y))
    ((and (> y x) (> z x)) (sum_of_square y z))
    ((and (> z y) (> x y)) (sum_of_square z x))
    (else (sum_of_square x y)))) ;; all 3 are equal, any two numbers

;; Call procedure
(square_two_largest 1 2 3) ;; 4 + 9 = 13
(square_two_largest 1 3 2) ;; 4 + 9 = 13
(square_two_largest 2 3 1) ;; 4 + 9 = 13
(square_two_largest 3 2 1) ;; 4 + 9 = 13