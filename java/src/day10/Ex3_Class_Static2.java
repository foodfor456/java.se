package day10;

public class Ex3_Class_Static2 {

	public static void main(String[] args) {
		//Test1 t1;
		//프로그램은 메모리(ram)에서 작동, 하드에서 정보를 끌어옴.
		//프로그램에 Test1이 언급되면 메모리에 올라감.
		// 클래스 메소드
		/* sum은 객체 메소드이기 때문에 클래스 메소드인 main에서 호출하려면,
		 * 객체를 생성한 후, 객체를 통해 호출해야 한다.*/
		Test1 t1 = new Test1(); // 객체 메소드\
		Test1 t2 = new Test1();
		Test1 t3 = new Test1();
		Test1.printCount();
		Ex3_Class_Static2 ex3 = new Ex3_Class_Static2();
		System.out.println(ex3.sum(1,2));
		//객체 변수는 new를 사용했을 때, 메모리에서 만들어짐.
		//즉, 생성 시점이 다름.
	}
	public  int sum(int num1, int num2) {
		return num1 + num2;
	}
}

class Test1{
	int x;
	static int count;//Test1 클래스로 만들어진 객체의 수
	
	void printX() {
		System.out.println(x);
	}
	static void printCount() {
		System.out.println(count);
		
	}
	public Test1() {count++;}
}