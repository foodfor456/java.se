package day12;

public class Tire {
	private int state; // 타이어의 마모도 (100 : 좋음, 0 : 교체)
	private int pressure; // 타이어 압
	private String position; // 타이어 위치
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getPressure() {
		return pressure;
	}
	public void setPressure(int pressure) {
		this.pressure = pressure;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	//중고 타이어가 있을수 있기 때문에
	public Tire(int state, int pressure, String position) {
		this.state = state;
		this.pressure = pressure;
		this.position = position;
	}
	//새 타이어 일때
	public Tire() {
		this(100, 0, null);
	}
}
