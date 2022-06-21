package day18_1;

import java.util.*;

public class Ex02_BoardMain {

	public static void main(String[] args) {
		/*
		 * 반복 : 종료 메뉴를 선택할 때 까지
		 * 
		 * 콘솔창에 메뉴 출력
		 * 
		 * 실행할 메뉴를 콘솔에서 입력 받음.
		 * 
		 * 입력받은 메뉴에 맞는 기능을 실행.
		 * 
		 * 		1번 메뉴를 선택 : 게시글 등록 기능을 실행.
		 * 			타입 입력
		 * 			제목 입력
		 * 			내용 입력
		 * 			작성자 입력
		 * 			게시글 생성 후 저장
		 * 
		 * 		2번 메뉴를 선택 : 게시글 확인 기능을 실행. 
		 * 			전체 게시글 확인
		 * 			게시글 선택
		 * 			게시글 상세 확인
		 * 
		 * 		3번 메뉴를 선택 : 게시글 수정 기능을 실행.
		 * 			전체 게시글 확인
		 * 			게시글 선택
		 * 			게시글 제목 입력
		 			게시글 내용 입력
		 			게시글 수정
		 			
		 * 		4번 메뉴를 선택 : 프로그램을 종료
		 			
		 * 		그외 메뉴를 선택 : 콘솔에 알림창 출력
		 **/
		//게시글 리스트 : 게시글을 담을 공간.
		List<Board> list = new ArrayList <Board>();
		//콘솔에서 입력받기 위한 스캐너
		Scanner scan = new Scanner(System.in);
		int exitMenu = 4;
		int menu;
		//게시글 등록, 확인, 수정시에 임시로 사용할 변수/참조변수
		list.add(new Board("일반", "제목", "내용", "홍길동"));
		
		String title, content, writer, type;
		int num, view;
		do {
			// 콘솔창에 메뉴 출력
			System.out.println("메뉴");
			System.out.println("1. 게시글 등록");
			System.out.println("2. 게시글 확인");
			System.out.println("3. 게시글 수정");
			System.out.println("4. 프로그램종료");
			System.out.print("메뉴 선택 : ");
			// 실행할 메뉴를 콘솔에서 입력 받음.
			menu = scan.nextInt();
			//입력받은 메뉴에 맞는 기능을 실행.
			switch(menu) {
			case 1:
				//1번 메뉴를 선택 : 게시글 등록 기능을 실행.
				System.out.println("게시글 정보를 입력하세요.");
				//타입입력
				System.out.print("타입 [일반, 공지] : ");
				type = scan.next();
				scan.nextLine();
	 			//제목 입력
				System.out.print("제목 : ");
				title = scan.next();
				//내용 입력
				System.out.print("내용 : ");  			
				content = scan.next();
				
				//작성자 입력
				System.out.print("작성자 : ");  			
				writer = scan.next();
				//게시글 생성 후 저장 (리스트에 생성한 게시글을 추가)
				list.add(new Board(type, title, content, writer));
				
				break;
			case 2:
				System.out.println("번호\t타입 \t제목 \t 작성자 \t 작성일 \t\t 조회수");
				for(Board tmp : list) {
					System.out.println(tmp);
				}
				//게시글 선택
				System.out.print("게시글 선택[나가기 : -1] : ");
				num = scan.nextInt();
				//게시글 상세 확인
				if(num >= 0) {
					//list에서 게시글을 가져옴(num -1번지)
					Board tmp = list.get(num-1);
					//조회수 증가. 
					tmp.updateView();
					//가져온 게시글의 상세 내용을 확인 : detailPrint()를 호출
					tmp.detailPrint();// . 은 체이닝 기법
				}
				break;
			case 3:
				//전체 게시글 확인
				//게시글 선택
				//게시글 제목 입력
				//게시글 내용 입력
				//게시글 수정
				System.out.println("번호\t타입 \t제목 \t 작성자 \t 작성일 \t\t 조회수");
				for(Board tmp : list) {
					System.out.println(tmp);
				}
				System.out.print("게시글 선택 : ");
				num = scan.nextInt();
				scan.nextLine();
				System.out.print("제목 : ");
				title = scan.next();
				System.out.print("내용 : ");
				content = scan.next();
				Board tmp = list.get(num-1);
				//가져온 게시글을 수정 : modify를 호출
				tmp.modify(title, content);
				/* List의 set을 이용 안한 이유 : 안해도 가능하기 때문에
				 * List의 get을 이용하여*/
				
				break;
			case 4:
				break;
			default:
			}
			
		}while(menu != exitMenu);
		
		
		scan.close();
	}

}
