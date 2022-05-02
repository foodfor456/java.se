package day6;

import java.util.Scanner;

public class Ex5_Array3_Sum {

	public static void main(String[] args) {
		/* 학생 3명의 국어 성적을 입력받고, 총점과 평균을 구하는 코드를 작성하세요.
		 * 단, 학생 3명의 성적을 총점과 평균을 출력한 다음 출력하세요.
		 * 배열 선언
		 * score[0] = 입력;
		 * score[1] = 입력;
		 * score[2] = 입력;
		 * */
		Scanner scan = new Scanner(System.in);
		int score [] = new int[3];
		int sum = 0;
		double avg = 0;
		
		for(int i = 0 ; i< score.length ; i++) {
			System.out.println(i+1+"번째 학생의 성적 : ");
			score[i] = scan.nextInt();
		}
		for(int i = 0 ; i < score.length; i++) {
			sum += score[i];
			avg = sum / (double)score.length;
		}
			System.out.println("학생 3명의 총점은 " + sum + "점이고, 평균은 " + avg + "점입니다");
		for(int i = 0 ; i < score.length; i++) {
			System.out.println(i+1+"번째 학생의 성적 : " + score[i]);
		}
		scan.close();
		
		
		/*int arr[] = new int[3];
		int sum = 0;
		for(int i = 0; i < arr.length ; i++) {
			System.out.println("국어 성적을 입력하세요 : ");
			arr[i] = scan.nextInt();
			sum+=arr[i];
		}
		System.out.println("총점은 : " + sum + "평균은 : " + (sum / arr.length));
		
		*/
		
		
		
	}

}
