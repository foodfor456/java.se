package day16;

public class Ex09_String_EndWith {

	public static void main(String[] args) {
		/* 다음과 같이 파일이름이 주어졌을 때 파일 이미지인지 아닌지 구별하는 코드를 작성하세요.
		 * 파일 확장자가 .jpg, .png, .bmp인 경우 이미지로 판별*/
		String fileName = "testjpg.jpg.jpg";
		int index = fileName.lastIndexOf(".");
		fileName = fileName.substring(index);
		//switch문을 이용하여 
		if(index != -1) {
			switch(fileName) {
			case ".jpg":  case ".png":  case ".bmp": 
				System.out.println(fileName + "는 이미지 파일입니다."); break;
			default : System.out.println("이미지 파일이 아닙니다.");
			}	
		}else {
			System.out.println("이미지 파일이 아닙니다.");
		}
		//endwith를 이용하여
		String img[] = {"jpg", "png", "bmp"};
		
		if(index != -1) {
			String endwith = fileName.substring(index+1);
			int i;
			for(i = 0; i < img.length; i++) {
				if(img[i].equals(endwith)) {
					break;
				}
			}
			if(i < img.length) {
				System.out.println(fileName + "는 이미지 파일입니다.");
			}else {
				System.out.println("이미지 파일이 아닙니다.");
			}
		}else {
			System.out.println("이미지 파일이 아닙니다.");
		}
		
		String img2[] = {".jpg", ".png", ".bmp"};
		int i;
		//문자열1.endWith(문자열2) : 문자열1이 문자열2로 끝나는지 알려줌 (참/거짓)
		for(i = 0; i < img2.length; i++) {
			if(fileName.endsWith(img2[i])) {
				break;
			}
		}
		if(i < img2.length) {
			System.out.println(fileName + "는 이미지 파일입니다.");
		}else {
			System.out.println("이미지 파일이 아닙니다.");
		}
		//substring을 이용하지 않고 이미지 찾기.
		int length = fileName.length();
		for(i = 0; i < img.length; i++) {
			index = fileName.lastIndexOf(img2[i]);
			if(index == length - img2[i].length()) {
			}
		}
		if(i < img2.length) {
			System.out.println(fileName + "는 이미지 파일입니다.");
		}else {
			System.out.println("이미지 파일이 아닙니다.");
		}
		
		
	}

}
