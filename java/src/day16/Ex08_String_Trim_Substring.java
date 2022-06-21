package day16;

public class Ex08_String_Trim_Substring {

	public static void main(String[] args) {
		//trim = 앞 뒤 공백 제거 (맨 앞 맨 뒤
		String str = "\t\t\n\nabcefg\n\n";
		System.out.println(str);
		System.out.println("-----------------");
		str = str.trim();
		System.out.println(str);
		
		//substring
		str = str.substring(1);	  //1번지 부터 끝까지 부분 문자열 리턴
		System.out.println(str);
		str = str.substring(1,3); //1번지 부터 3번지 전까지(2번지까지) 부분 문자열 리턴.
		System.out.println(str);
	}

}
