package kr.green.hand.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.hand.vo.MemberVO;

public interface MemberDAO {

	int idCheck(String me_id);

	void signUp(MemberVO member);

	MemberVO getMember(String me_id);

	void insertVali(@Param("me_code")String me_code, @Param("me_email")String me_email);

	String memberCodeCheck(String me_vali);

	void memberValiSuccess(String me_email);

	void updateSession(MemberVO user);

	MemberVO selectBySession(String me_s_id);

	

}
