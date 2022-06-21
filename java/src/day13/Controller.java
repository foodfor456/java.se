package day13;

public interface Controller {
	int MIN = 1; //public static final이 앞에 자동으로 붙는다.
	void run(); //public abstract가 자동으로 붙음
	void stop(); //public abstract가 자동으로 붙음
	void print();
	default void test(){
		System.out.println("테스트입니다");
	} //default메소드는 구현 클래스에서 반드시 구현하지 않아도 된다.
}
