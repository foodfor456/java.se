package day7;

import java.util.Scanner;

public class Ex5_Array_Baseball {

	public static void main(String[] args) {
		/* 정수 3개짜리 배열 com을 생성 한 후 랜덤으로 세 정수를 만들어 
		 * 배열에 저장하는 코드를 작성하세요. (중복 가능)
		 * */
		Scanner scan = new Scanner(System.in);
		int s = 0 , b = 0;
		int com[]=new int[3];
		int com2[]=new int[com.length];
		int max = 9;
		int min = 1;
		int count = 0;
		for (; count < 3 ;  ) {
			//랜덤한 수 생성
			int r = (int)(Math.random() * (max-min+1) + min);
			//랜덤한 수와 저장된 배열값들을 비교하여 중복이 안되면 저장
			int i = 0;
			for( ; i<count; i++) {
				if(r == com[i]) {
				break;
			}
			}
			//반복문 종료 후 i가 count와 같다는 의미는 중복된 수가 없다는 의미. 
			if(i == count) {
				com[count] = r;
				System.out.println(com[count]);
				count++;
			}
		}
		
		//
		
		/*for(int i = 0 ; i < com.length; i++) {
		System.out.println("유저의 정수를 입력하세요 ( 0 ~ 9 ) :");
		int num = scan.nextInt();
		int num2 = scan.nextInt();
		int num3 = scan.nextInt();
		}
		/* 사용자가 정수 3개를 입력하여 3S가 될때까지 게임을 진행하도록 코드를 작성하세요.
		 * */
		/*for(int i = 0; i<com.length;i++) {
			for(int j = 0; j<com2.length;j++) {
				if(i == j) {
					continue;
				}
				if(com[i] == com2[j]) {
					b++;
				}
			}
		}
		*/
		
		/*for(int i=0; i<com.length;i++) {
			System.out.println(i+1+"유저의 정수를 입력하세요:");
			int num = scan.nextInt();
			com2[i] = num;
		}
		for(int i=0;i<com.length;i++) {
			if(com[i]==com2[i]){
			s++;
		}	
		}
		for(int i = 0; i < com.length ; i++){
		for(int j = 0 ; j < com.length; j++) {
			if(com [i] == com2[j] && com[i]!=com2[i]) {
			b++;
		}
		}
		}
		if(s+b==0){
			System.out.println("OUT");
		}else if(s==com.length) {
			System.out.println(s+"S");	
		}else if(b==com.length) {
			System.out.println(b+"B");	
		}else {
			System.out.println(s+"S"+b+"B");
			}
			
		*/
		}
		
	}
