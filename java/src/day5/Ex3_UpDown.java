package day5;

import java.util.Scanner;

public class Ex3_UpDown {

	public static void main(String[] args) {
		/* 랜덤으로 생성한 수(1~100)를 맞추는 게임을 작성하세요.
		 * 정수를 입력했을 때 입력한 정수보다 랜덤으로 생성된 수가 크면 Up,작으면 Down 표시
		 * 맞으면 맞췄습니다. 라고 표시.
		 * 랜덤으로 생성한 수가 : 40
		 * 입력 : 100 
		 * DOWN
		 * 입력 : 50
		 * DOWN
		 * 입력 : 25
		 * UP
		 * 입력 : 40
		 * 정답입니다.
		 * 반복횟수 : 무한대
		 * 규칙성 : 정수를 입력받고,
		 * 			입력받은 정수 num가 랜덤한수 r과 같으면 정답입니다. 라고 출력한 후 반복문을 빠져나가고,
		 * 			입력받은 정수 num가 랜덤한수 r과 같지 않고 r보다 크면 Down라고 출력하고,
		 * 			입력받은 정수 num가 랜덤한수 r과 같지 않고 r보다 크지 않으면 Up 라고 출력
		 * */
		Scanner scan = new Scanner(System.in);
		
		int min = 1, max = 100;
		int r;
		//1미만 100초과인 경우 스킵
		
		r = (int)(Math.random() * (max-min+1) + min);
		while(true) {
			//정수를 입력 받고,
			System.out.println("1~100사이의 정수를 입력 하세요 : ");
			int num = scan.nextInt();
			//입력받은 정수 num가 랜덤한수 r과 같으면 정답입니다. 라고 출력한 후 반복문을 빠져나가고,
			if(num == r) {
				System.out.println("정답입니다.");
				break;
			//if(num < 1 || num >100) {
				//	continue;
				//}
			}
			//입력받은 정수 num가 랜덤한수 r과 같지 않고 r보다 크면 Down라고 출력하고,
			else if(num > r) {
				System.out.println("DOWN");
			}
			//입력받은 정수 num가 랜덤한수 r과 같지 않고 r보다 크지 않으면 Up 라고 출력
			else {
				System.out.println("UP");
			}
		}
		
		
		
		
		
		/*int min = 1, max = 100;
		int r;
		r = (int)(Math.random() * (max-min+1) + min);
		
		for(int i=0;  ;) {
			System.out.println("정수 값을 입력 하세요 : ");
			int num = scan.nextInt();
			if(num == r) {
			System.out.println(num + "는 정답입니다.");
			break;
			}else if(num < r){
				System.out.println(num + "는 Down");
			}else {
				System.out.println(num + "는 Up");
			}
		}
		*/
		
	}

}
