package edu.carleton.padillac3.montyhall;

import java.io.File;
import java.io.FileNotFoundException;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

/**
 * This class represents a door object. It contains information about what's behind the door, and whether the door is open.
 */
public class Door extends ImageView {
    private boolean car;




    public Door() {

    }


    public void setOpen() throws FileNotFoundException {
        if (car) {
            File image = new File("src/edu/carleton/padillac3/montyhall/door-opened-car.jpg");
            this.setImage(new Image(image.toURI().toString()));
        } else {
            File image = new File("src/edu/carleton/padillac3/montyhall/door-opened-goat.jpg");
            this.setImage(new Image(image.toURI().toString()));
        }
    }


    public void setCar() {
        this.car = true;
    }

    public void unsetCar() {
        this.car = false;
    }
}
