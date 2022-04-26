package day2;

public class Ex11_if1 {

	public static void main(String[] args) {
		/* num가 짝수이면 짝수라고 출력하는 코드를 if문을 이용하여 작성하세요.
		 * ~하면 ...한다.
		 * ~조건식
		 * ... : 실행문;
		 * if(조건식) {
		 * 		실행문;
		 * }
		 * if(num가 짝수이다) {
		 * 		짝수라고 출력;
		 * }
		 * 
		 * 	 
		 * */
		
		if(false) {
			System.out.println("참입니다.");
		}
		
		int num = 2;
		if(num % 2 ==0){
			System.out.println("짝수");
		}
		/* score가 90점 이상이고, 100점이하면 A학점이라고 출력하는 코드를 if문을 이용하여 작성하세요
		 * if(score가 90점 이상이고 score가 100점 이하이다.{
		 * 			A학점이라고 출력;
		 * }
		 * in(score가 90점 보다 크거나 같다 && score가 100점보다 작거나 같다){
		 * 			A학점이라고 출력;
		 * }
		 * */
		int score = 95;
		
		if(score >= 90 && score <=100) {
			
			System.out.println(score + "은 A학점");
		}
		
		
		
		
	}

}
