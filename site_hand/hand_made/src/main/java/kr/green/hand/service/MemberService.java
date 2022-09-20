package kr.green.hand.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.green.hand.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member, Integer me_validate);

	boolean idCheck(MemberVO member);

	MemberVO login(MemberVO member);

	boolean emailVali(String me_email, String send);

	boolean sendEmail(String title, String content, String receiver);

	boolean emailCheck(String me_vali);

	MemberVO loginBySession(String me_s_id);

	void updateMemberSession(MemberVO user);

	void logout(HttpServletRequest request, HttpServletResponse response);

	
	
}
