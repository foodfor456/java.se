package day23_1;

import java.util.*;

public class Ex01_UpDownGame {

	public static void main(String[] args) {
		Scanner scan = new Scanner (System.in);
		int menu;
		int min = 1, max = 100;
		List<Record> list = new ArrayList<Record>();
		list.add(new Record(3, "일길동"));
		list.add(new Record(5, "이길동"));
		list.add(new Record(6, "삼길동"));
		list.add(new Record(11, "사길동"));
		list.add(new Record(14, "오길동"));
		do {
			System.out.println("1.플레이");
			System.out.println("2.기록확인");
			System.out.println("3.종료");
			System.out.print("메뉴 선택 : ");
			menu = scan.nextInt();
			
			switch(menu) {
			case 1:
				//게임 플레이
				//랜덤한 수 생성
				int r = (int)(Math.random()*(max - min + 1) + min);
				System.out.println(r);
				int count = 0; //시도 횟수
				//맞출때까지 게임반복
				while(true) {
				//숫자를 입력 받아서, 비교
					System.out.print("정수 입력 (1~100) : ");
					int num = scan.nextInt();
					count++;
					if(num > r) 
						System.out.println("down");
					else if(num < r)
						System.out.println("UP");
					else
						break;
				}
				System.out.println("정답입니다.");
				//새 기록이면 (5등 이내이면)
				//list size(5);
				int i;
				for(i = 0; i < list.size(); i++) {
					if(list.get(i).getCount() > count) {
						break;
					}
				}
				//list.size() < 5 : 저장된 기록이 5개 미만.
				//i < list.size() : 저장된 기록이 5개 이상 중 지금 플레이한 횟수가
				//					등수에 포함될 때
				//					위에서 break가 동작하면 i는 list.size()보다 작고
				//					break가 동작 안하면 i는 list.size()
				if(list.size() < 5 || i < list.size()) {
					System.out.println("새로운 기록이 달성 됐습니다.");
					System.out.print("이름 : ");
					
					list.add(i, new Record(count, scan.next()));
					list = list.subList(0, list.size() > 5 ? 5 : list.size());
					
					/*if(list.size() > 5) {
						
					}*/
				}
				break;
			case 2:
				//기록 확인
				for(int j = 0; j < list.size(); j++) {
					System.out.println(j + 1 + ". " + list.get(j));
				}
				break;
			case 3:
				//프로그램 종료
				System.out.println("프로그램 종료");
				break;
			default:	
			}
		}while(menu != 3);
		scan.close();
	}
}
class Record{
	private int count;
	private String name;
	public Record(int count, String name) {
		super();
		this.count = count;
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	@Override
	public String toString() {
		return "[" + name + " : " + count + "]";
	}
	
	
}