package kr.green.springtest.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.vo.MemberVO;

public interface MemberDAO {
    public String getEmail(@Param("id")String id);

	public MemberVO selectMember(@Param("me_id")String me_id);

	public void insertMember(@Param("m")MemberVO member);

	public void loginMember(@Param("me_id")String me_id, @Param("me_pw")String me_pw);
}