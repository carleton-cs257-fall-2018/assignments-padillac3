package edu.carleton.padillac3.montyhall;

import java.util.Random;

/**
 * This class handles the data behind the game, it contains the Host and PlayerStats objects.
 */
public class Model {
    public Host host;
    public PlayerStats stats;

    public Model() {

    }

    public void newGame(int numberOfDoors){
        this.host = new Host(numberOfDoors);
        this.stats = new PlayerStats();
    }



}
