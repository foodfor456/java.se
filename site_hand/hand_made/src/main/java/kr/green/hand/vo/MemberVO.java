package kr.green.hand.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id; 
	private String me_pw; 
	private String me_name;
	private String me_email; 
	private String me_post; 
	private String me_addr; 
	private String me_addr_detail; 
	private String me_phon;
	private int me_authority;
	private int me_vali;
	private String me_s_id;
	private Date me_s_limit;
	private boolean autoLogin;
}
