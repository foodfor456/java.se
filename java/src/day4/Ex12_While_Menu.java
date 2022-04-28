package day4;

import java.util.Scanner;

public class Ex12_While_Menu {

	public static void main(String[] args) {
		/* 다음과 같은 메뉴가 출력되고, 종료 메뉴를 입력할 때까지 반복하는 코드를 while문으로 작성하세요.
		 * 
		 * 메뉴
		 * 1.학생정보입력
		 * 2.학생정보출력
		 * 3.학생정보수정
		 * 4.학생정보삭제
		 * 5.프로그램 종료
		 * 메뉴를 선택하세요 :
		 * */
		Scanner scan = new Scanner(System.in);
		
		int i = 9;
		while(i != 5) {
		System.out.println("1.학생정보입력 : \n"+"2.학생정보출력 : \n"+"3.학생정보수정 : \n"+"4.학생정보삭제 : \n"+"5.프로그램 종료\n"+"메뉴를 선택하세요 (1 ~ 5) : "  );
		int num1 = scan.nextInt();
		
		i = num1;
					
		}
		
		/*if를 이용한 반복 예제
		System.out.println("방법 1 종료.");
		while(true){
		System.out.println("1.학생정보입력 : \n"+"2.학생정보출력 : \n"+"3.학생정보수정 : \n"+"4.학생정보삭제 : \n"+"5.프로그램 종료\n"+"메뉴를 선택하세요 (1 ~ 5) : "  );
		int num1 = scan.nextInt();
		
		if(num1 == 5) {
				
		break;	
		}
		*/
					
		//}
		
		
		
		
	scan.close();
	
	}

}
