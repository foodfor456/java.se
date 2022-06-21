package day12;

public class Ex1_Inheritance1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Child c = new Child();
		c.x = 10;
		c.y = 20;
		//c.z = 30;
		c.setZ(30);
	}

}
class Parent{
	public int x;
	protected int y;
	private int z;
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public int getZ() {
		return z;
	}
	public void setZ(int z) {
		this.z = z;
	}
	public Parent(int x, int y, int z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	
	
}
class Child extends Parent{
	private int s;
	public void print(){
		System.out.println(x); //public : 전부
		System.out.println(y); //protected : 나 + 같은 패키지 + 자식
		//System.out.println(z); //private : 나. 에러발생
		System.out.println(getZ()); //z에 직접적으로 접근할 수 없기 때문에 getter를 이용하여 접근
		System.out.println(s); 
	}
	public Child() {
		this(0,0,0,0);
	}
	public Child(int x, int y, int z, int s) {
		super(x,y,z);
		this.s = s;
	}
}