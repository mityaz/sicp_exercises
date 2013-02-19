(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

;; Improved sqrt-proc, with modified good-enough? proc

(define (sqrt% x)
  (define (next-step guess next-guess)
    (if (or (= next-guess 0) (good-enough? guess next-guess))
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
(sqrt% 0)