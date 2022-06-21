package day23;

public class User {
	private int count;
	private String user;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public User(int count, String user) {
		this.count = count;
		this.user = user;
	}
	public User(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "count : " + count + ", 이름 : " + user;
	}
	
	
	
}
