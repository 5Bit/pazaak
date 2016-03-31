# pazaak
Common Lisp - Recreating Pazaak as featured in KOTOR as a text-based card game. Goals include Player versus player gameplay on a single system, and player versus AI on a single system. Being developed with Allegro CL.

Load the files in the following order:
utilities.cl
playerClasses.cl
TextUI.cl
Game.cl
human.cl
AiPlayerClass.cl
node.cl
pvaigame.cl
mainGame.cl

Simply type the following after loading all the files:
	(run (make-instance 'maingame))

Follow the instructions the game provides regarding how to make your choices.
The game includes instructions in the main menu, as you will see when the game initializes.
All choices in the game are made with numbers to the left of the item in question - use those numbers to make your choices.
That's really all that needs to be done! I pride my project on simple usability!

If you are looking to modify the game, you can easily do so! I built the project in Allegro, if the knowledge is needed.
Furthermore, All classes are seperated into their own files. Some methods can be found within the UI file, but almost all of the
utilities file and the UI file are global functions for usability and ease. While normally I would shy away from global functions,
I found the use to be rather encouraged within LISP.
