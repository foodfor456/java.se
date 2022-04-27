package day3;

public class Ex6_if3 {

	public static void main(String[] args) {
		
		//중복 if문 예제
		int num = 6;
		
		if(num % 2 == 0) {
			if(num % 3 == 0) {
				System.out.println(num + "는 6의 배수입니다.");			
		}else { 
				System.out.println(num + "는 2의 배수입니다.");
		}
		}else if(num % 3 == 0) {
			System.out.println(num + "는 3의 배수입니다.");
		//2의 배수가 아니고 3의 배수가 아닌 수중에 6의 배수는 없다.
		}else {
			System.out.println(num + "은 2,3,6의 배수가 아닙니다.");
			
	}

	}

}
