package RhythmGame.Screen;

import java.awt.*;

import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import javax.swing.*;

import RhythmGame.GameLogic.Controller;
import RhythmGame.Hardware.Block;


//class that creates the GUI and all key/action listeners 
public class Screen extends JFrame {

  //instantiate a Controller object to interact with the listeners
  Controller gameLogic = new Controller();
  
  //boolean variables that signal if a block has reached the end, if a key is correct, and if the esc key was pressed (respectively) 
  Boolean reachedEnd = false; 
  Boolean correct = false; 
  Boolean escPressed = false;
  
  //variables to keep track of which block indexes to remove and which block index was correct
  int toRemove = 0;
  int correctBlock = 0;  
  
  //variable to keep track of how many times the game was played
  static int timesPlayed = 0; 
  
  //variable that controls timer increments - used to space out the distribution of blocks
  int timerCt = 0; 
  
  //arraylist of blocks that will fall down the screen
  public ArrayList<Block> movingBlocks = new ArrayList<Block>(); 
  public Block movingF = new Block(100, 80, 15, -50); 
  public Block movingG = new Block(100, 80, 115,-50); 
  public Block movingH = new Block(100, 80, 215, -50); 
  public Block movingJ = new Block(100, 80, 315, -50);
  
  //arraylist of static blocks that act as destinations for the falling blocks 
  public ArrayList<Block> destinationBlocks = new ArrayList<Block>(); 
  public Block blockF = new Block(100, 80, 15, 450); 
  public Block blockG = new Block(100, 80, 115, 450); 
  public Block blockH = new Block(100, 80, 215, 450); 
  public Block blockJ = new Block(100, 80, 315, 450); 

  //array of all relevant keys that are used in the game (F, G, H, and J keys)
  public ArrayList<String> keyLetters = new ArrayList<String>();

  //variables that help determine the timing of the game
  public Timer gameTimer;
  public Boolean continueTimer;
  public Date time = new Date(System.currentTimeMillis());
  public long blockTime;
  public long keyPressTime;
  public static long timerStartTime;

  //variables that randomize the blocks
  public Random randomizer = new Random();
  public Integer randomInt;
  public String randomLetter;

  //variables that are used in determining if the keypress is correct or not (or if a key was pressed at all) 
  public String neededKey;
  public String pressedKey;
  public Boolean isKeyPressed;

  //variable to store how many times the user has pressed the wrong key or missed a key
  public static Integer numMisses;

  //create new cardlayout (which allows the GUI to change screens when an option is pressed)
  private CardLayout card = new CardLayout();
  private String currentCard;

