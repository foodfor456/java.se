package day9;

import java.util.Scanner;

public class Ex2_Method_Lotto {

	public static void main(String[] args) {
		/* 앞 예제에서 사용한 메소드들을 필요하면 복사 붙여넣기 해서 로또 프로그램을 작성하세요.
		 * 필요한 기능은 메소드로 추가해도 됩니다.
		 * */
		//로또 구매 : 로또번호 입력(6자리, 1~45)
		
		//로또 번호 생성 (랜덤. 1~45 중복X, 6자리)
		
		//로또 보너스 번호 생성
		
		//당첨 갯수 확인
		
		//당첨 등수 출력
		
		Scanner scan = new Scanner(System.in);
		int min = 1 , max = 45;
		int lotto[] = new int [7];
		int user [] = new int [6];
		for (int i = 0; i < lotto.length;) {
			int r = (int)(Math.random()*(max-min+1)+min);
			for(; ; ) {
				if(!contains(lotto,i,r)) {
					lotto[i] = r;
					System.out.print(r+" ");
					i++;
					break;
				}else {
				break;
				
			}
			}
		}
		System.out.println("번호를 입력해주세요 (1~45 6개) : ");
		for (int i = 0 ; i<user.length ; i++) {
			
			int num = scan.nextInt();
			user[i] = num;
		}
		int num = 0;  
		int num2 = 0;
		num = result(lotto,user);
		num2 = result2(lotto,user);
		printArr(num , num2);
		scan.close();
	}
	public static boolean contains(int arr[],int num, int i){
		//배열이 잘못되거나 비교 갯수가 잘못되서 비교할 필요가 없는 경우
		if(arr == null || arr.length == 0 || num < 0) {
			return false;
		}
		if(arr.length < num) {
			num = arr.length;
		}
		for(int j = 0; j != num ; j++ ) {
			if(arr[j] == i) {
		return true;
		}
		}
		return false;
		}
	
	//매개 변수 : 로또 번호 , 사용자 입력 번호
	public static int result(int num[],int num2[]) {
		int count = 0 ;
		for(int i = 0; i < 6; i++) {
			for(int j = 0;j<num2.length;j++) {
				if(num[i]==num2[j]) {
					count++;
		}
		}
		}
		return count;
	}
	//매개 변수 : 로또 번호 6배열 , 사용자 입력 번호
	public static int result2(int num[],int num2[]) {
		int count = 0;
		for(int i = 0; i < num2.length; i++) {
				if(num[6] == num2[i]) {
					count++;
	}
				
	}
		return count;
	}
	public static void printArr(int num , int num2) {
		switch(num + num2) {
		case 6:
			System.out.println("1등");
			break;
		case 5:
			if(num2 != 1) {
				System.out.println("3등");
			}else {
				System.out.println("2등");
			}
			break;
		case 4:
			System.out.println("4등");
			break;
		case 3:
			System.out.println("5등");
			break;
		default:
			System.out.println("꽝");
		}
	}
}
