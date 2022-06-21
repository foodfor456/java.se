package day17;

import java.text.DecimalFormat;
import java.text.MessageFormat;

public class Ex05_Format {

	public static void main(String[] args) {
		//금액이 저장된 변수를 ,를 이용하여 표현하는 예제
		int num = 1230000;
		DecimalFormat format = new DecimalFormat("# , ###");
		String numStr = format.format(num);
		System.out.println(numStr + "원");
		
		//월에서 1~9월이면 앞에 0을 붙이는 예제
		int month = 10;
		format = new DecimalFormat("00");
		String monthStr = format.format(month);
		System.out.println(monthStr + "월");
		
		//회원 아이디, 이름, 번호
		String id = "abc";
		String name = "홍길동";
		String number = "010-1234-5678";
		String user1 = "아이디 : " + id + ", 이름 : " + name + ", 번호 : " + number;
		System.out.println(user1);
		String msFormat = "아이디 : {0}, 이름 : {1}, 번호 : {2}";
		String user2 = MessageFormat.format(msFormat, id, name, number);
		System.out.println(user2);
		Object objs[] = {"abc", "홍길동", "010-1234-5678"};
		String user3 = MessageFormat.format(msFormat, objs);
		System.out.println(user3);
	}

}