  //all screens used in program
  private JPanel mainScreen = new JPanel(new BorderLayout());
  private JPanel titleScreen = new JPanel(); 
  private JPanel songScreen = new JPanel();
  private JPanel difficultyScreen = new JPanel();
  private JPanel highScoresScreen = new JPanel();
  private JPanel gameScreen = new JPanel()
  {
	  //method to draw graphics onto the JPanel
	  @Override
	  public void paintComponent(Graphics graphic) {
	      Graphics2D graphic2 = (Graphics2D) graphic;
	      super.paintComponent(graphic);
	      graphic2.setColor(Color.BLACK);
	      
	      //draw lines that separate the blocks into lanes
	      graphic2.setStroke(new BasicStroke(3));
	      graphic2.drawLine(15, 0, 15, 500);
	      graphic2.drawLine(115, 0, 115, 500);
	      graphic2.drawLine(215, 0, 215, 500);
	      graphic2.drawLine(315, 0, 315, 500);
	      graphic2.drawLine(415, 0, 415, 500);
	      
	      //draw destination blocks with their respective colors 
	      graphic2.setStroke(new BasicStroke(1));
	      graphic2.setColor(Color.RED);
	      graphic2.fillRect(blockF.getXPos(), blockF.getYPos(), blockF.getWidth(), blockF.getHeight());
	      graphic2.setColor(Color.YELLOW);
	      graphic2.fillRect(blockG.getXPos(), blockG.getYPos(), blockG.getWidth(), blockG.getHeight());
	      graphic2.setColor(Color.BLUE);
	      graphic2.fillRect(blockH.getXPos(), blockH.getYPos(), blockH.getWidth(), blockH.getHeight());
	      graphic2.setColor(Color.GREEN);
	      graphic2.fillRect(blockJ.getXPos(), blockJ.getYPos(), blockJ.getWidth(), blockJ.getHeight());
	      
	      //iterate through array of moving blocks and draw each of them onto the screen
	      int index = 0; 
	      for(Block block : movingBlocks) {
	    	  graphic2.setStroke(new BasicStroke(1));
	    	  if(block.getLetter().equals("F")) {
	    		  graphic2.setColor(Color.RED);
	    	  }
	    	  else if(block.getLetter().equals("G")) {
	    		  graphic2.setColor(Color.YELLOW);
	    	  }
	    	  else if(block.getLetter().equals("H")) {
	    		  graphic2.setColor(Color.BLUE);
	    	  }
	    	  else if(block.getLetter().equals("J")) {
	    		  graphic2.setColor(Color.GREEN);
	    	  }
	    	  graphic2.fillRect(block.getXPos(), block.getYPos(), block.getWidth(), block.getHeight());
	    	  if(correct == true & correctBlock == index){
	    		  graphic2.setColor(Color.ORANGE);
	    	  }
	    	  else {
	    		  graphic2.setColor(Color.BLACK);
	    	  }
	    	  graphic2.setStroke(new BasicStroke(3));
	    	  graphic2.drawRect(block.getXPos(), block.getYPos(), block.getWidth(), block.getHeight());
	    	  index = index + 1; 
	      }
	      
	      //draw borders around the destination blocks
	      graphic2.setStroke(new BasicStroke(3));
	      graphic2.setColor(Color.BLACK);
	      graphic2.drawRect(blockF.getXPos(), blockF.getYPos(), blockF.getWidth(), blockF.getHeight());
	      graphic2.drawRect(blockG.getXPos(), blockG.getYPos(), blockG.getWidth(), blockG.getHeight());
	      graphic2.drawRect(blockH.getXPos(), blockH.getYPos(), blockH.getWidth(), blockH.getHeight());
	      graphic2.drawRect(blockJ.getXPos(), blockJ.getYPos(), blockJ.getWidth(), blockJ.getHeight());
	      
	      //draw key letters inside the destination blocks
	      graphic2.setFont(new Font("Calibri", Font.PLAIN, 40)); 
	      int stringPosF = (blockF.getXPos() + blockF.getWidth())/2 - 5; 
	      graphic2.drawString(blockF.getLetter(), stringPosF, 500);
	      graphic2.drawString(blockG.getLetter(), stringPosF + 100, 500);
	      graphic2.drawString(blockH.getLetter(), stringPosF + 200, 500);
	      graphic2.drawString(blockJ.getLetter(), stringPosF + 300, 500);
	      
	  }
  };
  
  // title screen buttons
  JButton playButton = new JButton("Play Now!");
  JButton songButton = new JButton("Choose Song");
  JButton difficultyButton = new JButton("Choose Difficulty");
  JButton highScoresButton = new JButton("High Scores");
  JButton instructionsButton = new JButton("How to Play");

  // song screen buttons
  JButton songOne = new JButton("Say it Ain't So - Weezer");
  JButton songTwo = new JButton("Arabella - Arctic Monkeys");
  JButton songThree = new JButton("Paranoid - Black Sabbath");
  JButton songBack = new JButton("Back");

  // difficulty screen buttons
  JButton easy = new JButton("Easy");
  JButton hard = new JButton("Hard");
  JButton difficultyBack = new JButton("Back");

