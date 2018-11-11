Chris Padilla and Yasmeen Awad

Description: An interactive graphical interface for the Monty Hall problem.
The Monty Hall problem traditionally describes a game show where the contestant
chooses one of three identical doors at random, aiming for the one with a car
behind it. The show host then reveals a goat from behind one of the doors the 
contestant did not choose. The contestant then has the option to either stick
with their initially chosen door or switch to a different one to try and get
the car. It is not immediately obvious, but switching doors will always yield
a higher chance of getting the car than sticking with the original door. This
notion becomes increasingly clear with increasing numbers of doors. The user 
will have the option to select how many doors to choose from, and will try to 
get the door which hides the car rather than a goat. The objective of the 
program is to help the user understand the optimal strategy to get the car 
in the end. 

Why MVC: The model for this project will consist of the information about what
is currently behind each door, the host's strategy for revealing doors, and
statistics on the user's success rate in ending up with the car. The view will
consist of the door graphics, and the display of the user's statistics. The 
Controller will facilitate communication between the Model and the View.

Core Classes in Model: Host, Door, PlayerStats

