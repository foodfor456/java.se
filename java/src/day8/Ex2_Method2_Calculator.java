package day8;

public class Ex2_Method2_Calculator {

	public static void main(String[] args) {
		int num1 = 1 , num2 = 2;
		char op = '*';
		double res = calculator(num1,op,num2);
		System.out.println(""+num1 + op + num2 + "="+ res);
	}
	/* 기능 : 두 정수와 산술연산자가 주어지면 산술연산결과를 알려주는 메소드
	 * 매개변수 : int num1 , int num2 , char ch
	 * 리턴타입 : num1 연산자 num2 = 연산 결과
	 * 메소드명 : calculator
	 * */
	public static double calculator(int num1 , char op , int num2) {
		double res = 0;
		switch(op) {
		case '+' : 
			res = num1 + num2;
			break;
		case '-' : 
			res = num1 - num2;
			break;
		case '*' : 
			res = num1 * num2;
			break;
		case '/' : 
			res = num1 / (double)num2;
			break;
		case '%' : 
			res = num1 % num2;
			break;
		}
		return res;
	}
	
}