  // high scores screen button
  JButton highScoresBack = new JButton("Back");

  // button size
  Dimension size = new Dimension(300, 50);

  // label to display current score
  JLabel score;

  // custom background colors 
  Color lightBlue = new Color(51,171,240);
  Color maple = new Color(255,241,183);

  // constructor for Screen class 
  public Screen(String title) throws IOException {
    super(title);
    
    //set background color 
    this.getContentPane().setBackground(lightBlue);
    
    // set cardlayout
    mainScreen.setLayout(card);
    
    // add individual screens to the main panel
    mainScreen.add(titleScreen, "Music Rhythm Game");
    mainScreen.add(songScreen, "Choose Your Song");
    mainScreen.add(difficultyScreen, "Choose Your Difficulty");
    mainScreen.add(highScoresScreen, "View High Scores");
    mainScreen.add(gameScreen, "Game"); 

    // call functions to format each screen
    formatTitleScreen();
    formatSongScreen();
    formatDifficultyScreen();
    formatHighScoreScreen();
    formatGameScreen();

    // display the main panel and set frame size 
    card.show(mainScreen, "Music Rhythm Game");
    setSize(700, 700);
    
    // set layout
    setLayout(new FlowLayout(FlowLayout.CENTER));

    // add main screen and finalize the creation of the Screen class 
    add(mainScreen);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
    setVisible(true);

    //add relevant key letters to array
    keyLetters.add("F");
    keyLetters.add("G");
    keyLetters.add("H");
    keyLetters.add("J");
    
    //intialize variables for game logic 
    continueTimer = true;
    numMisses = 0;
    isKeyPressed = false;
    
    // set letters and colors for all block types 
    
    blockF.setColor("Red"); 
    blockF.setLetter("F");
    
    blockG.setColor("Yellow"); 
    blockG.setLetter("G"); 
    
    blockH.setColor("Blue"); 
    blockH.setLetter("H"); 
    
    blockJ.setColor("Green"); 
    blockJ.setLetter("J"); 
    
    movingF.setColor("Red"); 
    movingF.setLetter("F");
    
    movingG.setColor("Yellow"); 
    movingG.setLetter("G");
    
    movingH.setColor("Blue"); 
    movingH.setLetter("H");
    
    movingJ.setColor("Green"); 
    movingJ.setLetter("J");
  }

  //function to create the objects in the title screen
  public void formatTitleScreen() {
	  
	titleScreen.setBackground(lightBlue); 
	  
    // center the buttons
    playButton.setAlignmentX(CENTER_ALIGNMENT);
    songButton.setAlignmentX(CENTER_ALIGNMENT);
    difficultyButton.setAlignmentX(CENTER_ALIGNMENT);
    highScoresButton.setAlignmentX(CENTER_ALIGNMENT);
    instructionsButton.setAlignmentX(CENTER_ALIGNMENT);

    // set the size of the buttons
    playButton.setPreferredSize(size);
    songButton.setPreferredSize(size);
    difficultyButton.setPreferredSize(size);
    highScoresButton.setPreferredSize(size);
    instructionsButton.setPreferredSize(size);

    // add listeners to each button so we know where to go when one is pressed
    playButton.addActionListener(new ButtonListener());
    songButton.addActionListener(new ButtonListener());
    difficultyButton.addActionListener(new ButtonListener());
    highScoresButton.addActionListener(new ButtonListener());
    instructionsButton.addActionListener(new ButtonListener());
    titleScreen.addKeyListener(new KeyboardListener());

    // title
    JLabel title = new JLabel(
        "<HTML><center><span style='font-size:30px'><BR>Music Rhythm Game</span></center><BR></HTML>");
    title.setAlignmentX(CENTER_ALIGNMENT);

    // declare a box that will hold the title and each button
    Box box = Box.createVerticalBox();

    box.add(Box.createVerticalGlue());
    box.add(title);
    box.add(Box.createVerticalStrut(25));
    box.add(playButton);
    box.add(Box.createVerticalStrut(25));
    box.add(songButton);
    box.add(Box.createVerticalStrut(25));
    box.add(difficultyButton);
    box.add(Box.createVerticalStrut(25));
    box.add(highScoresButton);
    box.add(Box.createVerticalStrut(25));
    box.add(instructionsButton);
    box.add(Box.createVerticalStrut(25));
    
    titleScreen.add(box);
  }

