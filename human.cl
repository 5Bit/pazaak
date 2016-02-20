;; This file is dedicated to human players
;; Shoutout to all the humans!

;; class is empty at the moment of unique stuff. Inherits
;; from player, and all inherited stuff is as it was in
;; player.
(defclass human (player)
  ())

;; TODO - finish the run method for the human player!
(defmethod run ((man human))
  (prompt-player man);; prompts the player it is their turn
  ;; play deck card onto board
  (push (take-top-card *deck*) (get-board man))
  (prompt-current-hand) ;;prompts the player the following is their hand
  (print-hand (get-hand-info (get-hand man))) ;; prints the hand cards
  (print-board (get-hand-info (get-board man))) ;; prints the board cards
  (print-player-choices man) ;; prompts the player to choose their actions
  ;; read in the choice
  (setf choice (read))
  ;;(loop while (or (< choice 1) (> choice 
  
  
  
  (print-score (setf (get-score man) (calculate-score man))) ;; sets the score for the player and prints it
  )


;;TODO - get the action of the player!
(defmethod get-choice-action()
  ())