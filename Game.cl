
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
  (setf temp ())
  (cond ((over-twenty (get-player1 gme)) (push temp (get-player1 gme)))
        ((over-twenty (get-player2 gme)) (push temp (get-player2 gme)))
        (t 'nil))
  temp)


;; Prompts both players to set their names
(defmethod set-player-names ((gme game))
  (format t "PLAYER 1~%")
  (set-name (get-player1 gme) (prompt-change-name))
  (format t "PLAYER 2~%")
  (set-name (get-player2 gme) (prompt-change-name))
  )


;; Used to determine the winner of the game
(defmethod winner? ((gme game))
  (cond ((over-twenty (get-player1 gme)) 'player2)
        ((over-twenty (get-player2 gme)) 'player1)
        ((> (get-score (get-player1 gme)) (get-score (get-player2 gme))) (get-name (get-player1 gme)))
        ((< (get-score (get-player1 gme)) (get-score (get-player2 gme))) (get-name (get-player2 gme)))
        (t 'draw)))

(defmethod run ((gme game))
  ( if(not (eql (get-status (get-player1 gme))3)) (run (get-player1 gme)))
  ( if(not (eql (get-status (get-player2 gme))3)) (run (get-player2 gme)))
  )  


;; THE FOLLOWING ARE FOR TESTING;;;;;;;;;;;;;;;;
;;(setf game (make-instance 'game))