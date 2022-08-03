package kr.green.spring.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.spring.vo.MemberVO;

public interface MemberDAO {

	String selectEmail(@Param("id")String id);
	
	MemberVO selectUserInfo(@Param("id")String id);
	
	MemberVO selectUserInfo2(@Param("member")MemberVO member);

}
