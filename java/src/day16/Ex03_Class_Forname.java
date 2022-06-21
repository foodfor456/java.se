package day16;

import java.util.Scanner;

public class Ex03_Class_Forname {

	public static void main(String[] args) {
		Class c;
		try {
			c = Class.forName("java.util.Scanner");
			System.out.println(c);
			c = Class.forName("day12.Car");
			System.out.println(c);
			//newInstence() : 자바 9버전 이후에 없어짐
			//Car car = (Car)c.newInstance();
			//System.out.println(car);
			c = Class.forName("java.util.Scanner1");
			System.out.println(c);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
