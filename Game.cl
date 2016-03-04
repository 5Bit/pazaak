
;; standard game - can have two players. 
;; Inherit from this to make games of
;; two humans and games of two AI
(defclass game ()
  ((player1 :initarg :player1 
            :initform  (make-instance 'human)
            :accessor get-player1)
   (player2 :initarg :player2 
         :initform (make-instance 'human)
          :accessor get-player2)
   (quit :initarg :quit
          :initform 'nil
          :accessor quit?)
   ))

;; Returns a list of the players who are over twenty.
(defmethod over-twenty-check ((gme game))
  (let ((temp ()))
  (cond ((over-twenty (get-player1 gme)) (push temp (get-player1 gme)))
        ((over-twenty (get-player2 gme)) (push temp (get-player2 gme)))
        (t 'nil))
  temp))

;; a method to setup the game!
(defmethod setup-game ((gme game))
  (set-player-names gme)
  )

;; Prompts both players to set their names
(defmethod set-player-names ((gme game))
  (format t "PLAYER 1~%")
  (set-name (get-player1 gme) (prompt-change-name))
  (format t "PLAYER 2~%")
  (set-name (get-player2 gme) (prompt-change-name))
  )

;; used to run the game.
(defmethod run ((gme game))
   (setup-game gme) ;; setup the game first
  
  ;; players aren't standing
  ;; and if either player isn't quitting. Might need nested loop
  ;; inside it.
  ;; loop while each player is not forefieting or over or they stand  their score...
  (loop while 
        (and (and (quitting? gme) (both-standing? gme)) (and (null (over-twenty (get-player1 gme))) (null (over-twenty (get-player2 gme)))))
        do
        (game-round gme)
        )
  ;; Determine winner, and print that stuffola!
  (if(eql (winner? gme) 'draw) (format t "The game is a draw!") 
    (format t "The winner is ~a" (winner? gme)))
  )




;; Tests if either player is quitting
(defmethod quitting? ((gme game))
        (and (not (equal 4 (get-status (get-player1 gme)))) (not (equal 4 (get-status (get-player2 gme)))))
  )


;; Tests if both players are standing
(defmethod both-standing?((gme game))
  (or (not (equal 3 (get-status (get-player1 gme)))) (not (equal 3 (get-status (get-player2 gme)))))
  )


;; Used to determine the winner of the game
(defmethod winner? ((gme game))
  (cond ((over-twenty (get-player1 gme)) (get-name (get-player2 gme)))
        ((over-twenty (get-player2 gme)) (get-name (get-player1 gme)))
        ((> (get-score (get-player1 gme)) (get-score (get-player2 gme))) (get-name (get-player1 gme)))
        ((< (get-score (get-player1 gme)) (get-score (get-player2 gme))) (get-name (get-player2 gme)))
        (t 'draw)))

(defmethod game-round ((gme game))
  ( if(not (eql (get-status (get-player1 gme))3)) (run (get-player1 gme)))
  ( if(not (eql (get-status (get-player2 gme))3)) (run (get-player2 gme)))
  )  


;; THE FOLLOWING ARE FOR TESTING;;;;;;;;;;;;;;;;
;;(setf game (make-instance 'game))