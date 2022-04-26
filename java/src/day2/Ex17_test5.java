package day2;

public class Ex17_test5 {

	public static void main(String[] args) {
		/* num가 2의 배수이면 2의 배수라고 출력하고,
		 * num가 3의 배수이면 3의 배수라고 출력하고,
		 * num가 6의 배수이면 6의 배수라고 출력하고
		 * num가 2,3,6의 배수가 아니면 2,3,6의 배수가 아니라고 출력하는 코드를 작성하세요.
		 * n의 배수 : num를 n으로 나누었을 때 나머지가 0과 같다.
		 * 단, num가 6이면 6의 배수라고 출력해야 합니다. 2의 배수 3의 배수 출력이 나오면 안됩니다.
		 * 실행 순서는 위에서 부터 작동.
		 * 순서를 2의 배수부터 하면, 6의 배수, 3의 배수와 2의 배수가 겹치므로, 2의 배수가 가장 나중에 실행하여야 한다. 
		 * */
		
		int num = 0;
		
		if(num % 2 == 0 && num % 3 != 0) {
			System.out.println(num + "은 모든수의 배수입니다.");
		}else if(num % 6 == 0) {
			System.out.println(num + "는 6의 배수입니다.");
		}else if(num % 3 == 0) {
			System.out.println(num + "는 3의 배수입니다.");
		//2의 배수가 아니고 3의 배수가 아닌 수중에 6의 배수는 없다.
		}else if(num % 2 == 0) {
			System.out.println(num + "는 2의 배수입니다.");
		}else {
			System.out.println(num + "은 2,3,6의 배수가 아닙니다.");
			
	}
	}

}
