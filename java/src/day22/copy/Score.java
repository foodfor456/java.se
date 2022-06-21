package day22.copy;

public class Score {
	private String name;
	
	private int midTerm, finals, performanceAssessment, grade, term;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMidTerm() {
		return midTerm;
	}

	public void setMidTerm(int midTerm) {
		if(midTerm < 0 || midTerm > 100)
			throw new RuntimeException("중간고사는 0~100 사이의 정수를 입력하세요.");
		this.midTerm = midTerm;
	}

	public int getFinals() {
		return finals;
	}

	public void setFinals(int finals) {
		if(finals < 0 || finals > 100)
			throw new RuntimeException("기말고사는 0~100 사이의 정수를 입력하세요.");
		this.finals = finals;
	}

	public int getPerformanceAssessment() {
		return performanceAssessment;
	}

	public void setPerformanceAssessment(int performanceAssessment) {
		if(performanceAssessment < 0 || performanceAssessment > 100)
			throw new RuntimeException("수행평가는 0~100 사이의 정수를 입력하세요.");
		this.performanceAssessment = performanceAssessment;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		if(grade < 1 || grade > 3)
			throw new RuntimeException("학년은 1~3 사이의 정수를 입력하세요.");
		this.grade = grade;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		if(term < 1 || term > 2)
			throw new RuntimeException("학기는 1~2 사이의 정수를 입력하세요.");
		this.term = term;
	}

	public Score(int grade, int term, String name, int midTerm, int finals, int performanceAssessment) {
		this(grade, term, name);
		setMidTerm(midTerm);
		setFinals(finals);
		setPerformanceAssessment(performanceAssessment);
		}
	public Score(int grade, int term, String name) {
		setGrade(grade);
		setTerm(term);
		this.name = name;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + grade;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + term;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Score other = (Score) obj;
		if (grade != other.grade)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (term != other.term)
			return false;
		return true;
	}

	@Override
	public String toString() {
		double total = midTerm * 0.4 + finals * 0.5 + performanceAssessment * 0.1;
		return grade + "학년 " + term + "학기 " + name + " [중간 : " + midTerm + ", 기말 : " + finals + ", 수행 : " 
				+ performanceAssessment + ", 총점 : " + total + "]";
	}
	
}
