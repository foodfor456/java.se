package day17;

public class Ex01_Wrapper {

	public static void main(String[] args) {
		/* - 제네릭 클래스에서 기본 타입으로 된 제네릭을 만들고 싶지만,
		 *   제네릭은 기본 타입이 올 수 없고, 클래스가 필요함. 
		 *   그래서 기본타입으로 만든 Wrapper 클래스를 이용해야 한다.
		 * - Wrapper클래스와 기본 타입의 차이.
		 * 	 - Wrapper 클래스의 객체는 기본 타입값과 null을 가짐.\
		 * 	 	=> 언박싱할 때 조심해야함. null일수도 있기 때문
		 * 	 - 기본 타입은 기본 타입값만 가질 수 있다.
		 * - 두 기본타입 변수는 ==로 비교 가능.
		 * - 기본 타입변수와 Wrapper 클래스 객체를 ==로 비교할 수 있다.
		 *   => Wrapper클래스 객체가 자동으로 언박싱이 되어서 ==로 비교 가능
		 * - 두 Wrapper클래스 객체는 ==로 비교하면 안됨.*/
		//List<Integer> list = new ArrayList<Integer>();
		
		Integer num1 = 1; // 자동 박싱이 된것.
		int num2 = num1;  // 자동 언박싱이 된것.
		Integer num3 = null;
		System.out.print("두 기본타입변수 == 비교            : ");
		int num5 = 1, num6 = 1;
		if(num5 == num6) {
			System.out.println(num5 + "와 " + num6 + "은 같다");
		}else {
			System.out.println(num5 + "와 " + num6 + "은 다르다");
		}
		
		Integer num7 = 1, num8 = new Integer(1);
		System.out.print("두 Wrapper 객체 == 비교         : ");
		
		if(num7 == num8) {
			System.out.println(num7 + "와 " + num8 + "은 같다");
		}else {
			System.out.println(num7 + "와 " + num8 + "은 다르다");
		}
		System.out.print("두 Wrapper 객체와 기본타입 == 비교 : ");
		if(num7 == (int)num8) {
			System.out.println(num7 + "와 " + num8 + "은 같다");
		}else {
			System.out.println(num7 + "와 " + num8 + "은 다르다");
		}
		
		String str = "5555";
		int num9 = Integer.parseInt(str);
		System.out.println("문자열 : " + str + ", 정수 : " + num9);
		String str2 = "1.23";
		double num10 = Double.parseDouble(str2);
		System.out.println("문자열 : " + str2 + ", 정수 : " + num10);
				
	}

}
