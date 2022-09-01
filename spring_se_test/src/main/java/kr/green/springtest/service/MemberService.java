package kr.green.springtest.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.green.springtest.vo.MemberVO;

public interface MemberService {
 
    public boolean signup(MemberVO member);

	public MemberVO login(MemberVO member);

	public Object idCheck(MemberVO member);

	public String getMemberId(String me_email, String me_birth_str);

	public boolean findPw(MemberVO member);

	public boolean memberUpdate(MemberVO member, MemberVO user);

	public void updateMemberSession(String me_id, String id, Date session_limit);

	public MemberVO getMember(String session_id);

	public void logout(HttpServletRequest request, HttpServletResponse response);

	public ArrayList<MemberVO> adminMemberSelect(MemberVO user);

	public boolean adminUpdateAthority(MemberVO member, MemberVO user);

	
}
