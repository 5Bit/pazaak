;; status details
;; Standing = 3 ;;Standing a turn ends this turn and all turns to come
;; Forfeit = (forfeit);;Forefeits the game - opponent wins

(defclass player ()
  ((hand :initarg :hand 
            :initform (make-shuffled-hand 'hand) 
            :accessor get-hand)
   (board :initarg :board 
         :initform () 
          :accessor get-board)
   (score :initarg :score
          :initform 0
          :accessor get-score)
   (name :initarg :name
         :initform "TANTARUS"
         :accessor get-name)
   (status :initarg :status
         :initform ()
           :accessor get-status)))

;; warning - does not place directly onto the board.
;; uses the card if it has it. returns nil if it doesnt have it
;;returns the new hand if the card exists in the list - else, returns nil
(defmethod use-card ((plyr player) card)
  (cond((find-card-in-hand card (get-hand plyr))
      (setf (slot-value plyr 'hand) (remove-card (get-hand plyr) card))
        )
        (t 'nil)))



;;Set the name of the player
(defmethod set-name ((plyr player) str)
  (setf (slot-value plyr 'name) str
    ))

;;Set the status of the player
(defmethod set-status ((plyr player) val)
  (setf (slot-value plyr 'status) val))

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
;; returns T if under 20
(defmethod over-twenty((plyr player))
  (< 20 (calculate-score plyr)))

;; check for if the player's hand is empty
(defmethod is-hand-empty((plyr player))
  (null(get-hand plyr)))

(defmethod play-deck-card((plyr player))
  (setf (slot-value plyr 'board) (push (take-top-card *deck*) (get-board plyr))
    ))