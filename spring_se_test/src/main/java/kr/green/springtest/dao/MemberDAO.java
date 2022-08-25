package kr.green.springtest.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.vo.MemberVO;

public interface MemberDAO {
	
	public MemberVO selectMember(@Param("me_id")String me_id);

	public void insertMember(@Param("m")MemberVO member);

	public void loginMember(@Param("me_id")String me_id, @Param("me_pw")String me_pw);

	public String getMemberId(@Param("me_email")String me_email, @Param("me_birth")String me_birth_str);
}