  //function to create the objects in the song screen
  public void formatSongScreen() {
	  
	songScreen.setBackground(lightBlue);  
	
	// title 
    JLabel title = (new JLabel(
        "<HTML><center><span style='font-size:30px'><BR>Choose Your Song</span></center><BR></HTML>"));
    title.setAlignmentX(CENTER_ALIGNMENT);
    
    // center the buttons 
    songOne.setAlignmentX(CENTER_ALIGNMENT);
    songTwo.setAlignmentX(CENTER_ALIGNMENT);
    songThree.setAlignmentX(CENTER_ALIGNMENT);
    songBack.setAlignmentX(CENTER_ALIGNMENT);

    // set button size 
    songOne.setPreferredSize(size);
    songTwo.setPreferredSize(size);
    songThree.setPreferredSize(size);
    songBack.setPreferredSize(size);
    
    // add action listeners to each button 
    songOne.addActionListener(new ButtonListener());
    songTwo.addActionListener(new ButtonListener());
    songThree.addActionListener(new ButtonListener());
    songBack.addActionListener(new ButtonListener());
    
    // create a box that will hold all song buttons 
    Box box = Box.createVerticalBox();

    box.add(Box.createVerticalGlue());
    box.add(title);
    box.add(Box.createVerticalStrut(25));
    box.add(songOne);
    box.add(Box.createVerticalStrut(25));
    box.add(songTwo);
    box.add(Box.createVerticalStrut(25));
    box.add(songThree);
    box.add(Box.createVerticalStrut(25));
    box.add(songBack);
    box.add(Box.createVerticalStrut(25));
    songScreen.add(box);
  }

  //function to create the objects in the difficulty screen
  public void formatDifficultyScreen() {
	  
	difficultyScreen.setBackground(lightBlue);  
	
	// title 
    JLabel title = (new JLabel(
        "<HTML><center><span style='font-size:30px'><BR>Choose Your Difficulty</span></center><BR></HTML>"));
    title.setAlignmentX(CENTER_ALIGNMENT);
    
    // center all buttons 
    easy.setAlignmentX(CENTER_ALIGNMENT);
    hard.setAlignmentX(CENTER_ALIGNMENT);
    difficultyBack.setAlignmentX(CENTER_ALIGNMENT);
    
    // set button sizes 
    easy.setPreferredSize(size);
    hard.setPreferredSize(size);
    difficultyBack.setPreferredSize(size);
    
    // add action listeners to all buttons 
    easy.addActionListener(new ButtonListener());
    hard.addActionListener(new ButtonListener());
    difficultyBack.addActionListener(new ButtonListener());
    
    // create a box that will hold all buttons 
    Box box = Box.createVerticalBox();

    box.add(Box.createVerticalGlue());
    box.add(title);
    box.add(Box.createVerticalStrut(25));
    box.add(easy);
    box.add(Box.createVerticalStrut(25));
    box.add(hard);
    box.add(Box.createVerticalStrut(25));
    box.add(difficultyBack);
    box.add(Box.createVerticalStrut(25));
    difficultyScreen.add(box);
  }

