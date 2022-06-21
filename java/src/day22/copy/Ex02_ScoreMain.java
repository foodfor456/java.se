package day22.copy;

import java.util.Scanner;

public class Ex02_ScoreMain {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		ScoreManager sm = new ScoreManager(scan);
		sm.run();
		scan.close();
	}

}
