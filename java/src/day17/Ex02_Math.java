package day17;

public class Ex02_Math {

	public static void main(String[] args) {
		/* 주어진 정수를 소수점 둘째자리에서 반올림하는 코드를 작성하세요.*/
		double pi = 3.141592;
		double r = Math.rint(pi*10);
		System.out.println(r/10);
		
		
		int num = 1;
		double pi2 = pi * Math.pow(10, num);
		double pi3 = Math.round(pi2) / Math.pow(10, num);
		double pi4 = Math.round(pi * Math.pow(10, num))/ Math.pow(10, num);
		System.out.println(pi3);
		System.out.println(pi4);
		
	}

}
