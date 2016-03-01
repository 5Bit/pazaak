;; This file is dedicated to human players
;; Shoutout to all the humans!

;; class is empty at the moment of unique stuff. Inherits
;; from player, and all inherited stuff is as it was in
;; player.
(defclass human (player)
  ())


;; Used to run the player's turn
(defmethod run ((man human))
  (if (equal (get-status man) 3) return nil)
    (format t "--------------------------------------------------------------~%")
  (prompt-player man);; prompts the player it is their turn
  ;; play deck card onto board
  (push (take-top-card *deck*) (get-board man))
  
  (print-score (setf (get-score man) (calculate-score man))) ;; sets the score for the player and prints it
  (prompt-current-hand) ;;prompts the player the following is their hand
  (print-hand (get-hand-info (get-hand man))) ;; prints the hand cards
  (print-board (get-hand-info (get-board man))) ;; prints the board cards
  (print-player-choices man) ;; prompts the player to choose their actions
  ;; read in the choice
  (setf choice -1)
  (if (is-hand-empty man) 
      (loop while (or (< choice 2) (> choice 4)) do(setf choice (read))) 
      (loop while (or (< choice 1) (> choice 4)) do(setf choice (read))) )
  ;; Call according action
  ;; 1 - play hand card - prompt player to choose a card, and then play it.
  (if (equal choice 1) (prompt-to-choose-hand-card))
  (if (equal choice 1) 
      (place-card-on-board man (setf temp (nth (-  (human-use-card man) 1) (get-hand man)))))
  (if (equal choice 1) (use-card man temp)) ;; removes the card just used!
  (print-score (setf (get-score man) (calculate-score man))) ;; sets the score for the player and prints it
  ;; 2 - pass turn
  (if (equal choice 2) return nil)
  ;; 3 - stand
  (if (equal choice 3) (set-status man 3))
  ;; 4 - forfeit game
  (if (equal choice 4) (set-status man 4))
  )

(defmethod human-use-card ((man human))
  (setf temp -1)
  (loop while (or (< temp 1) (> temp (length (get-hand man))))
        do(setf temp (read)))
  temp
  )