;; Going to build the AI player here!
;; A lot of code will likely be similar to the human player class
;; Difficulty must be set at the start
;; only 3 difficulties to keep processing time low
;; Easy - 1 ply
;; Medium - 2 ply
;; Hard - 3 ply

;; TODO - Fill accordingly
(defclass AIPlayer(player)
  ())


;;TODO
;; Used to run the Ai's turn
(defmethod run ((aip AIPlayer))
  (if (equal (get-status aip) 3) return nil) ;; if passing, pass
  (prompt-player aip);; prompts the player it is the Ai's turn
  ;; play deck card onto board
  (push (take-top-card *deck*) (get-board aip))
  (prompt-current-hand) ;;prompts the player the following is their hand
  (print-hand (get-hand-info (get-hand aip))) ;; prints the hand cards
  (print-board (get-hand-info (get-board aip))) ;; prints the board cards
  

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

;;TODO - make initalization method and put it at start of run

;; TODO - make togglePrints to toggle AIP printouts for debugging

;; TODO - calculate-OpponentScore - used to get the opponents score.
;; May need to have AI use bland names - will make easier to automate
;; this - either that, or have reference to game. Will need to test
;; if it gets a reference or a copy.

;; TODO - calculate-Score - Calculate own score

;; TODO - make-Move - will return the next move. Calculate using a tree
;; and nodes. 

;; TODO - move-helper for make-move. Make this recursive, and makemove
;; the public setup method

;; TODO - calculate-successors Calculate Successors

