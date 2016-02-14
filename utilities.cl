;;THE FOLLOWING ARE UTILITY FUNCTIONS

;;; The Parameters for the cards.
;; modifiers for cards
(defparameter *modifiers* '(positive negative))
;; All values a card can hold
(defparameter *values* '(10 9 8 7 6 5 4 3 2 1))

;;Global variable for the deck
;;; A global variable for the deck
(defvar *deck* nil)
(defvar *player-one-hand* nil)
(defvar *player-two-hand* nil)


;; End of variables and parameters
;; Functions beyond this point



;; makes a deck of 1 to 10 with 4 items 
(defun make-deck ()
  (mapcan #'(lambda (modifier)
              (mapcar #'(lambda (value) (make-card :value value :modifier modifier)) *values*)) 
    '(positive positive positive positive)))


;; Used to make a deck of hand cards - positive and negative
(defun make-hand-Deck()
  (mapcan #'(lambda (modifier)
              (mapcar #'(lambda (value) (make-card :value value :modifier modifier)) *values*)) *modifiers*))


;; Give the player's board, and calculate's that player's score
(defun calculate-score-helper(player-board)
  (loop for item in player-board
      sum
        (if (equal (card-modifier item) 'positive) (card-value item) (- (card-value item))))
  )



;; Get's the top card, and removes it from the deck.
(defun take-top-card (deck)
  (if (null deck) 'nil)
  (setf returnVal (car deck))
  (setf *deck* (cdr deck)) returnVal)


;; Reduces the *random-hand* to a size of 4
(defun hand-reducer (hand)
  (setf hand (list (car hand) (car (cdr hand)) (car (cdr (cdr hand))) (car (cdr (cdr (cdr hand)))))))


;; Utility function - returns a random element from (lis)
(defun rand-element (lis)
  (nth (random (length lis)) lis))


;; Shuffles the deck destructively
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
(defun make-shuffled-deck ()
  (setf *deck* (let ((deck (make-deck)))
    (shuffle deck)
    deck)))


;; Used to make a shuffled hand and place it into the player-hand
(defun make-shuffled-hand (player-hand) ;; bug is in the setf here - it wont allow me to change the variable passed in.
  (setf player-hand (hand-reducer (let ((player-hand (make-hand-deck)))
                                       (shuffle player-hand)
                                    player-hand))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; clean the code in this block! Ugly solution to a problem.
;; Come up with a more elegant solution!
;; Uses make-shuffled-hand to assign player-one's hand randomly
(defun make-shuffled-hand-player-one ()
    (setf *player-one-hand* (hand-reducer (let ((player-hand (make-hand-deck)))
                                       (shuffle player-hand)
                                            player-hand))))


;; does the same as above - clean up
(defun make-shuffled-hand-player-two ()
    (setf *player-two-hand* (hand-reducer (let ((player-hand (make-hand-deck)))
                                       (shuffle player-hand)
                                            player-hand))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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


(defun remove-card (deck card)
  (cond ((null deck) 'nil)
        ((card-compare card (car deck)) (remove-card (cdr deck) card))
        (t (cons (car deck) (remove-card (cdr deck) card)))))


;; Set up in the format: (make-card :value 5 :modifier 'Positive)
;;constructor function: make-structname                  
;;Predicate: structname-p
;;Copier: copy-structname
;;Accessor functions for slots: structname-slotname
;; structure for all cards
(defstruct card modifier value)
