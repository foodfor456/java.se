package day11;

import java.util.Scanner;

public class Ex6_Program_Student {

	public static void main(String[] args) {
		/* 학생 정보(이름, 학년, 반, 번호, 국어, 영어, 수학 성적)를 관리하는 프로그램을 작성하세요.
		 * 1. 스캐너를 가져옴
		 * 2. 학생 별로 관리할 배열 선언
		 * 3. 학생 이름 String student로 스캐너 생성
		 * 4. 학년, 반, 번호 int로 받음. int grade, classNumber, numbe
		 * 5. 국어, 영어, 수학 성적 받는 정수 선언. int g, e, s;
		 * 6. 받은 성적 double로,
		 * 7. 반복문 for문 생성, 메인 메뉴 sysout,작성
		 * */
		//학생 정보(이름, 학년, 반, 번호, 국어, 영어, 수학 성적)를 관리하는 프로그램을 작성하세요.
		/* 1. 기능을 정리 =>주석
		 * 	-학생 정보 입력
		 * 		-학년, 반, 번호, 이름, 국어, 영어, 수학 성적을 한번에 입력받음.
		 * 		-입력한 학생정보를 저장.
		 * 	-학생 정보 출력
		 * 		-전체 학생의 학년, 반, 번호, 이름, 국어, 영어, 수학 성적을 출력
		 * 	-학생 정보 수정
		 * 		-학년, 반, 번호를 입력받음
		 * 		-입력받은 정보와 일치하는 학생이 있으면, 이름, 국어, 영어, 수학 성적을 전부 수정
		 * 	-학생 정보 삭제
		 * 		-학년, 반, 번호를 입력받음.
		 * 		-입력받은 정보와 일치하는 학생이 있으면, 삭제
		 * 	-프로그램 종료
		 * 2. 필요한 클래스가 있는지 확인하고, 있으면 만듦
		 * 	- 학생 클래스 : 이름, 학년, 반, 번호, 국어, 영어, 수학 성적
		 * 	- 기능 : 이름, 학년, 반, 번호, 국어, 영어, 수학성적 입력 받고 출력
		 * 		-학년, 반, 번호가 주어졌을 때 일치하는지 확인하는 기능.
		 * 		-주어진 이름, 국어, 영어, 수학점수로 수정하는 기능
		 * 	- 생성자 : 이름, 학년, 반, 번호, 국어, 영어, 수학 성적이 주어졌을 때 초기화하는 생성자.
		 * 
		 * 3. 기능을 구현
		 * 	- 클래스 정의 및 구현
		 * 	- 반복문을 이용하여 메뉴 출력 및 메뉴 선택*/
		Scanner scan = new Scanner(System.in);
		int grade,classNum,num,kor,eng,math,menu = 0;
		String name;
		final int max = 30;
		Ex6_Student2 std[] = new Ex6_Student2[max];
		for(int st = 0 ; menu != 5;) {
			menu = selectMenu(scan);
			switch(menu) {
			case 1: 
				//학년, 반, 번호, 이름, 국어, 영어, 수학 점수를 입력
				System.out.print("이름을 입력해주세요 : ");
				name = scan.next();
				System.out.print("학년을 입력해주세요 : ");
				grade = scan.nextInt();
				System.out.print("반을 입력해주세요 : ");
				classNum = scan.nextInt();
				System.out.print("번호를 입력해주세요 : ");
				num = scan.nextInt();
				System.out.print("국어 점수를 입력해주세요 : ");
				kor = scan.nextInt();
				System.out.print("영어 점수를 입력해주세요 : ");
				eng = scan.nextInt();
				System.out.print("수학 점수를 입력해주세요 : ");
				math = scan.nextInt();
			
				//Ex6_Student의 생성자를 이용하여 객체를 생성한 후 index번지에 저장
				//st를 1증가
				std[st]=new Ex6_Student2(name, grade, classNum, num, kor, eng, math);
				st++;
				break;
		case 2: 
			//향상된 for문은 아직 기록하지 않은 
			//비어있는 null index까지 불러오기 때문에 에러 발생
			for(int i = 0; i < st ; i++) {
					std[i].print();
					}
				break;
			case 3: 
				System.out.print("학년을 입력해주세요 : ");
				grade = scan.nextInt();
				System.out.print("반을 입력해주세요 : ");
				classNum = scan.nextInt();
				System.out.print("번호를 입력해주세요 : ");
				num = scan.nextInt();
				for(int i = 0 ; i < st; i++) {
				if(std[i].equal(grade, classNum, num)) {
					System.out.print("이름을 입력해주세요 : ");
					name = scan.next();
					System.out.print("국어 점수를 입력해주세요 : ");
					kor = scan.nextInt();
					System.out.print("영어 점수를 입력해주세요 : ");
					eng = scan.nextInt();
					System.out.print("수학 점수를 입력해주세요 : ");
					math = scan.nextInt();
					std[i].modify(name, kor, eng, math);
					break;
					}
				}
				System.out.println("등록된 학생이 아닙니다.");
				break;
				
			case 4: 
				//학년, 반, 번호를 입력
				System.out.println("삭제할 학생 정보를 입력하세요(학년, 반, 번호) : ");
				grade = scan.nextInt();
				classNum = scan.nextInt();
				num = scan.nextInt();
				int i , j = 0 ; //삭제할 학생 정보의 번지 배열이 가질수 없는 음수중에 가장 큰 수 -1;
				for(i = 0 ; i < st; i++) {
					if(std[i].equal(grade, classNum, num)) {
						j = i;
						break;
						}
					}
				if(j >= 0) {
					for( ; j < st-1 ; j++) {
						std[j]=std[j+1];
					}
					st--;
				}else {
					System.out.println("등록된 학생이 아닙니다.");
				}
				
				//반복문을 이용하여 0번지부터 index명의 학생을 비교하여 일치하는 학생 정보가 있으면 delIndex번지인지 기억하고 반복문을 종료
				//delIndex가 0이상이면 반복문을 이용하여 delIndex번지부터 index-1번지까지 다음번지에 있는 정보를 현재 번지에 저장
				//delIndex가 0이상이면 index를 1감소
				//delIndex가 0미만이면 등록된 학생이 아닙니다를 출력
				break;
			case 5: break;
			default : System.out.println("다시 입력해주세요.");
			}
		}
		
		
		
	}
	/* 기능 : 메뉴를 출력하고 메뉴를 입력하고 입력한 메뉴를 돌려주는 메소드
	 * 매개변수 : 입력받기 위한 Scanner => Scanner scan
	 * 리턴타입 : 입력한 메뉴 정수 => int 
	 * 메소드명 : selectMenu*/
	public static int selectMenu(Scanner scan) {
		System.out.println("메뉴\n1.학생 정보 입력\n2.학생 정보 출력\n3.학생 정보 수정\n4.학생 정보 삭제\n5.프로그램 종료");
		int menu = scan.nextInt();
		return menu;
	}
}
