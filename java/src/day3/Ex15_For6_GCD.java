package day3;

public class Ex15_For6_GCD {

	public static void main(String[] args) {
		/* 주 정수의 최대 공약수를 구하는 코드를 작성하세요.
		 * 공약수 : 두 정수의 공통으로 있는 약수
		 * 최대 공약수 : 공약수 중 가장 큰 수
		 * 12 : 1 2 3 4 6 12
		 * 18 : 1 2 3 6 9 18
		 * 12와 18의 공약수 : 1 3 6
		 * 12와 18의 최대 공약수 : 6
		 * 반복횟수 : i는 1부터 num1까지 1씩 증가
		 * 규칙성 : i가 num1의 약수이고 i가 num2의 약수이면 i를 gcd라면 변수에 저장
		 * 		=>num1을 i로 나누었을 때 나머지가 0과 같고 num2를 i로 나누었을 때 나머지가 0과 같다면 i를 gcd에 저장
		 * 반복문 종료 후 : gcd를 출력
		 * */
		
		/*같은 타입의 변수를 여러개 선언하는 경우 ,(콤마)를 통해 한줄로 선언할 수 있다.
		 * 타입 변수명1;
		 * 타입 변수명2;
		 * 타입 병수명3, 변수명4
		 * */
		/* 변수의 사용 범위
		 * i는 반복문 밖에서 선언됐기 때문에 반복문 이후에도 사용 가능
		 * j는 반복문 안에 선언됐기 때문에 반복문 안에서만 사용 가능*/
		/*int i;
		for(i = 1; i<= 5; i++);
		for(int j = 1; j<=5; j++);
		System.out.println(i);
		int j = 1;
		System.out.println(j);
		*/
		/*int i ;
		int num1 = 12;
		int num2 = 18;
		int ch = 0;
		for(i=1; i <= num1 ; i++) {
			
			if(num1 % i ==0 && num2 % i == 0) 
		
			{
			ch = i;
			System.out.println("공약수는 " + i);
			
			}
		} System.out.println("최대공약수는 " + ch);
		*/
		
		int num1 = 12, num2 = 18 , gcd = 0 ;
		System.out.print(num1 + "과 " + num2 + "의 공약수는 : " );
		for(int i = 1 ; i <= num1  ; ++i ) {
			if(num1 % i == 0 && num2 % i == 0) {
				gcd = i; //덮어쓰기
		System.out.print(gcd + " ");
			}
		}
		System.out.println(num1 + "과" + num2 + "의 최대 공약수 : " + gcd);
		
		
		
	}

}
