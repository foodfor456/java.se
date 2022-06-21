package day21;

import java.util.*;

public class Ex03_Lambda3 {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		list.add(12);
		list.add(60);
		list.add(25);
		list.add(10);
		list.add(100);
		list.add(30);
		list.add(26);
		
		list.sort(new Comparator<Integer>() {
			public int compare(Integer o1, Integer o2) {
				return o1 - o2;
				}
			});
		
		
		//list.sort((Integer a, Integer b) -> a-b);
		System.out.println(list);
		
	}

}
