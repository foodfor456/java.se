package day4;

import java.util.Scanner;

public class Ex2_For_Score {

	public static void main(String[] args) {
		/* 3명의 국어 점수를 입력받아 총점과 평균을 구하는 코드를 작성하세요. 반복문 이용
		 * 단, 총점과 평균만 알면 됨.
		 * 반복문 활용이 잘 안되는 분은 반복문 없이 해보고 다 한 후 반복문으로 변경해보세요.
		 * */
		
		//Scanner scan = new Scanner (System.in);
		
		
				
		int st,st1;
		int score, score1 = 0;
		double avg;
		Scanner scan = new Scanner (System.in);
		//st는 1부터 3까지 1씩 증가
		for(st=1 ; st<= 3; st++) {
			System.out.print("학생" + st + "의 국어 성적 : ");
			// Scanner를 이용하여 정수를 입력받아 score에 저장한 후,
			score = scan.nextInt();
			// score1에 score를 더해서 score1에 저장
			score1 += score; //score1 = score1 + score;
		st1 = st;
			
		}
		//score1을 출력하고, score1를 3으로 나누어서 avg에 저장한 후, avg를 출력
		System.out.println(" 3명 학생의 국어 총점 : " + score1);	
		avg = score1 / (double)3;
		System.out.print(" 3명 학생의 국어 평균 : " + avg);	
		
		
		scan.close();
	}

}
