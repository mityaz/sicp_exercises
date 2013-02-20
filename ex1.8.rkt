
(define (cubic x) (* x x x))

;; Что примечательно, нижеприведенная функция
;; начинает "нормально" работать, если число не больше 1e-6
(define (close-to-zero? x)
  (< (abs x) 1e-6))

;;
;; Improved version
;;

(define (cubrt x)
  (define (next-step guess next-guess)
    (if (or (close-to-zero? next-guess) (good-enough? guess next-guess))
        next-guess
        (cubrt-iter next-guess x)))
  (define (good-enough? guess next-guess)
    (< (abs (/ (- guess next-guess) next-guess)) 0.001))
  (define (approximate guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (define (cubrt-iter guess x)
    (next-step guess (approximate guess)))
  (cubrt-iter 1.0 x))

;; Test
(cubic(cubrt 27))
(cubic(cubrt 1000))
(cubic(cubrt 0.002))
(cubic(cubrt 1e-12))
(cubic(cubrt 0))