package day22.copy;

public class Test_Manager {
	private int smes, classNum; 
	private int subScore;
	private String subject;
	
	public int getSmes() {
		return smes;
	}
	public void setSmes(int smes) {
		this.smes = smes;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getSubScore() {
		return subScore;
	}
	public void setSubScore(int subScore) {
		this.subScore = subScore;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public Test_Manager(int smes, int classNum, int subScore, String subject) {
		super();
		this.smes = smes;
		this.classNum = classNum;
		this.subScore = subScore;
		this.subject = subject;
	}
	
	public Test_Manager() {}
	public void modify(String subject, int subScore) {
		this.subject = subject;
		this.subScore = subScore;
		
		
	}
}