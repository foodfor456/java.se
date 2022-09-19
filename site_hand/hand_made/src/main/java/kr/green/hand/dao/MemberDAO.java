package kr.green.hand.dao;

import kr.green.hand.vo.MemberVO;

public interface MemberDAO {

	int idCheck(String me_id);

	void signUp(MemberVO member);

	

}
