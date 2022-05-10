package day7;

public class Ex7_Array_For {

	public static void main(String[] args) {
		//향상된 for문
		int score[]= {100,90,30};
		int sum = 0;
		double avg;
		
		for(int tmp : score) {
			sum+=tmp;
			tmp = 10;
		}
		for(int i = 0; i<score.length ; i++) {
			System.out.println(score[i]);
		}
		avg = sum / (double)score.length;
		System.out.println("총점  : " + sum + ", 평균" + avg);
		
	}

}
