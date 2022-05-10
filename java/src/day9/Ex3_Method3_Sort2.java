package day9;

import java.util.Scanner;

public class Ex3_Method3_Sort2 {

	public static void main(String[] args) {
		/* 5명의 학생의 성적을 입력받아 오름차순으로 출력하는 코드를 작성하세요.
		 * 단, 입력받은 성적은 배열에 저장해야합니다.*/
		Scanner scan = new Scanner(System.in);
		System.out.println("성적 입력 (5명) : ");
		int score[] = inputCreateArray(scan,5);
		//반복문과 Scanner를 이용하여 성적을 입력 받음.
		bubbleSort(score,true);
		printArray(score);
		
		scan.close();
	/* 기능 : 정수 배열값을 순차적으로 입력받고, 오름차순으로 정렬
	 * 매개변수 : 성적을 입력받은 정수 배열
	 * 리턴타입 : 정렬 후 정수 배열
	 * 메소드명 : score
	 * */
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
	public static int[]inputCreateArray(Scanner scan, int n){
		if(n <= 0) {
			return null;
		}
		int arr[] = new int[n];
		for(int i = 0; i<n; i++) {
			arr[i] = scan.nextInt();
		}
		return arr;
	}
	/* 기능 : 정수 배열이 주어지면 오름차순 또는 내림차순으로 정렬하는 메소드
	 * 매개변수 : 정수 배열 , 오름,내림 => int arr[] , boolean up
	 * 리턴타입 : 정렬 후 정수 배열 => 없음
	 * 메소드명 : bubbleSort*/
	public static void bubbleSort(int arr[], boolean asc) {
		if(arr == null) {
			return;
		}
		for(int i = 0; i<arr.length-1 ; i++) {
			for(int j = 0; j < arr.length-1 ; j++) {
				//오름차순인 경우
				if(asc && arr[j] > arr[j+1]) {
					int tmp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1] = tmp;
				//내림차순인 경우
				}else if(!asc && arr[j] < arr[j+1]) {
					int tmp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1] = tmp;
				}
				}
		}
		}
}
