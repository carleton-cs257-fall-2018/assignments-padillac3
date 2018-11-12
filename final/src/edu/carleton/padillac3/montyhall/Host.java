package edu.carleton.padillac3.montyhall;

import java.util.ArrayList;
import java.util.Random;


/**
 * This class represents the Host. It is the virtual opponent that is running the game show. It knows where the car is, and makes decisions about which goats are revealed.
 */
public class Host {
    private int numberOfDoors;
    private int carDoor;
    public ArrayList<Door> doorList = new ArrayList<Door>();

    public Host(int numberOfDoors){
        this.numberOfDoors = numberOfDoors;
        Random random = new Random();
        this.carDoor = random.nextInt(this.numberOfDoors);
        for (int i = 0; i < this.numberOfDoors; i++) {
            if (i == this.carDoor){
                doorList.add(new Door(true));
            } else {
                doorList.add(new Door(false));
            }
        }

    }

}


