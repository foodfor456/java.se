package day6;

import java.util.Scanner;

public class Ex8_Array_Divisor {

	public static void main(String[] args) {
		/* 정수 num의 약수를 배열에 저장 한 후, 출력하는 코드를 작성하세요.
		 * 약수는 최대 10개만 저장
		 * */
		
		/*int num = 10000;
		int max = 10;
		int div[]= new int [max];
		int index = 0;
			for(int i = 1; i<=num ; i++) {
				if(num % i ==0) {
				if(index <max) {
					div[index] = i;
					//index를 1증가
					index++;
				}
				}
			}
		//출력
		for(int i = 0; i<index; i++) {
			System.out.println(div[i] + " ");
		}
		*/
		int num1 = 6644;
		int num2 = 10;
		int num[] = new int[num2];
		int count = 0;
		for (int i=1 ; i <= num1;i++) {
			if(num1 % i == 0) {
				if(count<num2) {
					num[count] = i;
					count++;
			}
			}
			}
	for(int i=0;i<count;i++ ) {
		System.out.println("정수" + num1 +"의 약수는" + num[i]);	

	}
	}

}
