package kr.green.hand.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class WaitingVO {
	private int wp_num;
	private String wp_state;
	private String wp_note;
	private Date wp_date;
	private String wp_pr_code;
	
	public String getWp_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(wp_date == null)
			return "";
		return format.format(wp_date);
	}

	public WaitingVO(String wp_state, String wp_note, String wp_pr_code) {
		this.wp_state = wp_state;
		this.wp_note = wp_note;
		this.wp_pr_code = wp_pr_code;
	}
}

