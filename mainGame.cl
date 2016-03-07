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
  
  ;; if the player chooses to get the rules, do the following:
  (let ((choice -1))
    (loop while (null (equal choice 0))
          do(main-menu)
          do(setf choice (get-user-input game 3))
          do(cond ((equal choice 1) (print-rules))
                 ((equal choice 3) (setf choice 0)))
    ;;(if (equals choice 3) (setf quitGame 1))
  ;; go to sub-menus
          do(if (equal choice 1) (main-menu))
          do(if (equal choice 2) (choose-game game))
          ;;do(if (equal choice 2) (setf choice 0))
          )))

;; used to decide the game the player would like to play
(defmethod choose-game((game maingame))
  (let ((choice -1))
    (loop while (null (equal choice 0))
          do(print-play-types)
          do(setf choice (get-user-input game 2))
          do(if (equal choice 1) (run (make-instance 'game)))
          do(if (equal choice 1) (setf choice 0))
          do(if (equal choice 2) (run (make-instance 'pvaigame)))
          do(if (equal choice 2) (setf choice 0))
          )
  ))

;; get's the user input and returns it.
(defmethod get-user-input((gme maingame) numOfChoices)
   (let ((choice -1))
     (loop while (or (< choice 1) (> choice numOfChoices)) do(setf choice (read)))
      choice))