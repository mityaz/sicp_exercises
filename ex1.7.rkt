(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (close-to-zero? x)
  (< (abs x) 1e-6))

;; Improved sqrt-proc, with modified good-enough? proc

(define (sqrt% x)
  (define (next-step guess next-guess)
    (if (or (close-to-zero? next-guess) (good-enough? guess next-guess))
        next-guess
        (sqrt-iter next-guess x)))
  (define (good-enough? guess next-guess)
    (< (abs (/ (- guess next-guess) next-guess)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (next-step guess (improve guess)))
  (sqrt-iter 1.0 x))

;; Test sample
(square (sqrt% 1e-12)) ;; yuppi!!!! now it's really 1e-12 again!!!
(square (sqrt% 0))