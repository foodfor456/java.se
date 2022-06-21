package day12;

public class Car {
	private Tire tire [];

	public Car(Tire[] tire) {
		this.tire = tire;
	}
	public void print() {
		if(tire == null) {
			return;
		}
		for(Tire tmp : tire) {
			if(tmp instanceof HankookTire) {
				System.out.print(HankookTire.COMPANY + " : ");
			}else if(tmp instanceof KumhoTire) {
				System.out.print(KumhoTire.COMPANY + " : ");
			}
			System.out.println(tmp.getPosition() + ", 압력 : " + tmp.getPressure() + ", 상태 : " + tmp.getState());
		}
	}
	//매개변수의 다형성
	public void repare(int index, Tire tire) {
		if(this.tire == null || this.tire.length <= index) {
			return;
		}
		this.tire[index] = tire;
	}
	/*HankookTire backLeft,backRight;
	KumhoTire fronLeft, fronRight; 타이어를 바꿀때 위치를 바꾸는건 안됨, 생성된 객체는 변수만 바꿀수 있다.
	*/
	
}
