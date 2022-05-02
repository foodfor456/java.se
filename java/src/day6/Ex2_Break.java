package day6;

public class Ex2_Break {

	public static void main(String[] args) {
		/* 
		 * 
		 * 
		 * */
		
		System.out.println("---------------");
		int i , j;
		//break out이라고 적었을 시 이 위치로 이동.
		out:for(i=1;i<=5;i++) {
			for(j=1;j<=5;j++) {
				System.out.println(i+ ", " + j);
				if(j==3) {
					break out;
				}
			}
			//break를 만나면 이 위치로 이동.
		}

		
		
	}

}
