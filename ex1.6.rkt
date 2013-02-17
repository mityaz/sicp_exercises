;; Проблема с версией if от Алисы состоит в том,
;; что т.к. как было выяснено в упражнении 1.5
;; текущая реализация Scheme использует аппликативный метод
;; вычисления, то в каждом новом вызове функции sqrt-iter
;; должные будут вычислены два выражения, и это не зависит от
;; того, какой результат возвратит предикат. Т.е. даже в тот момент,
;; когда предикат возвратит true и должен быть вернут guess, все равно
;; будет вновь и вновь вычислятся sqrt-iter. Таким образом произойдет
;; накопление данных в стеке и программа "вылетит" со stack-overflow
;;
;; В отличии от new-if стандартные средства scheme (if и cond) производят
;; вычисление выражения в зависимости от значения предиката. Т.е. в конце-концов
;; когда вычисление будет закончено и необходимо возвратить guess -- sqrt-iter не
;; будет вызвано.
;;

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (_sqrt x) (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
  (else else-clause)))

(_sqrt 16)