  //function to create the objects in the high score screen
  public void formatHighScoreScreen() {
	
	highScoresScreen.setBackground(lightBlue);
	
	// title 
    JLabel title = (new JLabel(
        "<HTML><center><span style='font-size:30px'><BR>High Scores</span></center><BR></HTML>"));
    title.setAlignmentX(CENTER_ALIGNMENT);
    
    // add top three high scores and their respective usernames to the screen 
    
    JLabel scoreOne = (new JLabel(
        "<HTML><span style='font-size:15px'><BR>1.  " + gameLogic.getUsers().get(0).getUserName() + "     "
            + gameLogic.getUsers().get(0).getScore() + "</span><BR></HTML>"));
    scoreOne.setAlignmentX(CENTER_ALIGNMENT);

    JLabel scoreTwo = (new JLabel(
        "<HTML><span style='font-size:15px'><BR>2.  " + gameLogic.getUsers().get(1).getUserName() + "     "
            + gameLogic.getUsers().get(1).getScore() + "</span><BR></HTML>"));
    scoreTwo.setAlignmentX(CENTER_ALIGNMENT);

    JLabel scoreThree = (new JLabel(
        "<HTML><span style='font-size:15px'><BR>3.  " + gameLogic.getUsers().get(2).getUserName() + "     "
            + gameLogic.getUsers().get(2).getScore() + "</span><BR></HTML>"));
    scoreThree.setAlignmentX(CENTER_ALIGNMENT);
    
    // set alignment, size, and listner for button 
    highScoresBack.setAlignmentX(CENTER_ALIGNMENT);
    highScoresBack.setPreferredSize(size);
    highScoresBack.addActionListener(new ButtonListener());

    // create a box that will hold all objects in the high score screen 
    Box box = Box.createVerticalBox();

    box.add(Box.createVerticalGlue());
    box.add(title);
    box.add(Box.createVerticalStrut(25));
    box.add(scoreOne);
    box.add(Box.createVerticalStrut(25));
    box.add(scoreTwo);
    box.add(Box.createVerticalStrut(25));
    box.add(scoreThree);
    box.add(Box.createVerticalStrut(50));
    box.add(highScoresBack);
    box.add(Box.createVerticalStrut(25));
    highScoresScreen.add(box);
  }

  //function to create the objects in the game screen
  public void formatGameScreen() {
	  
	gameScreen.setBackground(maple);
	
	// current score 
    score = (new JLabel(
        "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>"));
    score.setAlignmentX(CENTER_ALIGNMENT);
    
    // paint all graphics on the screen 
    gameScreen.paintComponents(getGraphics());
    
    // create a box which will place the score on the bottom of the screen 
    Box box = Box.createVerticalBox();
    box.add(Box.createVerticalGlue());
    box.add(Box.createVerticalStrut(540));
    box.add(score);
    gameScreen.add(box); 
  }

  // actionlistener class that determines what to do when a button is pressed
  private class ButtonListener implements ActionListener {

