(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

(define (_sqrt x)
  (define (sqrt-iter guess x)
    (define (good-enough? guess)
      (< (abs (- (square guess) x)) 0.001))
    (define (improve guess)
      (average guess (/ x guess)))
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess)
                   x)))
  (sqrt-iter 1.0 x))

;; Improved sqrt-proc, with modified good-enough? proc

(define (__sqrt x)
  (define (sqrt-iter guess x)
    (define (good-enough? guess next-guess)
      (< (abs (- guess next-guess)) 0.001))
    (define (improve guess)
      (average guess (/ x guess)))
    (if (good-enough? guess (improve guess))
        guess
        (sqrt-iter (improve guess)
                   x)))
  (sqrt-iter 1.0 x))

;; Tests to show, that current implemenation
;; is not valid for large and small numbers

(square (_sqrt 12345))
(square (_sqrt 123456))
(square (_sqrt 1234567))
(square (_sqrt 12345678))
(square (_sqrt 123456789))
(square (_sqrt 1234567890))
(square (_sqrt 12345678901))
(square (_sqrt 123456789012))
(square (_sqrt 1234567890123))

(square (_sqrt 0.123))
(square (_sqrt 0.00123))
(square (_sqrt 0.000123))
(square (_sqrt 0.0000123))
(square (_sqrt 0.00000123))
(square (_sqrt 0.000000123))
(square (_sqrt 0.0000000123))
(square (_sqrt 0.00000000123))
(square (_sqrt 0.000000000123))

;; Same tests with alternative implementation
;; for good-enough?

(square (__sqrt 12345))
(square (__sqrt 123456))
(square (__sqrt 1234567))
(square (__sqrt 12345678))
(square (__sqrt 123456789))
(square (__sqrt 1234567890))
(square (__sqrt 12345678901))
(square (__sqrt 123456789012))
(square (__sqrt 1234567890123))

(square (__sqrt 0.123))
(square (__sqrt 0.00123))
(square (__sqrt 0.000123))
(square (__sqrt 0.0000123))
(square (__sqrt 0.00000123))
(square (__sqrt 0.000000123))
(square (__sqrt 0.0000000123))
(square (__sqrt 0.00000000123))
(square (__sqrt 0.000000000123))