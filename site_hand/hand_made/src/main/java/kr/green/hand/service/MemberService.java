package kr.green.hand.service;

import kr.green.hand.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member, Integer me_validate);

	boolean idCheck(MemberVO member);

	MemberVO login(MemberVO member);

	boolean emailVali(String me_email, String send);

	boolean sendEmail(String title, String content, String receiver);

	boolean emailCheck(String me_vali);

	
	
}
