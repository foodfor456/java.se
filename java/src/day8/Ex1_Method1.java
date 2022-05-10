package day8;

public class Ex1_Method1 {

	public static void main(String[] args) {
		/* 두 정수의 합을 알려주는 메소드를 작성해보세요. */
		int num1=1 , num2=2;
		int res = sum1(num1,num2);
		//메모지 res에 1+2값을 저장 후, 프린트
		System.out.println(res);
		//sum값을 불러와서 바로 프린트
		System.out.println(sum1(1,2));
		sum2(1,2);
		//1 + 2 + 3
		int res1 = sum1(1,2);
		int res2 = sum1(res1,3);
		System.out.println(res2);
		sum2 (1+2,3);
	}
	
	/* 1. 기능 : 두 정수가 주어지면 두 정수의 합을 알려주는 메소드
	 * 2. 매개변수 : 두 정수 => int num1, int num2; / 각각 타입을 적어줘야함. = int num1 , num2 ;<-지역변수
	 * 3. 리턴타입 : 두 정수의 합 => 정수 => int
	 * 4. 메소드명 : sum
	 * 선생님(res)한테 알려주세요.
	 * */
	//public static 리턴타입 메소드명(매개변수) {
	//}
	public static int sum1(int num1 , int num2) {
		int res = num1 + num2;
		return res;
	}
	/* 1. 기능 : 두 정수가 주어지면 두 정수의 합을 콘솔에 출력하는 메소드
	 * 2. 매개변수 : 두 정수 => int num1, int num2; / 각각 타입을 적어줘야함. = int num1 , num2 ;<-지역변수
	 * 3. 리턴타입 : 없음 =>void
	 * 4. 메소드명 : sum2
	 * 두 정수의 합을 칠판에 적어보세요.
	 * */
	public static void sum2(int num1 , int num2) {
		int res = num1 + num2;
		System.out.println(res);
	}
}
