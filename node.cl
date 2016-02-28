;; Make node class in here.

;; Node class
(defclass node ()
  ((game-state :initarg :game-state
            :initform  () ;; will hold the game
            :accessor get-game-state)
   (parent-node :initarg :parent-node 
         :initform ()
          :accessor get-parent-node)
   (score :initarg :score
          :initform 'nil
          :accessor get-score)
   (player-number :initarg :player-number
          :initform 'nil
                  :accessor get-player-number)
   (beta :initarg :beta ;; for discerning the current
         :initform 'nil
         :accessor get-beta)
   (myply :initarg :myply ;; for discerning the current ply
          :initform 'nil
          :accessor get-myply)
   (prints :initarg :prints ;; For discerning if it should print out debugging text
          :initform 't
          :accessor get-prints)
   ))






;; Have multiple initializers for nodes;;;;;;;;;;;;;;;;;;

;; TODO - one that has board, the playernumber, and the ply
;; this one will be used for a search. Will be used as root

;; TODO One that has the game state, and the parent node.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO - need method that returns calculated score for this current game state

;; TODO - Need method to get the score from this game state

;; TODO - Need method to get the ply of this node

;; TODO - Need method for getting the player number for this node

;; TODO - need method to get player number for this node

;; TODO - need a method to return a deep copy of this current game state