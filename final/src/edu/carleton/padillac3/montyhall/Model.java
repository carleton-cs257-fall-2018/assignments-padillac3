package edu.carleton.padillac3.montyhall;



import java.util.Random;
import javafx.scene.control.Label;

/**
 * This class handles the data behind the game, it contains the Host and PlayerStats objects.
 */
public class Model {
    public Host host;
    public PlayerStats stats;
    public boolean gameOver;
    public char guessOne;
    public char guessTwo;

    public Model(Host host, Label speechBubble) {
        this.host = host;
        this.host.setSpeechBubble(speechBubble);
        this.newGame();
        this.stats = new PlayerStats();
    }

    public void newGame(){
        this.gameOver = false;
        this.guessOne = 'X';
        this.guessTwo = 'X';
        this.host.resetDoors();
        Random random = new Random();
        int carLocation = random.nextInt(3);
        this.host.setCarDoor(carLocation);
        this.host.speak("Welcome to the Monty Hall Game Show!! \nBehind one of these doors is a car, behind the others... GOATS!! \nSelect a door by pressing the corresponding key, and try to expose the car.");
        this.host.setCarDoor(carLocation);
    }




}
