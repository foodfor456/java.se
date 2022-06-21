package day17;

import java.util.*;

public class Ex12_Set_Lotto {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Set<Integer> set = new HashSet<Integer>();
		for(int i = 0; i < 6;) {
			if(set.add((int)(Math.random()*(45 - 1) + 1))){
				i++;
			}
		}
		System.out.println(set);
		Iterator<Integer> it = set.iterator();
		while(it.hasNext()) {
			Integer tmp = it.next();
			System.out.print(tmp + " ");
		}
		System.out.println();
		//구매한 로또
		Set<Integer>user = new HashSet<Integer>();
		/* 스캐너를 이용하여 정수 6개를 입력받음. 중복되지 않은 숫자 6개를 입력할때까지. 범위는 로또와 같음.
		 * */
		
		while(user.size() < 6) {
			System.out.print("정수를 입력해주세요 : ");
			int userNum = scan.nextInt();
			if (userNum <= 45 && userNum >= 1) {
				user.add(userNum);
				}
			}
		System.out.println(user);
		Iterator<Integer> it2 = user.iterator();
		int count = 0;
		for(Integer tmp : set) {
			if (user.contains(tmp)) {
				count++;	
			}
			}
			System.out.println(count);
		
	}
	
	
	
		}
	
	

