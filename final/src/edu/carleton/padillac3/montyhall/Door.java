package edu.carleton.padillac3.montyhall;

/**
 * This class represents a door object. It contains information about what's behind the door, and whether the door is open.
 */
public class Door {
    private boolean car;
    private boolean open = false;
    //ID VARIABLE?


    public Door(boolean car){
        this.car = car;
    }

    public boolean getCar() {
        return this.car;
    }

    public void setOpen() {
        this.open = true;
    }

    public boolean getOpen() {
        return this.open;
    }
}
