package day4;

import java.util.Scanner;

public class Ex5_Break2 {

	public static void main(String[] args) {
		/* 정수를 양의 정수를 5번 입력하고, 입력한 정수를 콘솔에 출력하는 코드를 작성하세요.
		 * 입력받은 정수가 음수이면 반복문을 빠져 나오게 수정해보세요.
		 * 반복횟수 : 무한대
		 * 규칙성 : Scanner를 이용하여 정수를 입력받아 num에 저장하고, num가 음수이면 반복문을 빠져 나가고 아니면 num를 출력
		 * 반복문 종료 후 : 없음
		 * */
		Scanner scan = new Scanner(System.in);
		
		int num;
		
		for(; ;){
			
				System.out.print("양의 정수를 입력하세요 : " );
			num = scan.nextInt();
			if(num < 0) {
				System.out.println("음수임.");
			break;
			}
			System.out.println(num);
		}
		
		
		
		
		
		
		/*int a, i;
		for(i = 0; ; i++){
			
				System.out.print("정수를 입력하세요 : " );
			a = scan.nextInt();
			if(a >= 0) {
				System.out.println(a);
			
		}else {
			break;
		}
		}
		*/
		
		//scan.close();
	}

}
