package day3;

import java.util.Scanner;

public class Ex1_Scanner1 {

	public static void main(String[] args) {
		/* 한 학생의 수학, 영어, 국어 성적을 입력받고, 총점과 평균을 구하세요.
		 * 단, 성적은 정수로 입력받고 0~100사이의 정수를 입력해야 합니다. */
		
		
		Scanner scan = new Scanner(System.in);
		
		
				
		//System.out.print("성적을 입력하세요    " + " 수학 : " + "\n" + "\t" + "\t" + "영어 : " + "\n" + "\t" + "\t" + "국어 : ");
				
		System.out.print("수학성적을 입력하세요 : " );
		int num = scan.nextInt();
		System.out.print("영어성적을 입력하세요 : " );
		int num2 = scan.nextInt();
		System.out.print("국어성적을 입력하세요 : " );
		int num3 = scan.nextInt();
		
		
		
		
		//System.out.println(num + num2 + num3);
		System.out.println(" 총점은 " + (num + num2 + num3) + "점 입니다" );
		System.out.println(" 평균은 " + (double)(num + num2 + num3) / 3 + " 입니다. ");
		//System.out.print("정수를 입력하세요 : ");
		//int num = scan.nextInt();
		//System.out.println("입력한 정수는 " + num + "입니다.");
				
		scan.close();
		
	}

}
