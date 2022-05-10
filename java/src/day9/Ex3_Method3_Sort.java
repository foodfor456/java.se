package day9;

import java.util.Scanner;

public class Ex3_Method3_Sort {

	public static void main(String[] args) {
		/* 5명의 학생의 성적을 입력받아 오름차순으로 출력하는 코드를 작성하세요.
		 * 단, 입력받은 성적은 배열에 저장해야합니다.*/
		int score[] = new int[5];
		Scanner scan = new Scanner(System.in);
		System.out.println("성적을 입력해주세요 ( 5) : ");
		
		for(int i=0;i<score.length;i++) {
			score[i]=scan.nextInt();
		}
		score(score);
	}
	public static double score(int num[]) {
		int num1 = 0;
		for(int i = 0; i < num.length-1; i++) {
				//i가 0일때 j는 4까지, i가 1일때 j는 3까지, i는 2일때 j는 2까지...
			for(int j=0; j<num.length-1-i; j++) {
					//앞 숫자가 크면 두 수 교환
				if(num[j] > num[j+1]) {
					int tmp = num[j];
					num[j] = num[j+1];
					num[j+1] = tmp;
				}
				}
			}
		for(int i = 0 ; i<num.length ; i++) {
			System.out.print(num[i]+" ");
		}
			return num1;
		}
	
	/* 기능 : 오름차순으로 정렬
	 * 매개변수 : 성적을 입력받은 정수 배열
	 * 리턴타입 : 정렬 후 정수 배열
	 * 메소드명 : score
	 * */
	
	
	
}
