package day7;

import java.util.Calendar;
import java.util.Scanner;

public class Ex9_Enum {

	public static void main(String[] args) {
		// 열거타입
		// 오늘이 무슨 요일인지 확인하는 예제
		Calendar now = Calendar.getInstance();
		int week = now.get(Calendar.DAY_OF_WEEK);
		Week today = Week.MONDAY;
		switch(week) {
		case 1: today = Week.MONDAY; break;
		case 2: today = Week.TUESDAY; break;
		case 3: today = Week.WEDNESDAY; break;
		case 4: today = Week.THURSDAY; break;
		case 5: today = Week.FRIDAY; break;
		case 6: today = Week.SATUDAY; break;
		case 7: today = Week.SUNDAY; break;
		}
		System.out.println(today);
	}
}
enum Week{
	MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATUDAY, SUNDAY
}