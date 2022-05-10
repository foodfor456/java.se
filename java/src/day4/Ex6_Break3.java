package day4;

import java.util.Scanner;

public class Ex6_Break3 {

	public static void main(String[] args) {
		/* 두 정수의 최소 공배수를 구하는 예제를 작성하세요.
		 * 공배수 : 두 정수에 공통으로 있는 배수
		 * 최소 공배수 : 두 정수의 공배수중 최소값.
		 * 10의 배수 : 10 , 20 , 30 , 50 , 60 ...
		 * 15의 배수 : 15 , 30 , 45 , 60 ,75 ,90 ...
		 * 10 과 15의 공배수 : 30 60 90 ...
		 * */
		Scanner scan = new Scanner(System.in);
		
		
		System.out.println("정수를 입력하세요 : ");
		int i1 = scan.nextInt();
		System.out.println("정수를 입력하세요 : ");
		int i2 = scan.nextInt();
		int i = i1;
		for( ; i1 <= i1*i2 ; i += i1) {
			if(i % i1 ==0 && i % i2 == 0) {
			System.out.println("최소 공배수는 : " + i);
			break;
			}	
		}
		scan.close();
				
		/*int num3 = 10;
		int num4 = 15;
		int i3 ;
		*/
		/*System.out.println("정수를 입력하세요 : ");
		int i1 = scan.nextInt();
		System.out.println("정수를 입력하세요 : ");
		int i2 = scan.nextInt();
		*/
		/*for(i3 = 1 ; i3 <= num3 * num4 ; i3+=num3) {
		if(num3 % i3  == 0 && num4 % i3 == 0) {
		System.out.println("최소 공배수는 : " + i3);
			
			break;
		
		
		
		}	
	}
*/
	}
}

