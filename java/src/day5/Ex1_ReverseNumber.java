package day5;

import java.util.Scanner;

public class Ex1_ReverseNumber {

	public static void main(String[] args) {
		/* 정수를 입력받아 입력받은 정수를 역으로 출력하는 코드를 작성하세요.
		 * 1230 => 0321
		 * 반복횟수 : 정해지지 않음*/ 
		/* 양의 정수를 입력받아 입력받은 정수를 역으로 출력하는 코드를 작성하세요.
		 * 1230 => 0을 출력, 1230 => 123
		 * 123 => 3을 출력, 123 => 12
		 * 12 => 2를 출력, 12 => 1
		 * 1 => 1을 출력, 1 => 0
		 * 
		 * 945 => 5를 출력, 945 => 94
		 * 94 => 4를 출력, 94 => 9
		 * 9 => 9를 출력, 9=>0
		 * 
		 * 반복횟수 : num가 0이 아닐때까지
		 * 규칙성 : num의 일의 자리를 출력 한 후 num를 10으로 나눈 목을 num에 저장 
		 * */
		//1230
		Scanner scan = new Scanner(System.in);
		System.out.print("정수를 입력해주세요. : ");
		int num = scan.nextInt();
		
		
		while(num != 0) {
			//num - num/10 * 10;
			
			System.out.print(num%10);
			num = num / 10;
			
		}
		
		
		
		scan.close();
		
		
		
		
		/* for(double b = 0; a != 0 ; a /= 10) {
			
			if(a<=9) {
				System.out.println(a);
			}else if ( a <= 99) {
				System.out.println(a);
			}else if ( a <= 999) {
				System.out.println(a);
			}else if ( a <= 9999) {
				System.out.println(a);
			}
				b += 'a';
			}
		*/
			
			
			
		}
		
	}


