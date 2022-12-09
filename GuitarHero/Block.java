package RhythmGame.Hardware;

//class which holds all size and coordinate information for the blocks in the game 
public class Block {
	private String color; 
	private String letter;  
	private int xPos;
	private int yPos; 
	private int height; 
	private int width; 
	
	//blocks have a width and height in addition to x and y coordinates for position on screen
	public Block(int width, int height, int xPos, int yPos) {
		this.width = width; 
		this.height=height; 
		this.xPos = xPos; 
		this.yPos = yPos; 
	}
	
	//setters and getters for block info (coordinates, sizes, colors, letters, etc.) 
	
	public void setXPos(int pos) {
		xPos = pos; 
	}
	
	public int getXPos() {
		return xPos; 
	}
	
	public void setYPos(int pos) {
		yPos = pos; 
	}
	
	public int getYPos() {
		return yPos; 
	}
	
	public int getWidth() {
		return width; 
	}
	
	public int getHeight() {
		return height; 
	}
	
	public void setColor(String c) {
		color = c;
	}
	
	public void setLetter(String l) {
		letter = l;
	}
	
	public String getColor() {
		return color; 
	}
	
	public String getLetter() {
		return letter; 
	}
	
}
