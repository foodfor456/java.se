package kr.green.hand.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
	
	private Integer fi_num = null;
	private String fi_name;
	private String fi_ori_name;
	private String fi_table;
	private String fi_code;
	
	public FileVO(String fi_name, String fi_ori_name, String fi_table, String fi_code) {
		this.fi_name = fi_name;
		this.fi_ori_name = fi_ori_name;
		this.fi_table = fi_table;
		this.fi_code = fi_code;
	}
	
	
	
}
