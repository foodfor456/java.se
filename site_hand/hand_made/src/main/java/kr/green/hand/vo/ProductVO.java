package kr.green.hand.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {
	private String pr_code;
	private String pr_title;
	private String pr_content;
	private Integer pr_price; 
	private int pr_amount;
	private Date pr_date;
	private int pr_cs_num; 
	private String pr_me_id;
	private int pr_check = 0;
	private String pr_waiting = "N";
		
	public ProductVO(String pr_code, String pr_title, String pr_content, Integer pr_price, int pr_amount,
			String pr_me_id) {
		this.pr_code = pr_code;
		this.pr_title = pr_title;
		this.pr_content = pr_content;
		this.pr_price = pr_price;
		this.pr_amount = pr_amount;
		this.pr_me_id = pr_me_id;
	}
	public String getPr_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(pr_date);
	}
	public String getPr_price_str() {
		if(pr_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(pr_price) + " 원";
	}
}
