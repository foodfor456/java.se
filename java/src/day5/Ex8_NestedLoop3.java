package day5;

public class Ex8_NestedLoop3 {

	public static void main(String[] args) {
		/* 1부터 100사이의 모든 소수를 출력하는 코드를 작성하세요.
		 * 1부터 100사이의 정수를 차례대로 num에 저장하여 출력하는 코드
		 * 			num가 소수인지 아닌지 판별하는 코드
		 * */
		/* 실행문이 한줄이면 밑에 중괄호는 생락이 가능하다. 
		 * 
		if(count == 2) {
			System.out.println("소수");
		}
		if(count == 2) 
			System.out.println("소수");
		* for(int = i =1 ; i<=0 ; i++){
		* 			if(i%2==0)
		* 				sysout(i);
		* 
		* }
		*
		*/
		
		for(int num = 1; num <=100; num++) {
			int count = 0;
			for(int i = 1; i <= num; i++) {
				if(num % i == 0) {
					count++;
					//if 를 만족하면 count++부분에 1씩 증가 한다.
					//소수는 자기 자신 (1), 그리고 1(2)를 만족하는 수를 의미 한다. 나누었을때, 떨어지는 수 중에.
					//그러므로 소수는 2개의 count를 가진수는 소수이다.
				}
			}
			if(count == 2) {
				System.out.println(num + " ");
				
			}
		}
		
		
	}

}
