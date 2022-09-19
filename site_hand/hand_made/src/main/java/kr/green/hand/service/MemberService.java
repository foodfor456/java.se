package kr.green.hand.service;

import kr.green.hand.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean idCheck(String me_id);

	
	
}
