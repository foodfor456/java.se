package kr.green.hand.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	//board
	private int bd_num;
	private String bd_title;
	private String bd_content;
	private Date bd_date;
	private int bd_views;
	private String bd_me_id;
	private int bd_bc_num;
	
	//게시글 타입(대분류)
	private String bt_name;
	
	//게시글 카테고리
	private int bc_num;
	private String bc_name; 
	private String bc_bt_name;
	
	// 지역 분류
	 // 시
	private String rg_name;
	
	 // province 도
	private String pv_name;
	
	
	
	// 지역 게시판
	private int rb_num;
	private String rb_rg_name; 
	private int rb_bd_num;
	
	public String getBd_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(bd_date);
	}
}
