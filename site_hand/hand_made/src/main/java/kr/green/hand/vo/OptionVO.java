package kr.green.hand.vo;

import java.text.DecimalFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OptionVO {
	private String op_code;
	private Integer op_price; 
	private String op_title;
	private String op_ps_code;
	private String ps_code;
	private String ps_name;
	private String ps_pr_code;
	private int ps_num;
	
	public OptionVO(Integer op_price, String op_title) {
		this.op_title = op_title;
		this.op_price = op_price;
	}

	public OptionVO(String ps_code, String ps_name, String ps_pr_code) {
		this.ps_code = ps_code;
		this.ps_name = ps_name;
		this.ps_pr_code = ps_pr_code;
	}
	public String getOp_price_str() {
		if(op_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(op_price) + " 원";
	}
	
}
