package day3;

public class Ex12_For3 {

	public static void main(String[] args) {
		/* 1부터 10사이의 짝수를 출력하는 코드를 작성하세요.
		 * 2
		 * 4
		 * 6
		 * 8
		 * 10
		 * */
		
		int i;
		for( i = 1 ; i <= 5 ; ++i ) {
			System.out.println(i*2);
		}
		
		
		for(i = 1 ; i <= 10 ; ++i) {
		if(i % 2 == 0) {
			System.out.println(i);
		}
		}
		
		for(i = 2 ; i <= 10; i += 2) {
			System.out.println(i);
		}
		
		
	}

}
