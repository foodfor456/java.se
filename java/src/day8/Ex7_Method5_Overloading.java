package day8;

public class Ex7_Method5_Overloading {

	public static void main(String[] args) {
		System.out.println(sum(1,2));
		System.out.println(sum(1.2 ,2.3));
		System.out.println(sum(1.2f,2.3));
		System.out.println(sum(1.2,3));
		//각각 sysout 형태가 다름.
		System.out.println(1);
		System.out.println('1');
		System.out.println("1");
		
	}
	public static int sum(int num1 , int num2) {
		return num1 + num2;
	}
	public static double sum(double num1, double num2) {
		return num1 + num2;
	}
}
