package day20;

import java.util.*;

public class Ex01_1_Test {
	static List<String> list = new ArrayList<String>();
	static Scanner scan = new Scanner(System.in);
	public static void main(String[] args) {
		int menu = 0; 
		 while(menu != 4) {
			 try {	menu = selectMenu();
				excute(menu);
				}catch(Exception e) {
					System.out.println("잘못입력하셨습니다. 다시 입력하세요.");
					scan.nextLine();
			}
		}
	}
	public static int selectMenu(){
		System.out.print("메뉴\n1.파일 저장\n2.파일 확인\n3.파일 검색\n4.프로그램 종료\n메뉴 선택 : ");
		int menu = scan.nextInt();
		return menu;
	}
	public static void excute(int menu) {
		switch(menu){
		case 1:
			addFile();
			break;
		case 2: 
			fileCheck();
			break;
		case 3: 
			searchFile();
			break;
		case 4: 
			System.out.println("프로그램을 종료합니다.");
			break;
		default : System.out.println("잘못된 메뉴입니다.");
		}
	}
	public static void addFile() {
		System.out.print("저장할 파일명을 입력해주세요(test.txt) : ");
		String fileName = scan.next();
		list.add(fileName);
		System.out.println("파일명 :" + fileName);
		System.out.println("파일 저장이 완료되었습니다.");
	}
	public static void fileCheck() {
		for(String tmp : list) {
			System.out.println(tmp);
		}
	}
	public static void searchFile() {
		System.out.print("찾을 파일명을 입력해주세요 : ");
		String sf = scan.next();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).indexOf(sf) != -1) {
				System.out.println("검색한 파일 : " + list.get(i));
			}
		}
	}
}
