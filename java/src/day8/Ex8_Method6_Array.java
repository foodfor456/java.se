package day8;

public class Ex8_Method6_Array {

	public static void main(String[] args) {
		int arr[] = new int[]{1,2,3,4,5};
		int num = 3;
		int i = 4;
		contains(arr,num,i);
		System.out.println(contains(arr,num,i));
		System.out.println(contains(arr,arr.length,i));
	}
	// 1 3 8 7 1 2
	/* 기능 : 정수형 배열이 주어졌을 때, 주어진 배열의 값을 콘솔에 출력하는 메소드
	 * 매개변수 : int num1[]
	 * 리턴타입 : 없음.
	 * 메소드명 : printArray
	 * */
	
	public static void printArray(int num[]) {
		if(num==null || num.length == 0) {
			System.out.println("출력할 배열이 없습니다.");
			return;
		}
		for(int i=0 ; i<num.length ; i++) {
		System.out.print(num[i] + " ");
		}
		System.out.println();
		
		
	}
	/* 기능 : 정수형 배열에 정수 num가 있는지 없는지 알려주는 메소드
	 * {1,2,3,4,5}에 6이 있는지 없는지 확인하여 있다 없다를 알려주는 메소드
	 * 매개변수 : 정수형 배열, 정수 num가 있는지 없는지
	 * 리턴타입 : 
	 * 메소드명 : contains
	 * */
	public static boolean contains(int arr[],int num){
		if(arr == null || arr.length == 0) {
			return false;
		}
		for(int tmp : arr) {
			if(tmp == num) {
			return true;
			}
		}
		return false;
		
		
		/*	int count = 0;
		for(int i = 0 ; i < num.length; i++) {
			if (num2 == num[i]){
			count++;
			}
			return num[count];}
	*/	
	}
	/* 기능 : 정수형 배열에서 처음부터 n개중에서 정수 num가 있는지 없는지 알려주는 메소드
	 * {1,2,3,4,5}에 6이 있는지 없는지 확인하여 있다 없다를 알려주는 메소드
	 * 매개변수 : 정수형 배열, 종료 지점
	 * 리턴타입 : fulse, true
	 * 메소드명 : contains
	 * */
	public static boolean contains(int arr[],int num, int i){
		//배열이 잘못되거나 비교 갯수가 잘못되서 비교할 필요가 없는 경우
		if(arr == null || arr.length == 0 || i < 0) {
			return false;
		}
		if(arr.length < i) {
			i = arr.length;
		}
		for(int j = 0; j < i ; j++ ) {
			if(arr[j] == num) {
			//count++;
			return true;
		}
		}
			return false;
		}
	}
