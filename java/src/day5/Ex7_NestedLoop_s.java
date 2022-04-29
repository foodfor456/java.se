package day5;

public class Ex7_NestedLoop_s {

	public static void main(String[] args) {
		/* 아래와 같이 출력되도록 코드를 작성하세요.
		 * *
		 * **
		 * ***
		 * ****
		 * *****
		 * */
		
		for(int i = 1; i<= 5 ; i++) {
			for(int j= 1; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		/*     *		 i=1 " " = 4 * =1
		 *    ***		 i=1 " " = 4 * =3
		 *   *****		 i=1 " " = 4 * =5
		 *  *******		 i=1 " " = 4 * =7
		 * ********* 	 i=1 " " = 4 * =9
		 * 					 " " = ? * =?
		 * */
	}

}
