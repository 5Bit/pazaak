(defclass player ()
  ((hand :initarg :hand 
            :initform (make-shuffled-hand 'hand) 
            :accessor get-hand)
   (board :initarg :board 
         :initform () 
          :accessor get-board)
   (score :initarg :score
          :initform 0
          :accessor get-score)))

;; uses the card if it has it. returns nil if it doesnt have it
;;returns the new hand if the card exists in the list - else, returns nil
(defmethod use-card ((plyr player) card)
  (cond((find-card-in-hand card (get-hand plyr))
      (setf (slot-value plyr 'hand) (remove-card (get-hand plyr) card))
        )
        (t 'nil)))

;;pushes the card given onto the player's board
(defmethod place-card-on-board((plyr player) card)
  (setf (slot-value plyr 'board) (push card (get-board plyr))))

;; Generates a new hand for the player
(defmethod reset-hand ((plyr player))
  (setf (get-hand plyr) (make-shuffled-hand (get-hand plyr))))


;; Calculates the player's score
(defmethod calculate-score ((plyr player))
  (calculate-score-helper (get-board plyr)
                          ))

;; checks for if the player is over twenty
(defmethod over-twenty((plyr player))
  (if(< 20 (calculate-score plyr)) 't 'nil
    ))

;; check for if the player's hand is empty
(defmethod is-hand-empty((plyr player))
  (null(get-hand plyr)))

;;TODO - RUN
;; First, draw card from board
;; then, tell player they can place a card if they have one - IF ELSEIF ELSE situation for these
;; then prompt user that they can either pass
;; or they can hold for the rest of the game