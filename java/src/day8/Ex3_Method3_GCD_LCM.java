package day8;

public class Ex3_Method3_GCD_LCM {

	public static void main(String[] args) {
		int num1=30, num2=45;
		int res = lcm(num1,num2);
		int res1 = lcm2(num1,num2);
		int res2 = GCD(num1,num2);
		
		System.out.println("두 정수의 최소 공배수는 : " + res);
		System.out.println("두 정수의 최소 공배수는 : " + res1);
		System.out.println("두 정수의 최대 공약수는 : " + res2);
		
		
	}
	/* 기능 : 두 정수가 주어지면 두 정수의 최대 공약수를 알려주는 메소드
	 * 매개변수 : 두 정수 => int num1 , int num2
	 * 리턴타입 : 최대 공약수
	 * 메소드명 : GCD*/
	public static int GCD(int num1, int num2) {
		int res = 0;
		for (int i = 1; i <= num1 ;i++) {
			if(num1 % i == 0 && num2 % i == 0) {
				res=i;
			}
		}
		return res;
		
	}
	/* 
	 * 기능 : 두 정수의 최소공배수를 알려주는 메소드
	 * 매개변수 : 두 정수 = > int num1 , int num2
	 * 리턴타입 : 두 정수의 최소 공배수 => 정수 => int
	 * 메소드명 : lcm
	 * int num1 , num2
	 * num1 * num2 / gcd(num1,num2) =최소 공배수
	 * 
	 * 
	 * */
	public static int lcm(int num1, int num2) {
		int i = num1;
		for( ; i <= num1*num2 ; i += num1) {
			if(i % num1 == 0 && i % num2 == 0) {
			break;
			}
			}
		return i;
	}
	public static int lcm2(int num1, int num2) {
		return num1 * num2 / GCD(num1, num2);
	}
	
}
