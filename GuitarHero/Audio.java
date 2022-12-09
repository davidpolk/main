package RhythmGame.Hardware;

import java.io.File;
import java.io.IOException;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

//class that holds all audio processing functionality
public class Audio { 
	
	//variables for audio streaming 
	File audioFile; 
	Clip clip; 
	AudioInputStream stream; 
	
	//variables for song length and pause stats 
	long songDuration; 
	long pauseTime;
	Boolean paused;

  //initialize the audio file by creating a clip which loads the song
	public Audio(String song) throws LineUnavailableException, UnsupportedAudioFileException, IOException {
		audioFile = new File("./Audio/" + song + ".WAV"); 
		clip = AudioSystem.getClip(); 
		stream = AudioSystem.getAudioInputStream(audioFile); 
		clip.open(stream);
		paused = false; 
		pauseTime = 0; 
		setSongDuration(song); 
	}

	public Boolean getPauseState() {
		return paused; 
	}

  //set the song's length (in milliseconds) depending on which song it is 
	public void setSongDuration(String song) {
		if(song == "sayItAintSo") {
			songDuration = 257000; 
		}
		else if(song == "paranoid") {
			songDuration = 169000; 
		} 
		else {
			songDuration = 207000; 
		}
	}

  //find the duration of the song - this is used to determine when the game should end
	public long getSongDuration() {
		return songDuration; 
	}

  //the following methods control the playing of the song - starting, stopping, pausing, etc. 
  
	public void startSong() {
		clip.start();
		paused = false; 
	}
	
	public void pauseSong() {
		if(paused == false) {
			pauseTime = clip.getMicrosecondPosition(); 
			clip.stop(); 
			paused = true; 
		}
	}
	
	public void resumeSong() {
		if(paused == true) {
			clip.setMicrosecondPosition(pauseTime); 
			clip.start();
			paused = false; 
		}
	}
	
	public void stopSong() {
		clip.close();
	}
}