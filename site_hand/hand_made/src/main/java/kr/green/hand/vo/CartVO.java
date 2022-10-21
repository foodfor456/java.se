package kr.green.hand.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class CartVO {
	private Integer ca_num;
	private String fi_name;
	private Integer ca_amount;
	private String ca_me_id;
	private String ca_pr_code;
	private String ca_pr_title;
	private Integer ca_pr_price;
	private String ca_op_name;
	
	public String getCa_pr_price_str() {
		if(ca_pr_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(ca_pr_price) + " 원";
	}
}
