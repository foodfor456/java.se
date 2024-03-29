package kr.green.hand.pagination;

import lombok.Data;

@Data
public class Criteria {
//현재 페이지
	private int page; 
	//한 페이지 당 컨텐츠 갯수
	private int perPageNum;
	//Criteria 디폴트 생성자 : 현재 페이지를 1페이지로, 한 페이지에 10개의 컨텐츠
	private String pr_waiting = "N";
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public int getPageStart() {
		
		return (this.page -1) * perPageNum;
	}
}
