
(define (cubic x) (* x x x))

(define (cubrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubrt-iter (approximate guess x)
                 x)))

(define (approximate guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cubic guess) x)) 0.001))

(define (cubrt x) (cubrt-iter 1.0 x))

;; Test
(cubrt 27)
(cubrt 1000)

