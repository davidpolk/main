package RhythmGame.Debug;

import static org.junit.Assert.assertEquals;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

import org.junit.jupiter.api.Test;

import RhythmGame.GameLogic.Controller;
import RhythmGame.Hardware.Audio;
import RhythmGame.Hardware.Block;
import RhythmGame.People.Player;

//this is the JUnit file that tests all relevant classes and their methods

public class GameTest {
	
	@Test
	public void testPlayer() {
		Player p1 = new Player();
		p1.setUser("Mike", 1);
		assertEquals("Mike", p1.getUserName());
		assertEquals(1, p1.getRank());
		assertEquals(0, p1.getScore());
	}
	
	@Test
	public void testBlock() {
		Block block = new Block(200, 100, 115, 445); 
		assertEquals(200, block.getWidth()); 
		assertEquals(100, block.getHeight()); 
		assertEquals(115, block.getXPos()); 
		assertEquals(445, block.getYPos()); 
		block.setColor("Red");
		block.setLetter("F");
		assertEquals("Red", block.getColor()); 
		assertEquals("F", block.getLetter()); 
	}
	
	@Test
	public void testAudio() throws LineUnavailableException, UnsupportedAudioFileException, IOException {
		Audio music = new Audio("sayItAintSo"); 
		music.setSongDuration("sayItAintSo");
		assertEquals(257000, music.getSongDuration()); 
		music.startSong(); 
		assertEquals(false, music.getPauseState());
		music.pauseSong();
		assertEquals(true, music.getPauseState());
		music.resumeSong();
		assertEquals(false, music.getPauseState());
		music.stopSong(); 
	}
	
	@Test
	public void testController() throws LineUnavailableException, UnsupportedAudioFileException, IOException {
		Controller logic = new Controller(); 
		assertEquals(257000, logic.getSongDuration()); 
		logic.increaseScore(); 
		logic.increaseScore();
		logic.increaseScore();
		logic.increaseScore();
		logic.decreaseScore();
		assertEquals(350, logic.getCurrentScore()); 
		logic.setDifficulty("hard");
		logic.setSong("paranoid");
		assertEquals("hard", logic.getDifficulty()); 
		assertEquals("paranoid", logic.getSong()); 
		assertEquals("Empty", logic.getUsers().get(0).getUserName()); 
		assertEquals(0, logic.getUsers().get(0).getScore());
		logic.setGameStatus(true);
		assertEquals(true, logic.getGameStatus()); 
		logic.pauseGame();
		assertEquals(true, logic.getPauseStatus());
		logic.unpauseGame();
		assertEquals(false, logic.getPauseStatus());
		logic.setEndStatus(true);
		assertEquals(true, logic.getEndStatus()); 
		logic.exitGame(); 
		assertEquals(false, logic.getEndStatus());
		assertEquals(false, logic.getGameStatus());
		logic.clearScore(); 
		assertEquals(0, logic.getCurrentScore());
	}

}
