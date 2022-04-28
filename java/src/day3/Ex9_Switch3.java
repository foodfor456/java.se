package day3;

import java.util.Scanner;

public class Ex9_Switch3 {

	public static void main(String[] args) {
		/* 두 정수와 산술 연산자를 입력받아 산술 연산 결과를 출력하는 코드를 switch문으로 작성하세요.
		 * 산술 연산자가 아닌 경우 ??은 산술연산자가 아닙니다로 출력.
		 * */
		
		Scanner scan = new Scanner(System.in);
			System.out.println("첫 번째 정수를 입력해 주세요.");
		int num1 = scan.nextInt();
			System.out.println("두 번째 정수를 입력해 주세요.");
		int num2 = scan.nextInt();
			System.out.println("산술 연산자를 입력해 주세요.");
		char ch = scan.next().charAt(0);
		switch(ch) {
		case '+':
			System.out.println("" + num1 + ch + num2 + "의 값은" + (num1 + num2)+"입니다.");
		break;
		case '-':
			System.out.println("" + num1 + ch + num2 + "의 값은" + (num1 - num2)+"입니다.");
		break;
		case '*':
			System.out.println("" + num1 + ch + num2 + "의 값은" + (num1 * num2)+"입니다.");
		break;
		case '/':
			System.out.println("" + num1 + ch + num2 + "의 값은" + (double)num1 / num2+"입니다.");
		break;
		case '%':
			System.out.println("" + num1 + ch + num2 + "의 값은" + (num1 % num2)+"입니다.");
		default:
			System.out.println(ch + "은 잘못된 연산자 입니다.");
			
		}
		scan.close();
		
		
		
		
		
		
	}

}
