package day7;

import java.util.Scanner;

public class Ex2_Array2_Duplicated {

	public static void main(String[] args) {
		/* Duplicated(중복된)
		 * */
		/* 정수 num를 입력받고, 입력받은 정수가 배열에 있는지 없는지 확인하는 코드를 작성하세요.*/
		Scanner scan = new Scanner(System.in);
		System.out.print("정수를 입력해 주세요 : ");
		int num = scan.nextInt();
		int arr[] = {1,2,3};
		int count = 0;
		if(arr[0]==num) {
			count++;
		}if(arr[1]==num) {
			count++;
		}if(arr[2]==num) {
			count++;
		}
		if(count >0) {
			System.out.println(num+" 는 중복된 정수입니다");
		}else{
			System.out.println(num+"중복된 정수가 없습니다.");
		}
		
		
		//반복문 사용 1 : 배열 전체를 탐색 => 있는지는 확인할 수 있다. 어디에 있는지는 모름.
		count = 0;
		for(int i = 0 ; i < arr.length ; i++) {
			if(arr[i]==num) {
				count++;
			}
		}
		if(count >0) {
			System.out.println(num+" 는 중복된 정수입니다");
		}else{
			System.out.println(num+"중복된 정수가 없습니다.");
		}
		//반복문 사용 2 : 첫번째 중복 숫자가 나오면 확인 중단
		int i;
		for(i = 0 ; i < arr.length ; i++) {
			if(arr[i]==num) {
				break;
			}
		}
		//반복문에서 break를 만나면 i는 3보다 작고, break를 안만나면 i는 3인 특성을 이용 =>있으면 i번지에 있음.
		//반복문을 빠져나왔을때 i의 값을 이용.
		if(i < arr.length) {
			System.out.println(num+" 는 중복된 정수입니다");
		}else{
			System.out.println(num+"중복된 정수가 없습니다.");
		}
		
		/*
		int count = 0;
		for(int i = 0 ;i<arr.length ;i++ ) {
			if(arr[i]==num) {
			count++;
			}
			}
		if(count >0) {
			System.out.println(num+" 는 중복된 정수입니다");
		}else {
			System.out.println(num+"중복된 정수가 없습니다.");
		}
		*/
		scan.close();
		
	}

}
