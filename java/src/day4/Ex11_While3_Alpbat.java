package day4;

public class Ex11_While3_Alpbat {

	public static void main(String[] args) {
		/* a에서 z까지 출력하는 코드를 while문으로 작성하세요.
		 * 반복횟수 : 
		 * 규칙성 : 
		 * 반복문 종료 :
		 * */
		
		char i = 'a';
		
		while(i++ <= 'z') {
			System.out.println(i);
			
		}
		
		System.out.println();
		i='a';
		while(i <= 'z') {
			System.out.println(i++);
			
		}
		
		
	}

}
