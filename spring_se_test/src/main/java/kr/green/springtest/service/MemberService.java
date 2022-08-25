package kr.green.springtest.service;

import kr.green.springtest.vo.MemberVO;

public interface MemberService {
 
    public boolean signup(MemberVO member);

	public MemberVO login(MemberVO member);

	public Object idCheck(MemberVO member);

	public String getMemberId(String me_email, String me_birth_str);

	
}
