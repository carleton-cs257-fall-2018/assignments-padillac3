package edu.carleton.padillac3.montyhall;


/**
 * This class stores information about the current session, how many games the player has played and won.
 */
public class PlayerStats {
    private float winPercentage;
    private float gamesPlayed;
    private float gamesSwitched;
    private float gamesWon;
    private float switchedGamesWon;
    private float switchedGamesWinPercentage;
    private float nonSwitchedGameWinPercentage;

    public PlayerStats() {
        this.gamesPlayed = 0;
        this.winPercentage = 0;
        this.gamesWon = 0;
        this.gamesSwitched = 0;
        this.switchedGamesWon = 0;
        this.switchedGamesWinPercentage = 0;
        this.nonSwitchedGameWinPercentage = 0;
    }

    public void addGame(boolean win, boolean switched) {
        this.gamesPlayed++;
        if (win) {this.gamesWon++;}
        if (switched) {
            this.gamesSwitched++;
            if (win) {this.switchedGamesWon++;}
        }
        this.winPercentage = this.gamesWon / this.gamesPlayed * 100;
        if (this.gamesSwitched > 0){
            this.switchedGamesWinPercentage = this.switchedGamesWon / this.gamesSwitched * 100;
        }
        if (this.gamesPlayed - this.gamesSwitched > 0) {
            this.nonSwitchedGameWinPercentage = (this.gamesWon - this.switchedGamesWon) / (this.gamesPlayed - this.gamesSwitched) * 100;
        }

    }

    public float[] getStats() {
        float[] stats = new float[4];
        stats[0] = this.gamesPlayed;
        stats[1] = this.gamesWon;
        stats[2] = this.switchedGamesWinPercentage;
        stats[3] = this.nonSwitchedGameWinPercentage;
        return stats;
    }


}