    // overrided method that controls the button logic 
    @Override
    public void actionPerformed(ActionEvent e) {
      JButton source = (JButton) (e.getSource());
      // play button logic 
      if (source.equals(playButton)) { 
        currentCard = "Game";
        correct = false; 
        timesPlayed = timesPlayed + 1; 
        card.show(mainScreen, currentCard); 
        getContentPane().setBackground(maple);
        score.setText(
      	"<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>"); 
        
        // add a key listener to the game screen which will allow the program to respond to key presses
        if(timesPlayed == 1) {
        	gameScreen.addKeyListener(new KeyboardListener());
        }
        gameScreen.setFocusable(true);
        gameScreen.requestFocusInWindow();
        // try-catch statements to catch all possible exceptions 
        try {
          gameLogic.setGameStatus(true);
        } catch (LineUnavailableException e1) {
          e1.printStackTrace();
        } catch (UnsupportedAudioFileException e1) {
          e1.printStackTrace();
        } catch (IOException e1) {
          e1.printStackTrace();
        }
        // create a new timer with delay depending on difficulty 
        if (gameLogic.getDifficulty() == "easy") {
          gameTimer = new Timer(120, new AudioListener());
          timerStartTime = System.currentTimeMillis();
        } else {
          gameTimer = new Timer(100, new AudioListener());
          timerStartTime = System.currentTimeMillis();
        }
        gameTimer.start();
        continueTimer = true;
        // song button logic 
      } else if (source.equals(songButton)) {
        currentCard = "Choose Your Song";
        card.show(mainScreen, currentCard);
        getContentPane().setBackground(lightBlue);
        // difficulty button logic 
      } else if (source.equals(difficultyButton)) {
        currentCard = "Choose Your Difficulty";
        card.show(mainScreen, currentCard);
        getContentPane().setBackground(lightBlue);
        // high score button logic 
      } else if (source.equals(highScoresButton)) {
        currentCard = "View High Scores";
        highScoresScreen.removeAll();
        formatHighScoreScreen();
        card.show(mainScreen, currentCard);
        getContentPane().setBackground(lightBlue);
        // instruction logic 
      } else if (source.equals(instructionsButton)) {
        JOptionPane.showMessageDialog(null, "Controls:  F, G, H, and J keys\r\n"
            + "\r\n"
            + "Blocks will begin falling down the screen to the rhythm of a song.\r\nEach block is color coded and contains a letter corresponding to a key on the keyboard.\r\nWhen a block reaches its destination at the bottom, press the right key!\r\n"
            + "",
            "Game Instructions", JOptionPane.PLAIN_MESSAGE);
        // determine which song was chosen 
      } else if (source.equals(songOne)) {
        gameLogic.setSong("sayItAintSo");
      } else if (source.equals(songTwo)) {
        gameLogic.setSong("arabella");
      } else if (source.equals(songThree)) {
          gameLogic.setSong("paranoid");
        // determine difficulty 
      } else if (source.equals(easy)) {
        gameLogic.setDifficulty("easy");
      } else if (source.equals(hard)) {
        gameLogic.setDifficulty("hard");
        // back button logic 
      } else if (source.equals(songBack) | source.equals(difficultyBack) | source.equals(highScoresBack)) {
        currentCard = "Music Rhythm Game";
        card.show(mainScreen, currentCard);
      }
    }
  }

  // keylistener class that determines what to do when keys are pressed 
  private class KeyboardListener implements KeyListener {

    @Override
    public void keyTyped(KeyEvent e) {
    }

    //function that determines which key was pressed and how to respond to it
    @Override
    public void keyPressed(KeyEvent e) {
      isKeyPressed = true;
      //esc key - create a popup window that asks if the user wants to exit
      if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
    	escPressed = true;
        if (currentCard == "Game" & continueTimer == true) { 
          isKeyPressed = false;
          gameLogic.pauseGame();
          continueTimer = false;
          int exit = JOptionPane.showConfirmDialog(null,
              "Would you like to exit?\n If you exit now, your score will be unsaved.", "Exit",
              JOptionPane.YES_NO_OPTION);
          if (exit == JOptionPane.YES_OPTION) {
        	escPressed = true;
        	gameLogic.clearScore();
        	gameTimer.stop(); 
        	gameTimer = null;
            numMisses = 0;
            movingBlocks.clear();  
            currentCard = "Music Rhythm Game";
            card.show(mainScreen, currentCard);
            getContentPane().setBackground(lightBlue);
            gameLogic.exitGame();
            escPressed = false; 
            titleScreen.setFocusable(true);
            titleScreen.requestFocusInWindow();
          } 
          else {
            gameLogic.unpauseGame();
            continueTimer = true;
          }
        } 
        else if (currentCard == "Music Rhythm Game" & escPressed == true) {
          int exit = JOptionPane.showConfirmDialog(null, "Would you like to close the program?", "Exit",
              JOptionPane.YES_NO_OPTION);
          if (exit == JOptionPane.YES_OPTION) {
            System.exit(0);
          } else {
            // do nothing
          }
        }
        
        // F key was pressed - increase or decrease score? 
      } else if (e.getKeyCode() == KeyEvent.VK_F) {
        if (currentCard == "Game") {
          // check if it is the right key and if the timing is correct
          keyPressTime = time.getTime();
          pressedKey = "F";
          if ((pressedKey == neededKey) & (reachedEnd = true)) {
            gameLogic.increaseScore();
            correct = true; 
          } 
          else {
            gameLogic.decreaseScore();
            numMisses = numMisses + 1;
          }
          score.setText(
              "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>");
        }
      }
      
