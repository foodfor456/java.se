package day16;

public class Ex12_StringBuilder {

	public static void main(String[] args) {
		StringBuilder sb1 = new StringBuilder();
		System.out.println(sb1);
		StringBuilder sb2 = new StringBuilder("Hello world");
		System.out.println(sb2);
		sb2.append("!"); //마지막에 !를 추가.
		System.out.println(sb2);
		sb2.insert(0, "Hi. "); //0번지에 Hi.을 추가. (내가 지정한 번지에 추가)
		System.out.println(sb2);
		sb2.insert(sb2.length(), "?"); //insert를 이용하여 append기능을 구현
		System.out.println(sb2);
		sb2.delete(0, 2);		//0번지부터 2번지전까지 삭제. (1번지까지 삭제)
		System.out.println(sb2);
		sb2.replace(0,0, "Hello"); //replace를 이용하여 insert처럼 구현
		System.out.println(sb2);
		System.out.println(sb2.reverse());
	}

}
