package day5;

public class Ex7_NestedLoop2 {

	public static void main(String[] args) {
		/* 아래와 같이 출력되도록 코드를 작성하세요.
		 * *
		 * **
		 * ***
		 * ****
		 * *****
		 * */
		
		
		/*for(i = 1; i <= 5 ; i++){
			 *을 i개 출력
			 * 
			 * 엔터
			 * 
			 * 
			for( j = 1 ; j <= i ; j++){
				System.out.print("*");	
			}
				System.out.println();
		}
	*/
		/* 아래와 같이 출력되도록 코드를 작성하세요.
		 *      *
		 *     **
		 *    ***
		 *   ****
		 *  *****
		 * */
		/*for (i = 5; i >= 1 ; i--) {
			for(j = 1 ; j <= i ; j--) {
				System.out.print(" ");
				for(j = 1; j <= i ; j++) {
					System.out.print("*");
				}
			}
			System.out.println("");
		}
		*/
		for (int i = 1 ; i <= 5; i++) {
			//공백 출력
			for(int j = 1 ; j <= 5 - i ; j++) {
				System.out.print(" ");
			}
			//*을 출력
			for(int j = 1 ; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println();
			//엔터 출력
		}
		
		/*     *		 i=1 " " = 4 * =1
		 *    ***		 i=1 " " = 4 * =3
		 *   *****		 i=1 " " = 4 * =5
		 *  *******		 i=1 " " = 4 * =7
		 * ********* 	 i=1 " " = 4 * =9
		 * 					 " " = ? * =?
		 * */
		
		
		for (int i = 1;i <= 5 ; i++) {
			for(int j = 1; j <= 5 - i; j++) {
				System.out.print(" ");
			}
			for(int j = 1; j <= i; j++) {
				System.out.print("*");
			}
			for(int j = 1; j <= i-1; j++) {
				System.out.print("*");
			}	
			System.out.println();
		}
		
		for (int i = 1; i <= 5 ; i++) {
			for(int j = 1; j <= 5 - i; j++) {
				System.out.print(" ");
			}
			for(int j = 1; j <= 2*i -1; j++) {
				System.out.print("*");
			}
			System.out.println();
		}	
	}

}