      // G key was pressed - increase or decrease score? 
      else if (e.getKeyCode() == KeyEvent.VK_G) {
        if (currentCard == "Game") {
          // check if it is the right key and if the timing is correct
          keyPressTime = time.getTime();
          pressedKey = "G";
          if ((pressedKey == neededKey) & (reachedEnd = true)) {
            gameLogic.increaseScore();
            correct = true;
          } 
          else {
            gameLogic.decreaseScore();
            numMisses = numMisses + 1;
          }
          score.setText(
              "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>");
        }
        
     // H key was pressed - increase or decrease score? 
      } else if (e.getKeyCode() == KeyEvent.VK_H) {
        if (currentCard == "Game") {
          // check if it is the right key and if the timing is correct
          keyPressTime = time.getTime();
          pressedKey = "H";
          if ((pressedKey == neededKey) & (reachedEnd = true)) {
            gameLogic.increaseScore(); 
            correct = true;
          } 
          else {
            gameLogic.decreaseScore();
            numMisses = numMisses + 1;
          }
          score.setText(
              "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>");
        }
        
        // J key was pressed - increase or decrease score? 
      } else if (e.getKeyCode() == KeyEvent.VK_J) {
        if (currentCard == "Game") {
          // check if it is the right key and if the timing is correct
          keyPressTime = time.getTime();
          pressedKey = "J";
          if ((pressedKey == neededKey) & (reachedEnd = true)) {
            gameLogic.increaseScore();
            correct = true;    
          } 
          else {
            gameLogic.decreaseScore();
            numMisses = numMisses + 1;
          }
          score.setText(
              "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>");
        }
      } else {
        if (currentCard == "Game") {
          // check if it is the right key and if the timing is correct
          gameLogic.decreaseScore();
          score.setText(
              "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>");
          numMisses = numMisses + 1;
        }
      }
    }

