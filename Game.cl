
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
  


;;TODO - TEST
;; Returns a list of the players who are over twenty.
(defmethod over-twenty-check ((gme game))
  (setf temp ())
  (cond ((over-twenty (get-player1 gme)) (push temp (get-player1 gme)))
        ((over-twenty (get-player2 gme)) (push temp (get-player2 gme)))
        (t 'nil))
  temp)

;;TODO - TEST
;; Used to determine the winner of the game
(defmethod winner? ((gme game))
  (cond ((over-twenty (get-player1 gme)) 'player2)
        ((over-twenty (get-player2 gme)) 'player1)
        ((> (get-score (get-player1 gme)) (get-score (get-player2 gme))) (get-name (get-player1 gme)))
        ((< (get-score (get-player1 gme)) (get-score (get-player2 gme))) (get-name (get-player2 gme)))
        (t 'draw)))