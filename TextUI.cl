;; UI stuff goes in here!


;; Prints the start game text
(defun print-startup()
  (format t "Starting up Pazaak...~%" )
  (format t "Welcome to Pazaak!~%" ))


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
6. A player may instantly win if they have 9 cards out on the table, while still maintaining
the previous rules.~%"))

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
;;6. A player may instantly win if they have 9 cards out on the table, while still maintaining
;;the previous rules.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;TODO - update when more play types are implemented
;; DEFUN A CHOOSE YOUR PLAYTYPE HERE ( For starters only make it able
;; to play against another player)
(defun print-play-types()
  (format t "1: Player versus Player ~%" )
  (format t "2: Player versus AI (Easy)~%") ;; have easy use the simple AI
  ;;(format t "3: Player versus AI (Medium)~%")
  )

;; Prompt the players to set their names
;; Returns the name chosen
(defun prompt-change-name ()
  (format t "Please provide a 1-word name:") (read))

(defun main-menu()
  (format t "Choose one of the following by typing in its number.~%")
  (format t "1: Get Rules~%")
  (format t "2: Play~%")
  (format t "3: Quit~%")
  )

(defun quit-menu()
  (format t "Are you sure you want to quit Pazaak?")
  )


;;TODO - clean up function and remove that ugly NIL at the end of every print print-hand makes!
;; defun a method to print cards currently in the hand of the player provided
;; hand must be provided as a list of (num modifier)
;; reduces the number of prompts for the cards with the if statements
(defun print-hand(hand)
  (if(>(length hand) 0) (format t "1:   ~a, ~a ~%" (second (first hand)) (first (first hand))))
  (if(>(length hand) 1) (format t "2:   ~a, ~a ~%" (second (second hand)) (first (second hand))))
  (if(>(length hand) 2) (format t "3: ~a, ~a ~%" (second (third hand)) (first (third hand))))
  (if(>(length hand) 3) (format t "4:  ~a, ~a ~%" (second (fourth hand)) (first (fourth hand)))))

;; Method that prints all of the cards currently on the board with the board provided as a list
;; of the following format:
;; hand must be provided as a list of (num modifier)
(defun print-board(hand)
  (loop for item in hand
        do(format t "on Board: ~a ~a ~%" (second item) (first item))))

;; Defun a method to print the current player's turn choices (place card, pass, stand, forfeit)
(defmethod print-player-choices((plyr player))
  (format t "~%Player ~a, the following are your possible actions:~%" (get-name plyr))
  (if (equal (is-hand-empty plyr) nil)  (format t "1. Play a hand card.~%"))
  (format t "2. Pass your turn.~%")
  (format t "3. Stand with your current board.~%")
  (format t "4. Quit the game.~%")
  )

;; Prompts the player to choose their hand card
(defun prompt-to-choose-hand-card ()
  (format t "~%Please choose the number of a card in your hand.~%")
  )

;; Printout prompt written before the current hand
(defun prompt-current-hand ()
  (format t "~%Your current hand is:~%"))

;; Used to prompt the player it is their turn.
(defmethod prompt-player ((plyr player))
  (format t "It is now ~a's turn." (get-name plyr)))

;; Display's the score given
(defmethod print-score(num)
  (format t "~%Your score is now: ~d~%~%" num))
  