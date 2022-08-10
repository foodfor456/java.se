package kr.green.springtest.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.vo.BoardVO;
import kr.green.springtest.vo.MemberVO;

public interface BoardDAO {

	void listboard(@Param("bd_title")String bd_title, @Param("bd_me_id")String bd_me_id);

	ArrayList<BoardVO> selectBoardList();

	BoardVO boardDetail(@Param("bd_num")int bd_num);

	void updateViews(@Param("bd_num")int bd_num);

	void insertBoard(@Param("b")BoardVO board, @Param("user")MemberVO user);

	void updateBoard(@Param("b")BoardVO board);

	
}
