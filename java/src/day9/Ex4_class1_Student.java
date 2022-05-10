package day9;

public class Ex4_class1_Student {
	
	public static void main(String[] args) {
		HighSchoolStudent std = new HighSchoolStudent("운호", "전일규" , 1, 10, 23,1);
		std.print();
	}
	//고등학생 클래스에 필요한 필드를 주석으로 써 보고 선언해보세요.
	
}

class HighSchoolStudent{
	//필드 : HighSchool class 정수 값 => int class1
	//필드 : 학교이름, 이름, 학년, 반, 번호, 국어, 영어, 수학
	String schoolName;
	String Name;
	int grade;
	int classNumber;
	int number;
	int kor;
	int eng;
	int math;
	void print() {
		System.out.println(" 고등학교 : " + schoolName);
		System.out.println(" 이름 : " + Name);
		System.out.println(" 학년 : " + grade);
		System.out.println(" 학반 : " + classNumber);
		System.out.println(" 번호 : " + number);
		System.out.println(" 번호 : " + kor);
	
	}
	public HighSchoolStudent(String schoolName, String name, int grade, int classNumber, int number, int kor) {
		this.schoolName = schoolName;
		Name = name;
		this.grade = grade;
		this.classNumber = classNumber;
		this.number = number;
		this.kor = kor;
	}
}
