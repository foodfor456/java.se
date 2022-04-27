package day3;

import java.util.Scanner;

public class Ex3_Scanner3 {

	public static void main(String[] args) {

		/* 두 정수와 산술 연산자를 입력받아 출력하는 코드를 작성하세요.
		 * 산술연산자는 문자로 받아주세요.
		 * 
		 * 방법1.
		 * 정수 1을 입력하세요 : 1
		 * 정수 2를 입력하세요 : 2
		 * 산술 연산자를 입력하세요 : +
		 * 1+2
		 * 
		 * 방법2.
		 * 두 정수와 산술연산자를 입력하세요. (예: 1 + 2) : 1 + 2
		 * 1+2
		 * 
		 * */
		/*Scanner scan = new Scanner(System.in);
		
		System.out.print("첫번 째 정수를 입력하세요. :");
		int num1 = scan.nextInt();
		System.out.print("두번 째 정수를 입력하세요. :");
		int num2 = scan.nextInt();
		System.out.print("연산자를 입력하세요. :");
		char ch = scan.next().charAt(0);
		String num3 = scan.next();
		
		System.out.println((num1) + "" + (ch) + (num2));
		*/
		Scanner scan = new Scanner(System.in);
		//방법1
		System.out.println("정수 1을 입력하세요 : ");
		int num1 = scan.nextInt();
		System.out.println("정수 2을 입력하세요 : ");
		int num2 = scan.nextInt();
		System.out.println("산술 연산자를 입력하세요 : ");
		char ch = scan.next().charAt(0);
		//정수 + 정수 => 정수
		//+는 유니코드표에서 십진수 43에 해당함.
		//char는 기본적으로 정수에 속함.
		//문자열 + 정수 => 문자열 = 앞에 빈 문자열을 넣고, 정수를 문자열로 변환 후 진행
		System.out.println("" + num1 + ch + num2);

		
		//한번에 입력하기 때문에, 순서가 중요하다. (입력버퍼는 순서대로 적용됨)
		System.out.println("정수와 산술연산자를 입력하세요(예: 1 + 2) : ");
		int num3 = scan.nextInt();
		char ch1 = scan.next().charAt(0);
		int num4 = scan.nextInt();
		System.out.println("" + num3 + ch1 + num4);

		
		
		scan.close();
		
		
		
		

	}

}