    //function that determines if the user has released the key
    @Override
    public void keyReleased(KeyEvent e) {
      isKeyPressed = false;
    }
  }

  //action listener that is used by the game's timer
  private class AudioListener implements ActionListener {

	// overrided method that determines what to do at each timer tick 
    @Override
    public void actionPerformed(ActionEvent e) {
      reachedEnd = false;
      time = new Date(System.currentTimeMillis()); 
      timerCt = timerCt + 1; 
      
      //if the user has too many misses, exit the game and consider it a fail
      if (numMisses >= 50 & continueTimer == true) {
        continueTimer = false;
        gameLogic.setEndStatus(false);
        gameLogic.pauseGame();
        gameLogic.handleEndScore(gameLogic.getCurrentScore());
        gameLogic.clearScore();
        gameTimer.stop();
        gameTimer = null;
        numMisses = 0;
        movingBlocks.clear();  
        currentCard = "Music Rhythm Game";
        card.show(mainScreen, currentCard);
        getContentPane().setBackground(lightBlue);
        gameLogic.exitGame();
      } 
      
      //if the song has ended, exit the game and consider it a success
      else if (((time.getTime() - timerStartTime) >= gameLogic.getSongDuration()) & continueTimer == true) {
        continueTimer = false;
        gameLogic.setEndStatus(true);
        gameLogic.pauseGame();
        gameLogic.handleEndScore(gameLogic.getCurrentScore());
        gameLogic.clearScore();
        gameTimer.stop();
        gameTimer = null;
        numMisses = 0;
        currentCard = "Music Rhythm Game";
        movingBlocks.clear(); 
        card.show(mainScreen, currentCard);
        getContentPane().setBackground(lightBlue);
        gameLogic.exitGame();
      } 
      
      //if the timer is still going, generate another random block and continue the game
      else if (continueTimer == true) { 
    	if(gameLogic.getDifficulty() == "easy") {
    		if(timerCt%12 == 0) {
        		//generate a random integer from 0 to 3 and assign it to a letter in the keyLetters arraylist
                randomInt = randomizer.nextInt(4);
                randomLetter = keyLetters.get(randomInt);
                //add block with randomly generated letter to block array 
                addBlock(randomLetter);
        	} 
    	}
    	else if(gameLogic.getDifficulty() == "hard") {
    		if(timerCt%6 == 0) {
        		//generate a random integer from 0 to 3 and assign it to a letter in the keyLetters arraylist
                randomInt = randomizer.nextInt(4);
                randomLetter = keyLetters.get(randomInt);
              //add block with randomly generated letter to block array
                addBlock(randomLetter);
        	} 
    	}
        blockTime = time.getTime();
        
        //check if there are any blocks that are currently approaching their destinations (the keylistener class will handle the rest) 
        for(int i = 0; i < movingBlocks.size(); i++) {
        	if(movingBlocks.get(i).getYPos() >= 410 & movingBlocks.get(i).getYPos() < 470) {
        		reachedEnd = true; 
        		toRemove = i; 
        		correctBlock = i;
        		neededKey = movingBlocks.get(i).getLetter(); 
        	}
        	//decrease score if user failed to press a key
        	if(movingBlocks.get(i).getYPos() == 470) {
        		if(isKeyPressed == false & correct == false) {
        			gameLogic.decreaseScore();
        			score.setText(
          	        "<HTML><span style='font-size:15px'><BR>Score: " + gameLogic.getCurrentScore() + "</span><BR></HTML>");
        			numMisses = numMisses + 1;
        		}
        	}
        	//if block has passed the destination point, remove block from arraylist
        	if(movingBlocks.get(i).getYPos() >= 490) {
        		reachedEnd = false;
        		movingBlocks.remove(movingBlocks.get(i)); 
        		correct = false; 
        	}
        }
        //repaint graphics on screen and move all blocks downward
        gameScreen.repaint();
        for(Block block : movingBlocks) {
        	block.setYPos(block.getYPos()+20); 
        }
      }
    }
    
    //function to add a block to the arraylist of moving blocks (this accepts a randomly generated key letter) 
    public void addBlock(String letter) {
    	if(letter == "F") {
    		Block newBlock = new Block(movingF.getWidth(), movingF.getHeight(), movingF.getXPos(), movingF.getYPos()); 
    		newBlock.setLetter("F");
    		newBlock.setColor("Red");
    		movingBlocks.add(newBlock); 
    	}
    	else if(letter == "G") {
    		Block newBlock = new Block(movingG.getWidth(), movingG.getHeight(), movingG.getXPos(), movingG.getYPos()); 
    		newBlock.setLetter("G");
    		newBlock.setColor("Yellow");
    		movingBlocks.add(newBlock); 
    	}
    	else if(letter == "H") {
    		Block newBlock = new Block(movingH.getWidth(), movingH.getHeight(), movingH.getXPos(), movingH.getYPos()); 
    		newBlock.setLetter("H");
    		newBlock.setColor("Blue");
    		movingBlocks.add(newBlock); 
    	}
    	else if(letter == "J") {
    		Block newBlock = new Block(movingJ.getWidth(), movingJ.getHeight(), movingJ.getXPos(), movingJ.getYPos()); 
    		newBlock.setLetter("J");
    		newBlock.setColor("Green");
    		movingBlocks.add(newBlock); 
    	}
    }

  }
}
