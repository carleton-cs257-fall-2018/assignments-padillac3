package edu.carleton.padillac3.montyhall;

import javafx.fxml.FXML;
import javafx.event.EventHandler;
import javafx.scene.control.Label;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;

public class Controller implements EventHandler<KeyEvent> {
    @FXML private View View;
    @FXML private Label topLabel;
    private Model Model;

    public Controller() {
    }


    public void initialize() {

    }

    private void update(){
        this.topLabel.setText("Monty Hall Problem!");
    }


    @Override
    public void handle(KeyEvent keyEvent) {
    }


}
