; задание 4
; (print (list 'a 'c))
; (print (cons 'a '(b c)))
; (print (caddr '(1 2 3 4 5)))
; (print (cons 'a (cons 'b 'c)))
; (print (list 'a '(b c)))
; (print (list (+ 1 (length '(1 2 3)))))
; задание 5
; (defun longer_then (l1 l2) (> (length l1) (length l2)))
; (print (longer_then '(a b) '(a b)))
; задание 6
; (print (cons 3 '(list 5 6)))
; (print (list 3 'from 9 'lives (- 9 3)))
; (print (+ (length for 2 too) (car '(21 22 23))))
; (print (cdr '(cons is short for ans)))
; (print (car (list 'one 'two)))
; задание 7
; (defun mystery (x) (list (second x) (first x)))
; (print (mystery '(one two)))
; (print (mystery (last '(one two three))))
; (print (mystery '(free)))
; задание 8
; (defun f-to-c (temp) (* (/ 5 9) (- temp 320)))
; (print (f-to-c 451))
; задание 9
; (print (eval (eval (list 'cons t Nil))))
; (print (apply #'cons '(t Nil)))
; (print (eval (list 'eval Nil)))

; (defvar x '(1 2 3))
; (print `(x ,x ,@x))
; (defvar x 6)
; (defun x () 9)
; (print `(,@x))
; (print (caddr '(1 2 3)))