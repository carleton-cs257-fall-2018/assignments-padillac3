package edu.carleton.padillac3.montyhall;

import javafx.fxml.FXML;
import javafx.event.EventHandler;
import javafx.scene.control.Label;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import java.util.concurrent.TimeUnit;

import java.util.ArrayList;

public class Controller implements EventHandler<KeyEvent> {

    private Model model;

    @FXML private Door door1;
    @FXML private Door door2;
    @FXML private Door door3;
    @FXML private Label labelA;
    @FXML private Label labelB;
    @FXML private Label labelC;
    @FXML private Host host;
    @FXML private Label speechBubble;
    @FXML private Label statsLabel;



    public Controller() {

    }


    public void initialize() {
        ArrayList<Door> doorList = new ArrayList<>();
        doorList.add(door1);
        doorList.add(door2);
        doorList.add(door3);
        this.host.setDoors(doorList);
        this.model = new Model(host, speechBubble);

    }


    private void turnOne(char guess){

        //CHANGE SPEECH BUBBLE
        this.host.speak("Good guess. Now I will reveal a goat to you,\nfrom one of the doors you did not choose. OOH! A goat!\nNow you have one final chance to change your guess.\nPick one of the remaining closed doors, and we will see if you win a car.");

        try {TimeUnit.SECONDS.sleep(1);} catch (InterruptedException e) {}
        //REVEAL GOAT
        this.host.revealGoat(guess);


    }

    private void turnTwo(char guess){
        //Reset selector letter styles
        this.labelA.setStyle("-fx-font-size:48px; -fx-font-style:bold;");
        this.labelB.setStyle("-fx-font-size:48px; -fx-font-style:bold;");
        this.labelC.setStyle("-fx-font-size:48px; -fx-font-style:bold;");

        //REVEAL CHOICE
        boolean win = this.host.reveal(guess);
        this.model.gameOver = true;

        //SPEECH BUBBLE
        if (win) {
            this.host.speak("Wow! You win the car! Congratulations on your superior statistical knowledge.\nPress spacebar to play again.");
        } else {
        this.host.speak("Wow! You did not win :( But you do get a goat!\nPress spacebar to play again.");
        }

        //UPDATE STATS
        this.model.stats.addGame(win);
        float[] stats = this.model.stats.getStats();

        String statsDisplay = ("Games Played: " + stats[0] + "\nGames Won: " + stats[1] + "\nWin Percentage: " + stats[2]);

        //DISPLAY STATS
        this.statsLabel.setText(statsDisplay);




    }


    @Override
    public void handle(KeyEvent keyEvent) {
        //FIGURE OUT HOW TO GET MOUSE EVENT AND GET USER DOOR/BUTTON SELECTION

        KeyCode code = keyEvent.getCode();

        if (code == KeyCode.A) {
            if (this.model.guessOne == 'X') {
                //TURN ONE
                this.model.guessOne = 'A';
                this.labelA.setStyle("-fx-font-size:48px; -fx-font-style:bold; -fx-background-color: red;");
                this.turnOne('A');
            } else {
                //TURN TWO
                this.model.guessTwo = 'A';
                this.turnTwo('A');
                this.labelA.setStyle("-fx-font-size:48px; -fx-font-style:bold; -fx-background-color: red;");


            }
        }

        if (code == KeyCode.B) {
            if (this.model.guessOne == 'X') {
                //TURN ONE
                this.model.guessOne = 'B';
                this.labelB.setStyle("-fx-font-size:48px; -fx-font-style:bold; -fx-background-color: red;");
                this.turnOne('B');
            } else {
                //TURN TWO
                this.model.guessTwo = 'B';
                this.turnTwo('B');
                this.labelB.setStyle("-fx-font-size:48px; -fx-font-style:bold; -fx-background-color: red;");

            }
        }

        if (code == KeyCode.C) {
            if (this.model.guessOne == 'X') {
                //TURN ONE
                this.model.guessOne = 'C';
                this.labelC.setStyle("-fx-font-size:48px; -fx-font-style:bold; -fx-background-color: red;");
                this.turnOne('C');
            } else {
                //TURN TWO
                this.model.guessTwo = 'C';
                this.turnTwo('C');
                this.labelB.setStyle("-fx-font-size:48px; -fx-font-style:bold; -fx-background-color: red;");

            }
        }



        if (code == KeyCode.SPACE && this.model.gameOver == true) {
            this.labelA.setStyle("-fx-font-size:48px; -fx-font-style:bold;");
            this.labelB.setStyle("-fx-font-size:48px; -fx-font-style:bold;");
            this.labelC.setStyle("-fx-font-size:48px; -fx-font-style:bold;");

            this.model.newGame();
        }




    }


}
