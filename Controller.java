package RhythmGame.GameLogic;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import javax.swing.JOptionPane;
import javax.swing.Timer;

import RhythmGame.Hardware.Audio;
import RhythmGame.People.Player;
import RhythmGame.Screen.Screen;


//class that controls game logic
public class Controller {
	
	//variables that hold user-chosen settings, game statuses, etc. 
	private String difficulty;
	private String song; 
	private Boolean gameStatus; 
	private Boolean paused;
	private Boolean endStatus; 
	private Integer currentScore; 
	public Player player;  
	private Audio music; 
	public ArrayList<Player> highScoreUsers = new ArrayList<Player>();   

  //constructor - set default song, difficulty, score, and statuses
	public Controller() {
		difficulty = "easy";
		song = "sayItAintSo";
		gameStatus = false;
		paused = true;
		endStatus = false; 
		currentScore = 0;
    //try-catch statements to catch all audio-related exceptions
		try {
			music = new Audio(song);
		} catch (LineUnavailableException e) {
			e.printStackTrace();
		} catch (UnsupportedAudioFileException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
    //add default Players to high score array
		highScoreUsers.add(new Player());
		highScoreUsers.add(new Player());
		highScoreUsers.add(new Player()); 
	};
  
	//get length of song from the Audio class
	public long getSongDuration() {
		return music.getSongDuration();
	}

  //fetch user's current score
	public Integer getCurrentScore() {
		return currentScore; 
	}

  //below are some setters and getters for difficulty and song
  
	public void setDifficulty(String choice) {
		difficulty = choice; 
	}
	
	public String getDifficulty() {
		return difficulty;  
	}
	
	public void setSong(String choice) {
		song = choice; 
	}
	
	public String getSong() {
		return song;  
	}

  //function to initialize the game status and create a new Player object - calls the startGame function
	public void setGameStatus(Boolean play) throws LineUnavailableException, UnsupportedAudioFileException, IOException {
		gameStatus = play; 
		player = new Player();
		startGame();  
	}
	
	public Boolean getGameStatus() {
		return gameStatus;  
	}

  //returns array of all high scores and their associated user names
	public ArrayList<Player> getUsers() {
		return highScoreUsers;  
	}

  //used to start the song when the game begins
	public void startGame() throws LineUnavailableException, UnsupportedAudioFileException, IOException {
		music = new Audio(this.getSong()); 
		music.startSong(); 
	}

  //below are two functions to pause and unpause the game, which interacts with the Audio class to pause the song
  
	public void pauseGame() {
		paused = true; 
		music.pauseSong();
	}
	
	public void unpauseGame() {
		paused = false; 
		music.resumeSong(); 
	}

  //function to exit the game and stop the song 
	public void exitGame() {
		gameStatus = false; 
		endStatus = false; 
		music.stopSong(); 
	}
	
	public Boolean getPauseStatus() {
		return paused; 
	}

  //setters and getters for end status - this determines if the user passed or failed the game
  
	public void setEndStatus(Boolean status) {
		endStatus = status; 
	}
	
	public Boolean getEndStatus() {
		return endStatus; 
	}

  //functions that are called to change the score when the user presses a key
  
	public void increaseScore() {
		currentScore = currentScore + 100; 
	}
	
	public void decreaseScore() {
		currentScore = currentScore - 50; 
	}
	
	//function to clear the score when the game is over 
	public void clearScore() {
		currentScore = 0; 
	}

    //function to determine what to do with the user's score - did the user fail the game, succeed, or get a high score? 
	public void handleEndScore(Integer score) {
		player.setScore(score); 
		if(endStatus == false) {
			JOptionPane.showMessageDialog(null, "You have failed the game! Good luck next time.", "Failed Game", JOptionPane.PLAIN_MESSAGE);
		}
		else {
			Boolean newHighScore = false; 
			Integer scoreIndex = 0; 
			for(Player user : highScoreUsers) {
				if(score >= user.getScore()) {
					newHighScore = true; 
					scoreIndex = highScoreUsers.indexOf(user); 
					break; 
				}
			}
			if(newHighScore == true) {
				String name = JOptionPane.showInputDialog("New high score!\r\nPlease enter a user name:");
				if(name != null) {
					player.setUser(name, scoreIndex + 1); 
					highScoreUsers.set(scoreIndex, player);
				}
				else {
				} 
			}
			else {
				JOptionPane.showMessageDialog(null, "You have successfully completed the game!", "Successful Game", JOptionPane.PLAIN_MESSAGE);
			}
		}
	}
}
