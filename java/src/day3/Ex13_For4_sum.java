package day3;

public class Ex13_For4_sum {

	public static void main(String[] args) {
		/* 1부터 5까지 합을 구하는 코드를 작성하세요.
		 * 		sum = 0
		 * i=1	sum = 0 + 1 
		 * i=2	sum = 0 + 1 + 2
		 * i=3	sum = 0 + 1 + 2 + 3 
		 * i=4	sum = 0 + 1 + 2 + 3 + 4
		 * i=5	sum = 0 + 1 + 2 + 3 + 4 + 5
		 * 
		 * i=1	sum = 0 + 1 
		 * i=2	sum = 0 + 1 + 2
		 * i=3	sum = 0 + 1 + 2 + 3 
		 * i=4	sum = 0 + 1 + 2 + 3 + 4
		 * i=5	sum = 0 + 1 + 2 + 3 + 4 + 5
		 * 
		 * 		sum = 0
		 * 		sum = 0 sum + 1
		 * 		sum = 0 sum + 2
		 * 		sum = 0 sum + 3
		 * 		sum = 0 sum + 4
		 * 		sum = 0 sum + 5
		 * 반복 횟수 : i 는 1부터 5까지 1씩 증가
		 * 규칙성 : sum = sum = sum + 1
		 * 반복문 종료 후 : sum을 출력
		 * 
		 * 
		 * */
		
		int i;
		int sum = 0;
		for(i=1; i<=5; ++i) {
		sum += i;	}
		//sum = sum + i;
		System.out.println("1부터 5까지의 합 : " + sum);
					
		
		
		
	}

}
