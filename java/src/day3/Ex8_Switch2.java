package day3;

public class Ex8_Switch2 {

	public static void main(String[] args) {
		/* 월이 주어졌을 때 주어진 월의 마지막일을 출력하는 코드를 작성하세요.
		 * 31 : 1 3 5 7 8 10 12
		 * 30 : 4 6 9 11
		 * 28 : 2
		 * */
		int month = 2;
		
		switch(month) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			System.out.println(month + "의 마지막 일은 31일 입니다. ");
		break;
		case 2:
		System.out.println(month + "의 마지막 일은 28일 입니다. ");
		break;
		case 4: case 6: case 9: case 11:
			System.out.println(month + "의 마지막 일은 30일 입니다. ");
		break;
		default:
			System.out.println(month + "는 없는 달입니다.");
		
		/*case 6:
			System.out.println(month + "의 마지막 일은 30일 입니다. ");
		case 9:
		break;
		case 11:
			System.out.println(month + "의 마지막 일은 30일 입니다. ");
		break;
		case 0:
			System.out.println(month + "은 잘못된 월 입니다.");
		break;
		default:
			System.out.println(month + "의 마지막 일은 31일 입니다. ");
		*/		
		
		
		
		
		
		}
		
		
		
		
		
	}

}
