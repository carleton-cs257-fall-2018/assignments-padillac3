package edu.carleton.padillac3.montyhall;

import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.control.Label;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Random;
import java.util.ArrayList;


/**
 * This class represents the Host. It is the virtual opponent that is running the game show. It knows where the car is, and makes decisions about which goats are revealed.
 */
public class Host extends ImageView {
    private int carDoor;
    private Label speechBubble;
    private ArrayList<Door> doorList;



    public Host() {

    }

    public void speak(String message){
        this.speechBubble.setText(message);
    }

    public void setCarDoor(int index){
        this.carDoor = index;
        this.doorList.get(carDoor).setCar();
    }

    public void setSpeechBubble(Label speechBubble){
        this.speechBubble = speechBubble;
    }

    public void setDoors(ArrayList<Door> doorList){
        this.doorList = doorList;
    }

    public void revealGoat(char guess){
        Random random = new Random();
        int guessInt;
        if (guess == 'A') {guessInt = 0;} else if (guess == 'B'){guessInt = 1;} else {guessInt = 2;}
        int goatDoor = random.nextInt(3);
        while (goatDoor == carDoor || goatDoor == guessInt) {
            goatDoor = random.nextInt(3);
        }
        try {
            doorList.get(goatDoor).setOpen();
        } catch (FileNotFoundException e) {System.out.println("File not Found!");}
    }

    public boolean reveal(char guess){
        int guessInt;
        if (guess == 'A') {guessInt = 0;} else if (guess == 'B'){guessInt = 1;} else {guessInt = 2;}

        try {
            doorList.get(guessInt).setOpen();
        } catch (FileNotFoundException e) {System.out.println("File not Found!");}

        if (guessInt == this.carDoor){
            return true;
        } else {
            return false;
        }
    }

    public void resetDoors() {
        for (int i = 0; i < 3; i++){
            doorList.get(i).setImage(new Image(new File("src/edu/carleton/padillac3/montyhall/door-closed.jpg").toURI().toString()));
            doorList.get(i).unsetCar();
        }
    }




}


