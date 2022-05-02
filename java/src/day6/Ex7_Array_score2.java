package day6;

import java.util.Scanner;

public class Ex7_Array_score2 {

	public static void main(String[] args) {
		/* 최대 10명 학생의 성적을 저장하기 위한 배열을 선언하고,
		 * 입력할 학생수를 입력을 받아 입력받은 학생수만큼 성적을 입력받고 총점과 평균을 출력하는 코드를 작성하세요.
		 * 예1>
		 * 학생수를 입력하세요 : 3
		 * 1번 학생 : 90
		 * 2번 학생 : 80
		 * 3번 학생 : 70
		 * 총점 : 240점, 평균 : 80점
		 * 
		 * 예2>
		 * 학생수를 입력하세요 : 11
		 * 최대 10명까지 입니다.
		 * 
		 * 예3>
		 * 학생수를 입력하세요 : 0
		 * 최소 1명부터 입니다.
		 * */
		Scanner scan = new Scanner(System.in);
		int max = 10;
		int score[] = new int[max];
		System.out.println("학생수를 입력하세요 : ");
		int count = scan.nextInt();
		if(count > 10) {
			System.out.println("최대 10명까지입니다.");
		}
		else if (count <= 0) {
			System.out.println("최소 1명부터입니다.");
		}else {
			int sum = 0;
			double avg = 0.0;
			for(int i = 0; i<count; i++) {
				System.out.println(i+1+"번 학생 : ");
				score[i] = scan.nextInt();
				sum += score[i];
		}
			avg = sum/(double)count;
			System.out.println("총점 : " + sum +"점, 평균 : " + avg + "점");
		}
		scan.close();
		
	}
	
}
