package kr.green.hand.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyVO {
	// buy
	private String bu_code;
	private Date bu_date; 
	private String bu_send = "상품준비중";
	private String bu_me_name;
	private String bu_request; 
	private String bu_note;
	private String bu_me_id;
	private int bu_ad_num;
	private String pr_code;
	
	// address
	private int ad_num;
	private String ad_to;
	private String ad_phon;
	private String ad_post;
	private String ad_addr ;
	private String ad_addr_detail;
	
	// buydetail
	private String by_code;
	private int by_amount;
	private int by_price;
	private String by_state = "상품준비중"; 
	private String by_op_name;
	private String by_bu_code;
	private String by_pr_code;
	
	public BuyVO(String ad_to, String ad_phon, String ad_post, String ad_addr, String ad_addr_detail) {
		this.ad_to = ad_to;
		this.ad_phon = ad_phon;
		this.ad_post = ad_post;
		this.ad_addr = ad_addr;
		this.ad_addr_detail = ad_addr_detail;
	}

	public BuyVO(String bu_code, Date bu_date, String bu_send, String bu_request, String bu_note, String bu_me_id) {
		this.bu_code = bu_code;
		this.bu_date = bu_date;
		this.bu_send = bu_send;
		this.bu_request = bu_request;
		this.bu_note = bu_note;
		this.bu_me_id = bu_me_id;
	}
	
}
