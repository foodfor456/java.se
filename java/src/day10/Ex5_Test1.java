package day10;

import java.util.Scanner;

public class Ex5_Test1 {

	public static void main(String[] args) {
		int grade=0,clas=0,num=0;
		int num2=0 ;
		String name="";
		Student st = new Student(name,grade,clas,num);
		Scanner scan = new Scanner(System.in);
		for( ;num2!=3; ) {
		System.out.println("메뉴");
		System.out.println("1. 학생 정보 입력");
		System.out.println("2. 학생 정보 출력");
		System.out.println("3. 프로그램 종료");
		System.out.print("메뉴를 선택하세요 : ");
		num2 = scan.nextInt();
		switch(num2) {
		case 1 : 
			System.out.print("이름	: ");
			name = scan.next();
			System.out.print("학년	: ");
			grade = scan.nextInt();
			System.out.print("반	: ");
			clas = scan.nextInt();
			System.out.print("번호	: ");
			num = scan.nextInt();
			st.Value(name,grade,clas,num);
			break;
		case 2 : st.Print(); break;
		case 3 : System.out.println("종료합니다."); break;
		default : System.out.println("잘못된 명령입니다."); break;
		}
		}
		scan.close();
	}
}
class Student{
	String name;
	int grade,clas,num;
	
	void Print(){
		System.out.println("이름	: "+ name);
		System.out.println("학년	: "+ grade);
		System.out.println("반	: "+ clas);
		System.out.println("번호	: "+ num);
	}
	public Student(String name, int grade, int clas, int num) {
		this.name = name;
		this.grade = grade;
		this.clas = clas;
		this.num = num;
	}
	public void Value(String name, int grade, int clas, int num) {
		this.name = name;
		this.grade = grade;
		this.clas = clas;
		this.num = num;
	}
}

