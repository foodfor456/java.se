package day3;

import java.util.Scanner;

public class Ex4_if1 {

	public static void main(String[] args) {
		/* 두 정수와 산술 연산자를 입력받아 산술 연산 결과를 출력하는 코드를 작성하세요.
		 * 
		 * */
		Scanner scan = new Scanner(System.in);
		
		System.out.println("첫번 째 정수를 입력하세요.");
		int num1 = scan.nextInt();
		System.out.println("두번 째 정수를 입력하세요.");
		int num2 = scan.nextInt();
		System.out.println("산술 연산자를 입력하세요.");
		char ch = scan.next().charAt(0);
		
		int ba = num1 + num2; 
		int ba2 = num1 - num2;
		int ba3 = num1 * num2;
		double ba4 = 1.0 * num1 / num2;
		int ba5 = num1 % num2;
				
		if (ch == '+') {
			System.out.println("결과는 " + num1 + ch + num2 + "=" + ba + "입니다.");
		}else if(ch == '-') {
			System.out.println("결과는 " + num1 + ch + num2 + "=" + ba2 + "입니다.");
		}else if(ch == '*') {
			System.out.println("결과는 " + num1 + ch + num2 + "=" + ba3 + "입니다.");
		}else if(ch == '/') {
			System.out.println("결과는 " + num1 + ch + num2 + "=" + ba4 + "입니다.");
		}else if(ch == '%') {
			System.out.println("결과는 " + num1 + ch + num2 + "=" + ba5 + "입니다.");
		}else {
			System.out.println("잘못된 값입니다.");
		}
		
		
		scan.close();
		
	}

}
