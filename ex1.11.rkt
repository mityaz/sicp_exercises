;; f(n) = n if n < 3, f(n) = f(n-1) + 2 * f(n-2) + 3 * f(n-3) if n >=3

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(define (f-iter n)
  (define (calc-result x y z)
    (+ x (* 2 y) (* 3 z)))
  (define (f-iter% a b c counter)
    (cond
          ((< n 3) n)
          ((= (- counter n) 0) a)
          (else (f-iter% (calc-result a b c) a b (+ counter 1)))))
  (f-iter% 2 1 0 2))


(f-rec 0)
(f-rec 1)
(f-rec 2)
(f-rec 3) ; f(3-1) + 2 * f(3-2) + 3 * f(3-3) = 2 + 2 * 1 + 3 * 0 = 4
(f-rec 4)
(f-rec 5) ; f(4) + 2 * f(3) + 3 * f(2) = (f(3) + 2 * f(2) + 3 * f(1)) + 2 * [ 4 ] + 6 =  4 + 4 + 3 + 8 + 6 = 25
(f-rec 10) ; hard to calculate, says that it is 1892


(f-iter 0)
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 10) ; proved to be 1892
