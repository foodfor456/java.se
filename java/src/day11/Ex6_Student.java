package day11;

/* 학생 클래스를 작성하세요*/
public class Ex6_Student {
	private String name;
	private int grade, classNum, num, ko, en, met;
	
	public void print() {
		System.out.println("이름 : " + name);
		System.out.println("학년 : " + grade);
		System.out.println("반 : " + classNum);
		System.out.println("번호 : " + num);
		System.out.println("국어 성적 : " + ko);
		System.out.println("영어 성적 : " + en);
		System.out.println("수학 성적 : " + met);
	}
	public boolean va(int grade, int classNum, int num) {
		if(this.grade==grade && this.classNum==classNum && this.num==num) {
			return true;
		}else {return false;}
	}
	public Ex6_Student(String name, int grade, int classNum, int num, int ko, int en, int met) {
		this.name = name;
		this.grade = grade;
		this.classNum = classNum;
		this.num = num;
		this.ko = ko;
		this.en = en;
		this.met = met;
	}
	public void mod() {
	}
	
}
