package day4;

public class Ex10_While_sum {

	public static void main(String[] args) {
		/* 1부터 5까지의 합을 구하는 코드를 while문을 이용하여 작성하세요.
		 * 
		 * 반복횟수 : i는 1부터 5까지 1씩 증가
		 * 규칙성 : sum에 i를 더한 후 sum에 저장
		 * 반복문 종료 후 : sum을 출력*/
		int a = 0, num = 1;
		
		while(num <= 5) {
			
			a += num++;
			
			
		}
		System.out.println("1부터 5까지의 합 : "+ a);
		
		
		
	}

}
