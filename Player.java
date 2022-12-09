package RhythmGame.People;

//class to hold player information 
public class Player {
	
	//variables for username and stats 
	private String userName; 
	private int rank; 
	private int finalScore; 
	
	// default initialization for player, no name or score
	public Player(){
		userName = "Empty"; 
		rank = 0; 
		finalScore = 00000;
	}
	
	//setters and getters for user info 
	
	public void setUser(String name, Integer rank) {
		 userName = name;
		 this.rank = rank; 
	}
	
	public String getUserName() {
		return userName; 
	}
	
	public Integer getRank() {
		return rank; 
	}
	
	public void setScore(int score) {
		finalScore = score; 
	}
	
	public Integer getScore() {
		return finalScore; 
	}
	
	
}
