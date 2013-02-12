;; In this exercise we simply 
;; evaluate some expressions.
;; You must trust me, that I have done it before in
;; my mind and results were the same ;)

10 ; yes, it's 10
(+ 5 3 4) ; 12
(- 9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6)) ; 8 + (-2) = 6
(define a 3) ; now a = 3
(define b (+ a 1)) ; and b = 4
(+ a b (* a b )) ; 3 + 4 + 3 * 4 = 19
(= a b) ; false (or as scheme says #f)
(if (and (> b a) (< b (* a b)))
    b
    a) ; true and true is true, so b -- > 4
(cond
  ((= a 4) 6)
  ((= b 4) (+ 6 7 a))
  (else 25)) ; second condition is true, so 6 + 7 + 3 = 16
(+ 2 (if (> b a) b a)) ; b > a, so 2 + b = 2 + 4 = 6 
(* (cond
     ((> a b) a)
     ((< a b) b)
     (else -1)
     )
   (+ a 1)) ; 4 * 4 = 16