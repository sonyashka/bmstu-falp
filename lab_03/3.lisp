; задание 1
; (defun ge_even (num) (if (evenp num) num (+ num 1)))
; (print (ge_even 6))
; задание 2
; (defun inc_module (num) (if (< num 0) (- num 1) (+ num 1)))
; (print (inc_module -3))
; задание 3
; (defun list_increase (x y) (if (< x y) (list x y) (list y x)))
; (print (list_increase 13 5))
; задание 4
; (defun first_between_second_and_third (x y z) (or (and (> x y) (< x z)) (and (> x z) (< x y))))
; (print (first_between_second_and_third -4 -2 -5))
; (defun first_between_second_and_third (x y z) (if (> x y) (if (< x z) T Nil) (if (> x z) T Nil)))
; (print (first_between_second_and_third 1 -1 3))
; (defun first_between_second_and_third (x y z) (cond ((> x y) (< x z)) ((> x z) (< x y))))
; (print (first_between_second_and_third 1 -1 3))
; задание 6
; (defun ge (x y) (>= x y))
; (print (ge 4 5))
; (defun lol (x) (if (= x 5) 'eval 'funcall))
; (print(funcall (lol 5) `(- ,(eval (lol 4) (+ 1 3)) 7)))