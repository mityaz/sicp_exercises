
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

;;
;; Improved version
;;

(define (_cubrt x)
  (define (next-step guess next-guess)
    (if (good-enough? guess next-guess)
        guess
        (cubrt-iter next-guess x)))
  (define (good-enough? guess next-guess)
    (< (abs (- guess next-guess)) 0.001))
  (define (approximate guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (define (cubrt-iter guess x)
    (next-step guess (approximate guess)))
  (cubrt-iter 1.0 x))

;; Test
(cubic(cubrt 27))
(cubic(cubrt 1000))
(cubic(cubrt 0.002))

(cubic(_cubrt 27))
(cubic(_cubrt 1000))
(cubic(_cubrt 0.002))

(cubrt (cubic 0.002))   ; answer is far from truth
(_cubrt (cubic 0.002))  ; pretty close


