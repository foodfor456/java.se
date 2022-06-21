package day12;

public class Ex5_Polymorphism {

	public static void main(String[] args) {
		Tire tire[] = new Tire[4];
		tire [0] = new HankookTire(100, 100, "앞 왼쪽");
		tire [1] = new HankookTire(100, 100, "앞 오른쪽");
		tire [2] = new KumhoTire(100, 100, "뒤 왼쪽");
		tire [3] = new KumhoTire(100, 100, "뒤 오른쪽");
		Car car1 = new Car(tire);
		car1.print();
		Tire tire2[] = {
				new HankookTire(90, 100, "앞 왼쪽"),
				new HankookTire(90, 100, "앞 왼쪽"),
				new KumhoTire(90, 100, "뒤 왼쪽"),
				new KumhoTire(90, 100, "뒤 왼쪽"),
		};
		Car car2 = new Car(tire2);
		car2.print();
		System.out.println("----------------------");	
		car2.repare(3, new HankookTire(80, 70, "뒤 오른쪽"));
		car2.print();
		System.out.println("----------------------");
		car2.repare(3, new KumhoTire(80, 70, "뒤 오른쪽"));
		car2.print();
	}
	
		}
