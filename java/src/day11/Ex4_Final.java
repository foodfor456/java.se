package day11;

public class Ex4_Final {

	public static void main(String[] args) {
		System.out.println(Math.PI);
	}

}
class Tv{
	private final static int MIN_CHANNEL = 1;
	private int channel;
	private void print() {
		System.out.println("최소 채널 : " + MIN_CHANNEL);
		System.out.println("현재 채널 : " + channel);
	}
	public Tv(int channel) {
		this.channel = channel;
		
		//minChannel = 2;
		//에러발생, final이 붙은 변수를 수정하려고 했기 때문에
	}
	//변수는 글자가 기울어짐, 파이널 static 변수는 "굵은 글씨"가 되면서 기울어짐
	int a;
	static int b;
	final static int C = 1;
}