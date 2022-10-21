package kr.green.hand.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class BuyGetVO {
	private String fi_name;
	private String pr_title;
	private Integer pr_amount;
	private String pr_code;
	private Integer pr_price;
	private String ca_op_name;
	private Integer ca_num;
	public String getPr_price_str() {
		if(pr_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(pr_price) + " 원";
	}
}
