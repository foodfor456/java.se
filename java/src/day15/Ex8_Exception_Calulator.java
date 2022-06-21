package day15;

public class Ex8_Exception_Calulator {

	public static void main(String[] args) {
		/* 두 정수와 산술 연산자가 주어졌을 때 산술 연산결과를 출력하는 코드를 작성하세요.
		 * 단 예외처리는 필수.
		 * */
		int num1 = 1, num2 = 2;
		char ch = '+';
		try {
			switch(ch) {
			case '+': System.out.println(num1 + num2); break;
			case '-': System.out.println(num1 - num2); break;
			case '*': System.out.println(num1 * num2); break;
			case '/': 
				int res = num1 / num2; //0으로 나눌 때 예외를 발생시키기 위해 필요한 코드
				System.out.println(num1 / (double)num2); break;
			case '%': System.out.println(num1 % num2); break;
			}
		}catch(ArithmeticException e){
			System.out.println("0으로 나눌 수 없습니다.");
			
		}catch(Exception e) {
			System.out.println("예외가 발생하였습니다.");
		}
		finally {
			}
		
		
	}

}
