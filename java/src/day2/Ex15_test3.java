package day2;

public class Ex15_test3 {

	public static void main(String[] args) {
		/* month가 주어질 때 해당 달의 마지막 일을 출력하는 코드를 if문으로 작성하세요
		 * 31 : 1 3 5 7 8 10 12
		 * 30 : 4 6 9 11
		 * 28 : 2
		 * 그 외의 달은 잘못된 월입니다 라고 출력
		 * */
		int month = 4;
		
		if(month > 12 || month <= 0) {
			System.out.println(month+"은 잘못된 달입니다.");
		}
		else if(month == 2) {
			System.out.println(month+"은 28일");
		}
		else if(month == 4 || month == 6 || month == 9 || month == 11) {
			System.out.println(month+"은 30일");
		}
		else {
			System.out.println(month+"은 31일");
		}
		
		int month2 = 3;
		if(month2 < 1 || month2 > 12) {
			System.out.println(month2 + "월은 잘못된 월입니다.");
		}else if(month2 == 2) {
			System.out.println(month2 + "월은 28일까지 있습니다.");
		}else if(month2 == 4 || month2 == 6 ||month2 == 9 || month2 == 11) {
			System.out.println(month2 + "월은 31일까지 있습니다.");
		}else {
			System.out.println(month2 + "월은 31일까지 있습니다.");
		}
		
		
		

	}

}
