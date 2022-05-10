package day10;

public class Ex2_Class_Static1_Point {
		
	public static void main(String[] args) {
		//에러 발생 :	print()메소드는 객체 메소드이기 때문에, 클래스 이름으로 호출할 수 없다.
		//Point.print(); 
		//print메소드는 객체 메소드이기 때문에, 객체를 생성 후 호출해야 함.
		Point1 p1 = new Point1(10,20);
		p1.print();
		Point1.printDimensional();
		//클래스 메소드는 객체를 이용하여 호출할 수 있지만, 경고가 뜬다.
		p1.printDimensional();
		
		System.out.println();
		//대문자.소문자.메소드 = > 객체 메소드
		//대문자.대문자.메소드 = > 클래스 메소드
	}

}
class Point1{
	static String dimensional = "이차원"; // 점을 공용으로 쓰기때문에 static(클래스 변수)
	int x, y; // 각각 좌표가 매번 다를 수 있기 때문에 static안씀 => 객체 변수
	
	public Point1(int x, int y) {
		//내 필드 x,y에 매개변수 x,y의 값을 저장
		this.x = x;
		this.y = y;
		//매개변수의 이름과 내 필드(멤버변수)의 값이 같을 때, this를 사용.
	}
	public Point1() {
		this(0,0);
		//내 생성자 중에서 정수,정수를 찾는다.
	}
	public void print() {
		System.out.println("차원 : " + dimensional);
		System.out.println("좌표 : " + x + "," + y);
		//객체 변수 x,y가 존재하기 때문에 static을 붙이지 않음(객체변수가 하나라도 있기 때문)
	}//객체 변수
	public void move(int x , int y) {
		this.x = x;
		this.y = y;
	}//객체 변수 X
	public static void printDimensional() {
		System.out.println("차원 : " + dimensional);
	}
}