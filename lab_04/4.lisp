; задание 3
; (defun my-rev1 (lst) (car (reverse lst)))
; (defun my-rev2 (lst) (car (last lst)))
; задание 4 - список без последнего элемента
; (defun remove-last1 (lst) (reverse (cdr (reverse lst))))
; (print (remove-last1 '(a b c (d e) (d e))))
; (defun remove-last2 (lst) (if (null (cdr (cdr lst))) (cdr lst) (cons (car lst) (remove-last2 (cdr lst)))))
; (print (remove-last2 '(a b c (d e) (d e))))
; задание 5 - кости
(defun roll-dice () (+ (random 6) 1))
(defun player-score-in-sum (ind) 
    (let*
        ((f (roll-dice))
        (s (roll-dice)))

        (or (format t "player ~d: ~d ~d~%" ind f s) (+ f s))
    )
)

(defun game-start (player1 player2)
    (let* 
        ((player1 (if (null player1) (player-score-in-sum 1) player1)))

        (cond ((or (= player1 7) (= player1 11)) (format t "player 1 win: ~d!~%" player1))
            ((or (= player1 2) (= player1 12)) 
                (or (format t "player 1 another turn~%") (game-start Nil player2)))
            (t (let* 
                    ((player2 (if (null player2) (player-score-in-sum 2) player2)))

                    (cond ((or (= player2 7) (= player2 11)) (format t "player 2 win: ~d~%" player2))
                        (t (cond ((> player1 player2) (format t "player 1 win: ~d~%" player1))
                                ((> player2 player1) (format t "player 2 win: ~d~%" player2))
                                (t (format t "draw!~%"))))
                )))
        )
    )
)

(setf *random-state* (make-random-state t))
(game-start Nil Nil)