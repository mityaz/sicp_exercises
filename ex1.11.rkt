;; f(n) = n if n < 3, f(n) = f(n-1) + 2 * f(n-2) + 3 * f(n-3) if n >=3

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(define (f-iter



(f-rec 3) ; f(3-1) + 2 * f(3-2) + 3 * f(3-3) = 2 + 2 * 1 + 3 * 0 = 4
(f-rec 4)
(f-rec 5) ; f(4) + 2 * f(3) + 3 * f(2) = (f(3) + 2 * f(2) + 3 * f(1)) + 2 * [ 4 ] + 6 =  4 + 4 + 3 + 8 + 6 = 25
