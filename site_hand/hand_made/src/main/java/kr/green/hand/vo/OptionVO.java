package kr.green.hand.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OptionVO {
	private int op_num;
	private Integer op_price; 
	private String op_title;
	private String ps_name;
	private String ps_pr_code;
	
	public OptionVO(Integer op_price, String op_title) {
		this.op_title = op_title;
		this.op_price = op_price;
	}
	
}
