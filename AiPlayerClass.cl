;; Going to build the AI player here!
;; A lot of code will likely be similar to the human player class
;; Difficulty must be set at the start
;; only 3 difficulties to keep processing time low
;; Easy - 1 ply
;; Medium - 2 ply
;; Hard - 3 ply
;; utilize the status system for automating if they continue to play and stuff


(defclass AIPlayer(player)
  ((opponent :initarg :opponent 
            :initform () 
            :accessor get-opponent))
)

;; Makes a deep copy of the AI
(defmethod AI-Deep-copy ((aip AIPlayer))
  ;; create instance of AIPlayer
  ;; fill said AI Player with deep copies of all the stuff within AIP.
  ;; should copy hand
  (let ((temphand ()));; make an empty temphand
  (loop for item in (get-hand aip)
        do(push (copy-card item) temphand )
        )
  ;; should copy board
  (let ((tempboard ()))
  (loop for item in (get-board aip)
        do(push (copy-card item) tempboard )
        )
  ;; should create a new instance with copies of all of the items given.
  (make-instance 'AIPlayer :board tempboard :hand temphand :score (get-score aip) :name (get-name aip) :status (get-status aip))
  )))


;; Used to run the Ai's turn
(defmethod run ((aip AIPlayer))
  (format t "--------------------------------------------------------------~%")
  
  (if (equal (get-status aip) 3) nil) ;; if passing, pass
  (prompt-player aip);; prompts the player it is the Ai's turn
  ;; play deck card onto board
  (push (take-top-card *deck*) (get-board aip))
  (prompt-current-hand) ;;prompts the player the following is their hand
  (print-hand (get-hand-info (get-hand aip))) ;; prints the hand cards
  (print-board (get-hand-info (get-board aip))) ;; prints the board cards
  
  
  ;; for basic testing purposes - this AI has no intelligence and just keeps
  ;; accumulating cards
  (simpleAI aip)
  
  
  ;; PUT AI CHOICES IN HERE! Call it's minimax, have it run the search for
  ;; the correct path, and implement it's choice
  
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CODE FROM HUMAN CLASS ;;;;;;;;;;;;;;;;;;;;
  ;; Might need;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; 2 - pass turn
  ;;(if (equal choice 2) return nil)
  ;; 3 - stand
  ;;(if (equal choice 3) (set-status man 3))
  ;; 4 - forfeit game
  ;;(if (equal choice 4) (set-status man 4))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  )



;; Creates a list of all successors for this state
(defmethod calculate-successors ((aip AIPlayer))
  (let ((successors ()))
    (let ((tempstate ()))
  ;; if hand isn't empty, make successors for playing each card
  (if (not (is-hand-empty aip)) 
      (loop for crd in (get-hand aip)
            do(setq tempstate (AI-Deep-Copy aip))
            do(place-card-on-board tempstate crd)
            do(use-card tempstate crd)
            do(push tempstate successors)
            )))
  ;; the one that could just pass...
  (push (AI-Deep-Copy aip) successors) 
  
  ;; Create standing successor
  (let ((tempsucc (AI-Deep-Copy aip)))
  (setf (get-status tempsucc) 3)
  (push tempsucc successors))
  
  successors))


;;SIMPLE AI
;; just checks if the score is above 15. If it is, it stands. Else, it passes.
(defmethod simpleAI((aip aiplayer))
  (if (> (calculate-score aip) 15) (format t "~%~a is standing." (get-name aip)))
  (if (> (calculate-score aip) 15) (setf (get-status aip) 3))
  
  )