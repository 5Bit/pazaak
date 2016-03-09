;;THE FOLLOWING ARE UTILITY FUNCTIONS/ITEMS

;;; The Parameters for the cards.
;; modifiers for cards
(defparameter *modifiers* '(positive negative))
;; All values a card can hold
(defparameter *values* '(10 9 8 7 6 5 4 3 2 1))
(defparameter *player1* nil)
(defparameter *player2* nil)
;;Global variable for the deck
;;; A global variable for the deck
(defvar *deck* nil)
;; End of variables and parameters
;; Functions beyond this point

;; makes a deck of 1 to 10 with 4 items 
(defun make-deck ()
  ;; mapcan loops for all the different modifiers, loops through the values, and assigns of one each to the deck cards
  ;; Makes 40 cards total
  (mapcan #'(lambda (modifier)
              (mapcar #'(lambda (value) (make-card :value value :modifier modifier)) *values*)) 
    '(positive positive positive positive)))


;; Used to make a deck of hand cards - positive and negative
(defun make-hand-Deck()
  ;; Similar to make-deck, except uses both positive and negative cards, and only makes 20
  (mapcan #'(lambda (modifier)
              (mapcar #'(lambda (value) (make-card :value value :modifier modifier)) *values*)) *modifiers*))

;; Give the player's board, and calculate's that player's score
;; by looping through the board and summing up card values.
;; checks if cards are positive or negative and adds accordingly
(defun calculate-score-helper(player-board)
  (loop for item in player-board
      sum
        (if (equal (card-modifier item) 'positive) (card-value item) (- (card-value item))))
  )


;; Get's the top card, and removes it from the deck.
;; Modifies the *deck* variable directly
(defun take-top-card (deck)
  (if (null deck) 'nil)
  (let (( returnVal (car deck)))
  (setf *deck* (cdr deck)) returnVal))


;; Reduces the *random-hand* to a size of 4 by setting the hand to just the 4 cards on the top
(defun hand-reducer (hand)
  (setf hand (list (car hand) (car (cdr hand)) (car (cdr (cdr hand))) (car (cdr (cdr (cdr hand)))))))


;; Utility function - returns a random element from (lis)
(defun rand-element (lis)
  (nth (random (length lis)) lis))


;; Shuffles the deck destructively
;;From the professor's original card system - saw no need to modify
(defun shuffle (deck)
  (if (null (cdr deck))
      nil
    (let* ((this-card (car deck))
           (cdr-size (length (cdr deck)))
           (loc-to-swap (random cdr-size))
           (card-to-swap (nth loc-to-swap (cdr deck))))
      (setf (car deck) card-to-swap)
      (setf (nth loc-to-swap (cdr deck)) this-card)
      (shuffle (cdr deck)))))


;; used to make a shuffled deck of all positive numbers, and puts the deck in *deck*
;; also from the professor's original card system - saw no need to modify
(defun make-shuffled-deck ()
  (setf *deck* (let ((deck (make-deck)))
    (shuffle deck)
    deck)))

;; Used to make a shuffled hand and set it into the player-hand
(defun make-shuffled-hand (player-hand) 
  (setf player-hand (hand-reducer (let ((player-hand (make-hand-deck)))
                                       (shuffle player-hand)
                                    player-hand))))

;; compare cards - returns T if true and same card, NIL if false
(defun card-compare (card card2)
  (and (equal (card-modifier card) (card-modifier card2))
       (equal (card-value card) (card-value card2))
       ))

;; finds the location of target-card in the hand.
;; if it is within the hand, it returns t
;; if it is not within the hand, it returns NIL
(defun find-card-in-hand (target-card hand)
  (loop for card in hand
      do (if (card-compare target-card card) (return 't))))

;; Removes the card from the deck
;; helper - recursive
;; compares the card with the card it is looking for. if found, removes it,
;;if not, no card removed
(defun remove-card (deck card)
  (cond ((null deck) 'nil)
        ((card-compare card (car deck)) (remove-card (cdr deck) card))
        (t (cons (car deck) (remove-card (cdr deck) card)))))

;; used to make cards easier. Takes in just a value and a modifier.
;; Modifiers must be either in the format 'positive or 'negative
;; values must be between 1 and 10
(defun create-card (val mod)
  (make-card :value val :modifier mod))

;; Returns the modifier of the supplied card
(defun get-card-modifier (card)
  (slot-value card 'modifier))

;; Returns the value of the supplied card
(defun get-card-value (card)
  (slot-value card 'value))

;;Helper to get card information easier
(defun get-card-info (card)
  (list (get-card-value card) (get-card-modifier card)))

;; Creates a copy of the card given
(defun copy-card (card)
  (make-card :value (get-card-value card) :modifier (get-card-modifier card)))

;; Set up in the format: (make-card :value 5 :modifier 'Positive)

(defstruct card modifier value)

;; loops through the hand provided and puts them in a single list
(defun get-hand-info (hand)
  (loop for item in hand
      collect (get-card-info item))) ;; 

;; Inserting items that must be done here
(make-shuffled-deck) ;; always done just to get it over with


;; THE FOLLOWING FUNCTIONS ARE FOR TESTING;;;;;;;;;;;;;;;;

;; used to create two player classes - sets them to player1 and player2
(defun create-players ()
  (setf *player1* (make-instance 'player))
  (setf *player2* (make-instance 'player))
  T)