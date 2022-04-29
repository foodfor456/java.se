package day5;

public class Ex10_NestedLoop4_Alphabet {

	public static void main(String[] args) {
		/* a					'a'부터 'a'까지
		 * ab					'a'부터 'b'까지
		 * abc
		 * ...
		 * abcdefg...xyz		'a'부터 'z'까지
		 * 
		 * 반복횟수 : end는 'a'부터 'z'까지 1씩 증가
		 * 규칙성 : ch는 'a'부터 end까지 1씩 증가하며 ch를 출력.
		 * 
		 * */
		for(char i = 'a'; i<='z' ; i++ ) {
			for(char j='a'; j<=i ; j++ ) {
				System.out.print(j);
				
			}
			System.out.println();
			
		}
		for(char i = 'a'; i<='z' ; i++ ) {
			for(char j='a'; j<=i ; j++ ) {
				System.out.print(" ");
				for(char o = 'a'; o<=i ; o++) {
				System.out.println(o);
				}
			}
			System.out.println();
			
		}
		for(int i = 1; i<=5 ; i++ ) {
			for(int j = 1; j <= 5 - i; j++) {
				System.out.print(" ");
			}
			for(int o = 1; o <= i; o++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
	}

}
