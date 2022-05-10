package day10;

import java.util.Scanner;

public class Ex1_Class_RemoteController2 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		RemoteController2 rm = new RemoteController2(1, 10);
		int rmt = 0;
		/* 메뉴를 출력 후 메뉴에 맞는 기능을 동작하도록 코드를 작성하세요.
		 * 메뉴
		 * 1. 채널 UP
		 * 2. 채널 DOWN
		 * 3. 채널 변경
		 * 4. 볼륨 UP
		 * 5. 볼륨 DOWN
		 * 6. 전원
		 * 7. 종료
		 * 메뉴를 선택하세요 : 6
		 * TV를 켰습니다. */
		for(; rmt < 7;) {
			System.out.println("메뉴");
			System.out.println("1. 채널 UP");
			System.out.println("2. 채널 DOWN");
			System.out.println("3. 채널 변경");
			System.out.println("4. 볼륨 UP");
			System.out.println("5. 볼륨 DOWN");
			System.out.println("6. 전원");
			System.out.println("7. 종료");
			System.out.print("메뉴를 선택하세요 : ");
			rmt = scan.nextInt();
		switch(rmt) {
		case 1 : rm.channelUp(); break;
		case 2 : rm.channelDown(); break;
		case 3 : 
			System.out.print("채널을 입력해주세요 : ");
			int rmt2 = scan.nextInt();
			rm.channel(rmt2);
			break;
		case 4 : rm.volumUp(); break;
		case 5 : rm.volumDown(); break;
		case 6 : rm.turn(); break;
		case 7 : 
			System.out.println("종료합니다.");
			break;
		default : 
			System.out.println("잘못된 명령입니다.");
			rmt +=8;
			break;
			}
		}
		scan.close();
	}
}



/* TV 리모컨 클래스를 생성하고, 객체를 생성 후 기능들을 테스트해보세요. */
//필드 : 제품 브랜드, 채널 위아래, 음량, 전원, 채널 숫자 버튼 

class RemoteController2{
	boolean power;
	int channel;
	int volume;
	int minVolume = 0;
	int maxVolume = 32;
	int minChannel = 1;
	int maxChannel = 999;
	
	/* 기능 : TV를 켜는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : turnOn
	 * */
	void turnOnOn() {
		power = true;
		System.out.println("TV를 켰습니다. ");
	}
	/* 기능 : TV를 끄는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : turnOn
	 * */
	void turnOnOff() {
		power = false;
		System.out.println("TV를 껏습니다. ");
	}
	/* 기능 : Tv를 키거나 끄는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : turn*/
	void turn() {
		power = !power;
		if(power) {
			System.out.println("TV를 켰습니다. ");
		}else {
			System.out.println("TV를 껏습니다. ");
		}
			
	}
	/* 기능 : 소리를 한칸 올리는 기능
	 * 매개변수 : 없음
	 * 리턴타입 : 없음 => void
	 * 메소드명 : voilumUp*/
	void volumUp(){
		//전원이 켜져있고, 소리가 최대치가 아니면 1증가
		if(power) {
			if(volume < maxVolume) {
				volume++;	
			}
			System.out.println("소리 : " + volume);
		}
		
	}
	/* 기능 : 소리를 한칸 올리는 기능
	 * 매개변수 : 없음
	 * 리턴타입 : 없음 => void
	 * 메소드명 : voilumDown*/
	void volumDown(){
		//전원이 켜져있고, 소리가 최소치보다 크면 1감소
		if(power) {
			if(volume > minVolume) {
				volume--;
			}
			System.out.println("소리 : " + volume);
		}
	}
	/* 기능 : 채널을 1씩 증가하는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : channelUp*/
	void channelUp() {
		if(power) {
			if(channel < maxChannel) {
				channel++;
			}
			System.out.println("채널 : " + channel);
		}
	}
	/* 기능 : 채널을 1씩 감소하는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : channelUp*/
	void channelDown() {
		if(power) {
			if(channel > minChannel) {
				channel--;
			}
			System.out.println("채널 : " + channel);
		}
	}
	/* 기능 : 입력한 채널로 이동하는 메소드
	 * 매개변수 : 이동할 채널 => int ch
	 * 리턴타입 : 없음 => void
	 * 메소드명 : channel*/
	void channel(int ch) {
		if(power) {
			if(ch<minChannel) {
				channel = minChannel;
			}
			else if(ch > maxChannel) {
				channel = maxChannel;
			}else {
				channel = ch;
			}
			System.out.println("채널 : " + channel);
		}
	}
	public RemoteController2() {
		channel = minChannel;
		volume = minVolume;
	}
	public RemoteController2(int ch, int v) {
		if(ch>= minChannel && ch <= maxChannel) {
			this.channel = ch;	
		}else {
			channel = minChannel;
		}
		
		if(v >= minVolume && v <= maxVolume) {
			this.volume = v;
		}else {
			volume = minVolume;
		}
	}
	
}