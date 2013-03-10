; Pascal row
;     1     1-st row
;    1 1    2-nd row
;   1 2 1   3-d row
;  1 3 3 1
; 1 4 6 *4 1

; Calculates n-th element in r-th row
; Element marked by * is: [5,4]
; Number of elements in the row is the same 
; as the number of the row
; If some error takes place 
; (number of element is greater than 
; maximum number of elements in the row)
; than result is 0
; First and last elements of the row always equal to 1
;; Else we use recursion to find current element as: [row-1, num-1] + [row-1, num]

(define (find-element row num)
  (cond ((> num row) 0)
        ((or (= num 1) (= num row)) 1)
        (else (+ (find-element (- row 1) (- num 1))
                 (find-element (- row 1) num)))))

(find-element 5 4) ; looks to be true
(find-element 5 3)
(find-element 1 1)
(find-element 1 2) ; error (no such element)
(find-element 2 1)
(find-element 2 2)
(find-element 5 5)
