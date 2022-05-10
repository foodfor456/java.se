package day9;

import java.util.Scanner;

public class Ex1_Methos1 {

	public static void main(String[] args) {
		int com[] = new int [3];
		int min = 1 , max = 6;
		
		for(int count = 0 ; count < 3;) {
			int r = (int)(Math.random()*(max - min + 1)+min);
			if(!contains(com,count,r)){
				com[count] = r;
				count++;
			}
		}
		//배열값 출력
		printArray(com);
	
		//사용자가 1~9사이의 정수 3개를 입력
		int user[] = new int[3];
		int strike = 0 , ball = 0 ;
		Scanner scan = new Scanner(System.in);
		do {
			strike = 0;
			ball = 0;
			System.out.print("입력 : ");
			for(int i = 0; i < user.length ; i++) {
				user[i] = scan.nextInt();
			}
			strike = getStrike(com,user);
			
			//ball = getBall(strike,ball);
			
			printResult(strike,ball);
			//입력 받고 스트라이크 메소드 호출 => 볼 메소드 호출 => 결과 출력
		}while(strike < 3);
		scan.close();
		
		System.out.println(getStrike(com,user));
		System.out.println(getBall(com,user));
	}
	
	
	
	public static boolean contains(int arr[],int num, int i){
		//배열이 잘못되거나 비교 갯수가 잘못되서 비교할 필요가 없는 경우
		if(arr == null || arr.length == 0 || num < 0) {
			return false;
		}
		if(arr.length < num) {
			num = arr.length;
		}
		
		for(int j = 0; j < num ; j++ ) {
			if(arr[j] == i) {
			//count++;
		return true;
				
		}
		}
		return false;
		}

	public static void printArray(int num[]) {
		if(num == null || num.length == 0) {
			System.out.println("출력할 배열이 없습니다.");
			return ;
		}
		for(int i = 0; i < num.length; i++) {
			System.out.print(num[i] + " ");
		}
		System.out.println();
	}
	
	

	/* 기능 : 정수형 배열 2개가 주어지면 스트라이크 갯수(같은 자리에서 일치하는 숫자의 개수)를 알려주는 메소드
	 * 매개변수 : 정수형 배열 2개 => int arr1[] , int arr2[]
	 * 리턴타입 : 정수
	 * 메소드명 : getStrike */
	
	/* 기능 : 정수형 배열 2개가 주어지면 볼 갯수(다른 자리에서 일치하는 숫자의 개수)를 알려주는 메소드
	 * 매개변수 : 정수형 배열 2개
	 * 리턴타입 : 정수
	 * 메소드명 : getBall*/
	
	public static int getStrike(int num[] , int num2[]) {
		int s = 0;
		if(num==null || num2 == null) {
			return 0;
		}
		for(int i = 0; i < num.length ; i++) {
		if(num[i]==num2[i]) {
				s++;
		}
		
	}
		return s;
	}
	public static int getBall(int strike[], int ball[]) {
	if(strike==null || ball == null) {
		return 0;
	}
	int b = 0;
	
	for(int tmp : strike) {
		if(contains(ball,ball.length,tmp)){
			b++;
		}
	}
	//볼의 갯수 : 전체 일치 개수 - 스트라이크 개수
	return b - getStrike(strike , ball);
	}

	/* 기능 스트라이크와 볼의 갯수가 주어지면 결과를 콘솔에 출력하는 메소드
	 * 매개변수 : 스트라이크 갯수 , 볼의 갯수
	 * 리턴타입 : 없음
	 * 메소드명 : printResult */

	public static void printResult(int strike , int ball){
		if(strike !=0) {
			System.out.println(strike + "S");
		}
		if(ball != 0) {
			System.out.println(ball + "B");
		}
		if(strike == 0 && ball == 0) {
			System.out.println("O");
		}
		System.out.println();
		
		//System.out.println(num1 + );
		
	}
	}



		/* 1~4사이의 중복되지 않은 3개의 수를 생성하여 배열에 저장하는 코드를 작성하세요.
		 * contains를 이용*/
		
		/*int num[] = new int[3];
		int r;
		
		for(int i = 0 ; i<num.length ; i++) {
			r = (int)(Math.random() * 4 + 1);
			contains(num);
			if(true) {
				num[i]=r;
				System.out.println(num[i]);
			}
		}
	
	
	}
	/* 기능 : 정수형 배열에서 처음부터 n개중에서 정수 num가 있는지 없는지 알려주는 메소드
	 * {1,2,3,4,5}에 6이 있는지 없는지 확인하여 있다 없다를 알려주는 메소드
	 * 매개변수 : 정수형 배열, 종료 지점
	 * 리턴타입 : fulse, true
	 * 메소드명 : contains
	 * */
	/*public static boolean contains(int num2[],int num, int i , int j){
		//배열이 잘못되거나 비교 갯수가 잘못되서 비교할 필요가 없는 경우
		if(num2[j] == 0 || j < 0) {
			return false;
		}
		/*if(num2[j] < i) {
			i = num2[j];
		}*/
	/*	for(int i1 = 0; i1 < num2[j];) {
			if(num2[i1] == num) {
			//count++;
			i1++;
			break;
			
		}
			return true;
		}
			
			
		}
	*/

