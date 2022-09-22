package kr.green.hand.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private String pr_code;
	private String pr_title;
	private String pr_content;
	private int pr_price; 
	private int pr_amount;
	private Date pr_date;
	private int pr_cs_num; 
	private String pr_me_id;
	
	public String getPr_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(pr_date);
	}
}
