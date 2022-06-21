package day23;

import java.util.*;

import day22.Score;

public class Ex01_UpdownGame {
	static Scanner scan = new Scanner (System.in);
	static List<User> list = new ArrayList<User>();
	static final int MIN = 1, MAX = 100;
	public static void main(String[] args) {
		/* - 1 ~ 100사이의 랜덤한 수를 맞추는 Up Down 게임 프로그램을 작성하세요.
		 * - 기록을 저장하는 기능을 추가.
		 * - 기록은 최대 5등까지.
		 * - 5등이내의 기록은 이름을 기록하여 저장.
		 * 1. 플레이
		 * 2. 기록확인
		 * 3. 종료
		 * */
		int menu;
		do {
			menu = selectMenu();
			excute(menu);
		}while(menu != 3);
	}
	public static int selectMenu() {
		System.out.println("메뉴");
		System.out.println("1. 플레이");
		System.out.println("2. 기록확인");
		System.out.println("3. 종료");
		System.out.print("메뉴를 입력하세요 : ");
		return scan.nextInt();
	}
	public static void excute(int menu) {
		switch(menu) {
		case 1:
			//플레이
			userAdd(gamePlay());
			break;
		case 2:
			printScore();
			break;
		case 3:
			System.out.println("종료합니다.");
			break;
		default :	
		}
	}
	public static int gamePlay() {
		int r = (int) (Math.random()*(MAX - MIN + 1) + MIN);
		System.out.println(r);
		System.out.println("게임 번호가 생성 되었습니다.");
		int count = 0;
		do {
			System.out.println("1 ~ 100사이의 정수를 입력해주세요.");
			int user = scan.nextInt();
			count++;
			if(user > 100 || user < 0) {
				System.out.println("1 ~ 100사이의 정수를 입력해야 합니다. 다시 입력하세요.");
				scan.nextLine();
				count--;
			}else if(user == r) {
				System.out.println("정답입니다.");
				return count;
			}else if(user > r) {
				System.out.println("U p");
			}else if(user < r){
				System.out.println("Down");
			}
		}while(true);
	}
	public static void userAdd(int count) {
		String user = null;
		User us = new User(count, user);
		if(list.size() < 5) {
			System.out.print("기록할 이름을 입력하세요 : ");
			us.setUser(scan.next());
			list.add(us);
			list.sort(new Comparator<User>() {
				@Override
				public int compare(User u1, User u2) {
				return u1.getCount() - u2.getCount();
				}
			});
		}
		else if(list.size() == 5) {
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getCount() > count) {
				System.out.print("기록할 이름을 입력하세요 : ");
				us.setUser(scan.next());
				list.add(i, us);
				list.remove(5);
				}
			}
		}
	}
	public static void printScore() {
		if(list.size() == 0) {
			System.out.println("기록이 없습니다.");
		}else {
		for(int i = 0; i < list.size(); i++) {
				System.out.println(i + 1 + "등 : " + list.get(i));
		}
		}
	}
}
