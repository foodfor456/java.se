package day4;

public class Ex3_For3_Alphabet {

	public static void main(String[] args) {
		/* 반복문을 이용하여 a부터 z까지 출력하는 코드를 작성하세요.
		 * 
		 * 반복횟수 : 26번
		 * 			i는 0부터 26보다 작을때까지 1씩 증가
		 * 실행문 : 	(char)('a'+i)를 출력
		 * 반복문 종료 후 : 없음*/
		
		int i;
		for( i = 0 ; i < 26 ; i++ ) {
			System.out.println((char)('A'+i));
			
			
		}
		
		/* 반복횟수 : 26번
		 * 			i는 'a'부터 'z'까지 1씩 증가
		 * 실행문 :	i를 출력
		 * 반복문 종료 후 : 없음
		 * */
		char j;
		//j 는 'a'부터 'z'까지 1씩 증가
		for(j = 'a' ; j <= 'z' ; j++) {
			//j를 출력
			System.out.println(j);
			
		}
		int num1 = 1;
		char ch1 ='a' + 1;//리터럴 상수 1은 char타입이어서 타입변환이 발생하지 않음.
		char ch2 = (char)('a' + num1); //num1의 1은 int타입이어서 타입변환이 발생하고, 자동타입변환이 되지 않은 상황이어서 에러가 발생.
		//그러므로 강제 타입변환을 해야한다.
		
	}

}
