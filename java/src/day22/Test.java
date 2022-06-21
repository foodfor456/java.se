package day22;

import java.util.*;

public class Test {
	static List<Test_Manager> list = new ArrayList<Test_Manager>();
	static Scanner scan = new Scanner(System.in);
	public static void main(String[] args) {
		System.out.print("메뉴를 입력하세요 : ");
		int menu = scan.nextInt();
		do {
			selectMenu(menu);
		}while(menu !=4);
		
	}
	public static void selectMenu(int menu) {
		switch(menu) {
		case 1: addScore();
			break;
		
		case 2: break;
		case 3: break;
		case 4: break;
		default :
		}
	}
	public static void addScore(){
		Test_Manager std = new Test_Manager();
		int smes, classNum;
		String subject;
		System.out.print("학년, 학기를 입력해주세요. : ");
		smes = scan.nextInt();
		classNum = scan.nextInt();
		for(int i = 0; i < list.size(); i++) {
			if(list.contains(std.getClassNum()) && list.contains(std.getSmes())) {
				System.out.println("이미 입력한 정보 입니다.");
				return;
			}
		}
		String std2[] = new String[3];
		for(int i = 0; i < 3; i ++) {
		if(smes <= 2 ) {
			System.out.print("추가할 과목을 입력해주세요.(3과목 까지) : ");
			subject = scan.next();
			std2[i] = subject;
			
		}
		}
		for(String tmp : std2) {
			System.out.println(tmp);
		}
			//int kor, int eng, int math, String name, String[] subject
		
		//list.add(std);
		//성적 추가 국어, 영어, 수학
		//1학년 중간고사, 기말고사
		
	}
	
	
}
