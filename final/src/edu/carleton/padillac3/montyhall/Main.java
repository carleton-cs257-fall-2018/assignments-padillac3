package edu.carleton.padillac3.montyhall;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        FXMLLoader loader = new FXMLLoader(getClass().getResource("montyhall.fxml"));
        Parent root = loader.load();
        primaryStage.setTitle("Monty Hall");

        Controller controller = loader.getController();
        root.setOnKeyPressed(controller);
        primaryStage.setScene(new Scene(root, 900, 600));
        primaryStage.show();
        root.requestFocus();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
