package edu.carleton.padillac3.montyhall;

import java.util.ArrayList;
import java.lang.Math;

/**
 * This class stores information about the current session, how many games the player has played and won.
 */
public class PlayerStats {
    private float winPercentage;
    private float gamesPlayed;
    private float gamesWon;

    public PlayerStats() {
        this.gamesPlayed = 0;
        this.winPercentage = 0;
        this.gamesWon = 0;
    }

    public void addGame(boolean win) {
        this.gamesPlayed++;
        if (win) {this.gamesWon++;}
        this.winPercentage = this.gamesWon / this.gamesPlayed * 100;
    }

    public float[] getStats() {
        float[] stats = new float[3];
        stats[0] = this.gamesPlayed;
        stats[1] = this.gamesWon;
        stats[2] = this.winPercentage;
        return stats;
    }


}
