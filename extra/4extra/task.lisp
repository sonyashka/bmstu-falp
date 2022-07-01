; написать reverse в 3 строки без append, setf...
(defun my-reverse (lst &optional (buf-lst Nil))
    (cond ((null lst) buf-lst)
          (t (my-reverse (cdr lst) (cons (car lst) buf-lst)))))
; (print (my-reverse '(a b c (d e) f)))
; бегущие по мосту люди, за один раз максимум 2 человек. у них один фонарь, найти мин время
(defun get-time (elem) (cdr elem))
(defun max-time (x y) (if (< (get-time x) (get-time y)) (get-time y) (get-time x)))
(defun append-elem (lst elem &optional (before-lst Nil))
    (cond ((and (null lst) (null before-lst)) (cons elem Nil))
          ((null lst) (my-reverse (cons elem before-lst)))
          (t (append-elem (cdr lst) elem (cons (car lst) before-lst)))))
(defun append-lst (lst1 lst2 &optional (before-lst Nil))
    (cond ((and (null lst1) (null lst2)) before-lst)
          ((not (null lst1)) (append-lst (cdr lst1) lst2 (append-elem before-lst (car lst1))))
          (t (append-lst lst1 (cdr lst2) (append-elem before-lst (car lst2))))))

(defun insert-elem (lst elem &optional (before-lst Nil))
    (cond ((and (null lst) (not (null before-lst))) (append-elem before-lst elem))
          ((null lst) (cons elem Nil))
          ((< (get-time elem) (get-time (car lst))) (append-lst (append-elem before-lst elem) lst))
          (t (insert-elem (cdr lst) elem (append-elem before-lst (car lst))))))
(defun sort-on-time (lst &optional (res-lst Nil)) 
    (cond ((null lst) res-lst)
          (t (sort-on-time (cdr lst) (insert-elem res-lst (car lst))))))
(defun reduce-last-two-elem (lst)
    (cond ((or (null lst) (null (cdr lst))) Nil)
          (t (my-reverse (cddr (my-reverse lst))))))
(defun last-two-elem (lst)
    (let*
        ((rev (my-reverse lst)))
        
        (cond ((or (null lst) (null (cdr lst))) Nil)
          (t (cons (cadr rev) (cons (car rev) Nil))))))
(defun num-of-people (lst &optional (cnt 0)) 
    (cond ((null lst) cnt)
          (t (num-of-people (cdr lst) (+ cnt 1)))))
(defun bridge-run (left-side &optional (right-side Nil) (sum-time 0) (iter 0))
  (or (format t "left ~a right ~a ~d ~d~%" left-side right-side sum-time iter)
    (cond ((or (null left-side) (null (car left-side))) (and (print sum-time) (not (terpri)) (terpri)))
          ((and (= (num-of-people left-side) 1) (null right-side)) (get-time (car left-side)))
          ((or (> (num-of-people left-side) 3) (/= iter 0))
            (cond ((= iter 0) (bridge-run (cddr left-side) 
                    (insert-elem (insert-elem right-side (car left-side)) (cadr left-side)) 
                    (+ sum-time (max-time (car left-side) (cadr left-side))) 
                    (+ iter 1)))
                  ((= iter 1) (bridge-run (insert-elem left-side (car right-side))
                    (cdr right-side) (+ sum-time (get-time (car right-side))) (+ iter 1)))
                  ((= iter 2) (bridge-run (reduce-last-two-elem left-side)
                    (append-lst right-side (last-two-elem left-side))
                    (+ sum-time (max-time (car (last-two-elem left-side)) 
                    (cadr (last-two-elem left-side)))) (+ iter 1)))
                  (t (bridge-run (insert-elem left-side (car right-side))
                    (cdr right-side) (+ sum-time (get-time (car right-side))) (- iter 3)))))
          ((= (num-of-people left-side) 3) (bridge-run (cons (cadr left-side) Nil)
            (insert-elem (insert-elem right-side (caddr left-side)) (car left-side))
            (+ sum-time (max-time (car left-side) (caddr left-side)))))
          ((= (num-of-people left-side) 2) 
            (bridge-run Nil (insert-elem (insert-elem right-side (car left-side)) (cadr left-side))
            (+ sum-time (max-time (car left-side) (cadr left-side)))))
          (t (bridge-run (insert-elem left-side (car right-side)) (cdr right-side) (+ sum-time (get-time (car right-side)))))))
  )

(defun start-run (lst)
  (cond ((null lst) (format t "Некому бежать:("))
        (t (bridge-run (sort-on-time lst)))))

(start-run '(("a" . 99) ("b" . 99) ("c" . 1) ("d" . 2)))