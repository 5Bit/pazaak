;; UI stuff goes in here!


;; Prints the start game text
(defun print-startup()
  (format t "Starting up Pazaak...~%" )(format t "Welcome to Pazaak!~%" ))


;; Prints the game rules to the user
(defun print-rules()
  (format t "Pazaak Rules
===============================================================================================
1. Each player will have a turn during each round.~%
2. During their turn, the player will draw a card from the shared deck. This card will
automatically be added to your board.~%
3. During your turn, you can play a card from your hand. You can also choose to pass your turn,
stand with your board until the end of the game, or forfiet the game.~%
4. If at the end of either players turn their score (calculated by adding up all the numbers on 
their board) is above 20, they automatically lose.~%
5. Cards have two modifiers - positive and negative. All cards from the deck are positive.~%
6. Final rule - have fun!"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Pazaak rules

;;1. Each player will have a turn during each round.
;;2. During their turn, the player will draw a card from the shared deck. This card will
;;automatically be added to your board.
;;3. During your turn, you can play a card from your hand. You can also choose to pass your turn,
;;stand with your board until the end of the game, or forfiet the game.
;;4. If at the end of either players turn their score (calculated by adding up all the numbers on 
;;their board) is above 20, they automatically lose.
;;5. Cards have two modifiers - positive and negative. All cards from the deck are positive.
;;6. Final rule - have fun!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;TODO - update when more play types are implemented
;; DEFUN A CHOOSE YOUR PLAYTYPE HERE ( For starters only make it able
;; to play against another player)
(defun print-play-types()
  (format t "1: Player versus Player ~%" ))

;;TODO
;; DEFUN a method to determine if a player is over 20 - if so, they lose!


;;TODO
;; Defun a method to print cards currently on the board of the player provided



;;TODO - clean up function and remove that ugly NIL at the end of every print print-hand makes!
;; defun a method to print cards currently in the hand of the player provided
;; hand must be provided as a list of (num modifier)
(defun print-hand(hand)
  (if(>(length hand) 0) (format t "CardOne:   ~a, ~a ~%" (second (first hand)) (first (first hand))))
  (if(>(length hand) 1) (format t "CardTwo:   ~a, ~a ~%" (second (second hand)) (first (second hand))))
  (if(>(length hand) 2) (format t "CardThree: ~a, ~a ~%" (second (third hand)) (first (third hand))))
  (if(>(length hand) 3) (format t "CardFour:  ~a, ~a ~%" (second (fourth hand)) (first (fourth hand)))))

;;TODO
;; Defun a method to print the current player's turn choices (place card, pass, stand, forfeit)