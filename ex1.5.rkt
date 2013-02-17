;; p-procedure will get into infinitive loop
;; for calling itself.
;;
;; When 'fully expand and then reduce'
;; evaluation method (normal-order evaluation)
;; is used, p will not be called and 0 will be returned instead.

;; In the case with 'evaluate the arguments and then apply'
;; evaluation method (applicative-order evaluation)
;; all arguments will have to be evaluated before comparison
;; within if-clause. So, we get into the infinitive loop

;; Notice: Dr.Racket and R5RS uses applicative-order evaluation

;; При вызове p-процедуры мы попадаем в бесконечный цикл

;; Если интерпретатор использует "нормальный" способ вычисления
;; (сначала полностью "разворачивает" выражение, а затем лишь производит
;; вычисления) то в тестовом примере вызова (p) не будет.
;; В случае же аппликативного способа вычисления, сперва будут вычислены _все_
;; выражения в составе общего выражения, а затем лишь будет производиться
;; разворачивание и сворачивание выражения. И на этапе вычисления выражений
;; мы попадем в бесконечный цикл (рекурсивный вызов функции самой себя).

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))


;; Running Tests
(test 0 (p))
