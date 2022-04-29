package day4;

public class Ex4_Break1 {

	public static void main(String[] args) {
		/* break코드를 만나면 바로 종료되기 때문에, i++<= 증감식이 의미가 없음.
		 * =>if코드가 없을때.
		 * */
		for (int i = 1 ; i <= 5 ; i++ ) {
			System.out.println("hello");
			if(i==3) {

			break;	
			}
			
			
		}
		
		
	}

}
