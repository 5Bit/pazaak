;; This is the main class, used to decide between what version of the game a user will play.


(defclass mainGame ()
  ((game :initarg :game 
            :initform  ()
            :accessor get-game)
   (roundNumber :initarg :roundNumber
         :initform ()
          :accessor get-round-number)
   ))

;;TODO - make this fully complete, with submenus and a quit choice
;; the run method for the main game
(defmethod run((game mainGame))
  
  
  (print-startup)
  
  ;; encase in a while loop that checks if the player has chosen to exit the game and confirmed
  ;; they want to exit
  (main-menu)
  ;; if the player chooses to get the rules, do the following:
  (print-rules)
  ;; go to sub-menus
  
  )

;; used to decide the game the player would like to play
(defmethod choose-game()
  (print-play-types)
  )