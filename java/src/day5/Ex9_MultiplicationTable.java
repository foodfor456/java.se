package day5;

public class Ex9_MultiplicationTable {

	public static void main(String[] args) {
		/* 구구단 7단을 출력하는 코드를 작성하세요.
		 * 7 X 1 = 7
		 * 7 X 2 = 14
		 * 7 X 3 = 21
		 * ....
		 * 7 X 9 = 63
		 * 
		 * 반복 횟수 : i는 1 부터 9까지 1씩 증가
		 * 규칙성 : 7 x i = (7 x i)를 출력
		 * 반복문 종료 후 : 없음
		 * */
		/*int i = 7;
		for(int num = 1; num<=9 ;num++) {
			System.out.println(i*num);
		}
		*/
		/*int num = 7;
		for(int i = 1; i <= 9; i++) {
			System.out.println(num + " X " + i + " = " + num * i);
		}
		*/
		/* 구구단 2단 ~9단 까지 출력하는 예제를 작성하세요.
		 * */
		for (int i =2; i <=9; i++) {
			for(int j = 1; j <= 9; j++) {
				System.out.println(i + " X " + j + "=" + i * j);
			}
			
		}
		for(int num = 2; num <=9; num++) {
			//num단 출력하는 예제;
			for(int j = 1; j <= 9; j++) {
				System.out.println(num + " X " + num + "=" + num * j);
			}
		}
	}
}
