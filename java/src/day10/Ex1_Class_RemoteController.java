package day10;

public class Ex1_Class_RemoteController {

	public static void main(String[] args) {
		/* */
		RemoteController rmt = new RemoteController("삼성",true,true,true,50);
		rmt.print();
		
		
	}
	
	

}



/* TV 리모컨 클래스를 생성하고, 객체를 생성 후 기능들을 테스트해보세요. */
//필드 : 제품 브랜드, 채널 위아래, 음량, 전원, 채널 숫자 버튼 

class RemoteController{
	String brand;
	boolean ch;
	boolean vul;
	boolean po;
	int chNum;
	public RemoteController(String brand, boolean ch, boolean vul, boolean po, int chNum) {
		super();
		this.brand = brand;
		this.ch = ch;
		this.vul = vul;
		this.po = po;
		this.chNum = chNum;
	}
	public void print() {
		System.out.println(" 브랜드 : " + brand);
		if(ch==true) {
			System.out.println(" 채널 : " + "Up");
		}else {
			System.out.println(" 채널 : " + "Down");
		}
		if(vul==true) {
			System.out.println(" 볼륨 : " + "Up");
		}else {
			System.out.println(" 볼륨	 : " + "Down");
		}
		if(po==true) {
				System.out.println(" 파워 : " + "On");
		}else {
				System.out.println(" 파워 : " + "Off");
		}
		System.out.println(" 채널번호: " + chNum);
		}
	
	
}