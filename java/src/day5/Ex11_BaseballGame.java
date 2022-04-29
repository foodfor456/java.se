package day5;

import java.util.Scanner;

public class Ex11_BaseballGame {

	public static void main(String[] args) {
		/* 숫자 야구 게임을 작성하세요.
		 * 중복 되지 않은 1~9사이의 세 정수를 입력받아 맞추는 게임
		 * 입력 : 1 2 3 
		 * 1B
		 * 입력 : 4 5 6 
		 * O
		 * 입력 : 7 8 9
		 * 2S
		 * 입력 : 8 3 9
		 * 1S2B
		 * 입력 : 3 8 9
		 * 3S
		 * 프로그램 종료
		 * 
		 * 반복 횟수 : s가 3보다 작을 때까지 반복
		 * 규칙성 : 정수 3개를 입력받음
		 * 		  com1과 user1이 같으면 s를 1증가
		 * 		  com2와 user2가 같으면 s를 1증가
		 * 		  com3과 user3이 같으면 s를 1증가
		 * 		  com1과 user2가 같거나 com1과 user3이 같으면 b를 1증가
		 * 		  com2와 user1이 같거나 com2와 user3이 같으면 b를 1증가
		 * 		  com3과 user1이 같거나 com3과 user1이 같으면 b를 1증가
		 * 		  s가 0이 아니면 s와 갯수와 S를 출력
		 * 		  b가 0이 아니면 v의 갯수와 B를 출력
		 *  	  s가 0고 b가 0이면 O를 출력
		 * 		  엔터
		 * */
		Scanner scan = new Scanner(System.in);
		
		int com1 = 3 , com2 = 8 , com3 = 9;
		int user1, user2  , user3;
		int s=0, b=0;
		System.out.println("1~9사이의 정수를 중복되지 않게 입력하세요(예 : 1 2 3) : ");
		user1 = scan.nextInt();
		user2 = scan.nextInt();
		user3 = scan.nextInt();
		
		
		for(s=0; s+b==3; s++) {
			if(com1==user1 || com2==user2 || com3==user3) {
			}
		for(b=0; s+b==3; b++) {
			if(com1==user2 || com1==user3 || com2==user3 ||com2==user1 || com3==user1 || com3==user2){		
			}
		}
		for(;s==0 && b==0;) {
		System.out.println("O");
		break;
		}
		
		}
		System.out.println(s+"S"+b+"B");
		
		
		
		/*
		while(s<3){
			//정수 3개를 입력 받음
			System.out.println("1~9사이의 정수를 중복되지 않게 입력하세요(예 : 1 2 3) : ");
			user1 = scan.nextInt();
			user2 = scan.nextInt();
			user3 = scan.nextInt();
			
			//s와 b를 각각 0으로 초기화;
			s=0;
			b=0;
			if (com1==user1) {
				s++;
			}
			if (com2==user2) {
				s++;
			}
			if (com3==user3) {
				s++;
			}
			if(com1 == user2 || com1 == user3) {
				b++;
			}
			if(com2 == user3 || com2 == user1) {
				b++;
			}
			if(com3 == user1 || com3 == user2) {
				b++;
			}
			if(s!=0) {
				System.out.print(s+"S");
			}
			if(b!=0) {
				System.out.print(b+"B");
			}
			if(s == 0 && b == 0) {
				System.out.println("O");
			}
			System.out.println();
			
		}
			*/
		
			//com1과 user1이 같으면 s를 1증가
		/*	if (com1==user1 || com2==user2 || com3==user3) {
				s++;
				
			}
			if (com1==user2 || com1==user3 || com2==user3 ||com2==user1 || com3==user1 || com3==user2){
				b++;
			
			}
			
			//com2와 user2가 같으면 s를 1증가
			//com3과 user3이 같으면 s를 1증가
			//com1과 user2가 같거나 com1과 user3이 같으면 b를 1증가
			//com2와 user1이 같거나 com2와 user3이 같으면 b를 1증가
			//com3과 user1이 같거나 com3과 user1이 같으면 b를 1증가
			//s가 0이 아니면 s의 개수와 S를 출력
			if(s!=0) {
				System.out.print(s+"S");
			}
			if(b!=0) {
				System.out.print(b+"B");
			}
			if(s == 0 && b == 0) {
				System.out.println("O");
				break;
			}
		}
		*/
		
		
		
		
		
		
		
		
		
		
		/*for (int i = 1; i <= 3 ;i++) {
			System.out.println("중복되지 않는 1~9숫자를 입력하세요: ");
			int num = scan.nextInt();
			for(int j = num/100 ; j>=num  ; j*=10) {
				if(j==300) {
					System.out.println("S");
					user1++;
				}else if(j==30 || j==3) {
					System.out.println("B");
					user2++;
				}else {
					break;
				}
			}
			for(int j = num/100 ; j>=num  ; j*=10) {
				if(j==80) {
					System.out.println("S");
					user1++;
				}else if(j==8 || j==800) {
					System.out.println("B");
					user2++;
				}else {
					break;
			}
			
		}
			for(int j = num/100 ; j>=num  ; j*=10) {
				if(j==9) {
					System.out.println("S");
					user1++;
				}else if(j==90 || j==800) {
					System.out.println("B");
					user2++;
				}else {
					break;
			}
			}
			sysout
		}
	*/
	
	}

}
