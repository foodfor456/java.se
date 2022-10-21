package kr.green.hand.vo;

import lombok.Data;

@Data
public class BuyDetailVO {
	private String by_code;
	private int by_amount;
	private int by_price;
	private String by_state = "상품준비중";
	private String by_op_name;
	private String by_bu_code;
	private String by_pr_code;
	private Integer ca_num;
}
