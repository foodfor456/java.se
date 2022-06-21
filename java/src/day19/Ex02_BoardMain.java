package day19;

import java.util.*;


public class Ex02_BoardMain {
	static Board str = new Board();
	static List list = new ArrayList();
	static Scanner scan = new Scanner(System.in);
	public static void main(String[] args) {
		final int exitMenu = 4;
		int menu;
		do{
			System.out.print("qq : ");
			menu = scan.nextInt();
			selectMenu(menu,scan,list);
		}while(menu != exitMenu);
	scan.close();
	}
	public static void selectMenu(int menu, Scanner scan, List<Board>list) {
		
		switch(menu){
		case 1: 
			str = new Board(null, null, null, null);
			str.inputList(scan);
			list.add(str);
			break;//작성
		case 2: 
			//리스트에서 게시글을 하나씩 꺼내서 출력
			if(printList(list, scan)) {
				searchPrint(scan,list);
			}
		break;//출력
		case 3: 
			printList(list, scan);
			modifyList(scan, list);
			
			break;//수정
		
		case 4: break;//종료
			default: return;
		}
	}
	public static boolean printList(List<Board> list, Scanner scan) {
		if(list.size() == 0){
			System.out.println("게시글이 없습니다.");
			return false;
		}
		for(Board tmp : list) {
			System.out.println(tmp);
			
		}
		return true;
	}
	public static void searchPrint(Scanner scan, List<Board> list) {
		System.out.print("확인할 게시글 번호 : ");
		Integer num = scan.nextInt();
		if(list.contains(new Board (num))) {
			int index = list.indexOf(new Board (num));
			list.get(index).detailPrint();
			}
		else {
			return;
		}
	}
	public static void modifyList(Scanner scan, List<Board> list) {
		System.out.print("확인할 게시글 번호 : ");
		Integer num = scan.nextInt();
		System.out.println("제목 입력 : ");
		String title = scan.next();
		System.out.println("내용 입력 : ");
		String contents = scan.next();
		if(list.contains(new Board (num))) {
			int index = list.indexOf(new Board (num));
			list.get(index);
			str.modify(title,  contents);
			}
		else {
			return;
		}
	}
}
