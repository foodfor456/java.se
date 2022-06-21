package day21;

public class Ex01_Lambda1 {

	public static void main(String[] args) {
		//람라식을 안쓰고 스레드 테스트
		Thread th1 = new Thread(new Runnable() {
			@Override
			public void run() {
				System.out.println("안녕");
			}
		});
		th1.start();
		
		//람다식을 이용하여 스레드 테스트
		Thread th2 = new Thread(() -> System.out.println("하이"));
		th2.start();
		
		Thread th3 = new Thread(()->{
			System.out.println("Hi");
		});
		th3.start();
	}

}