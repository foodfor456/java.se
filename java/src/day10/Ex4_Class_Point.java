package day10;

import java.util.Scanner;

public class Ex4_Class_Point {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int num = 0;
		int num2[]= new int [3];
		Point3D1 pt = new Point3D1(num2);
		//pt.Point(1, 3, 2);
		/* 아래와 같이 출력되도록 코드를 작성하세요.
		 * 메뉴
		 * 1. 좌표설정
		 * 2. 좌표출력
		 * 3. 종료
		 * 메뉴 선택 : 1
		 * 좌표를 입력하세요 (예: 1 2 3) : 1 2 3
		 * 메뉴 */
		for ( ; ; ) {
			System.out.println("메뉴\n1.좌표설정\n2.좌표출력\n3.종료\n메뉴 선택");
			num = scan.nextInt();
			switch(num) {
			case 1 : 
				for(int i = 0;i<num2.length;i++) {
					System.out.println("좌표를 입력해주세요 (예: 1 2 3) :");
					num2[i] = scan.nextInt();
				}
			break;
			case 2 : pt.print(); 
			break;
			case 3 : System.out.println("종료합니다.");
			break;
			default : System.out.println("잘못된 메뉴입니다.");
			break;
			
			}
			
		}
		
	}

}


/* 3차원에서 점을 나타내는 클래스를 생성하세요. 
 * 점 x, 점 y, 점 z
 * 기능 : 좌표를 출력하는 기능
 * */
 
class Point3D1{
	int x, y, z;
	
public void Point(int x , int y , int z) {
	this.x=x;
	this.y=y;
	this.y=y;
}
public void print(){
	System.out.println("(" + x + "," + y + "," + z + ")");
	}
	public Point3D1(int []arr) {
		if(arr.length >= 1) {
			x = arr[0];
		}
		if(arr.length >= 2) {
			y = arr[1];
		}
		if(arr.length >= 3) {
			z = arr[2];
		}
	}
}

