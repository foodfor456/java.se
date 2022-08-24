package kr.green.springtest.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.vo.BoardVO;
import kr.green.springtest.vo.CommentVO;
import kr.green.springtest.vo.FileVO;
import kr.green.springtest.vo.LikesVO;
import kr.green.springtest.vo.MemberVO;

public interface BoardDAO {

	void listboard(@Param("bd_title")String bd_title, @Param("bd_me_id")String bd_me_id);

	ArrayList<BoardVO> selectBoardList(@Param("cri")Criteria cri);

	BoardVO boardDetail(@Param("bd_num")int bd_num);

	void updateViews(@Param("bd_num")int bd_num);

	void insertBoard(@Param("b")BoardVO board, @Param("user")MemberVO user);

	void updateBoard(@Param("b")BoardVO board);

	int boardCount(@Param("cri")Criteria cri);

	LikesVO selectLikes(@Param("li")LikesVO likes);

	void insertLikes(@Param("li")LikesVO likes);

	void updateLikes(@Param("li")LikesVO dbLikes);

	void updateBoardLikes(@Param("bd_num")int li_bd_num);

	void insertComment(@Param("co")CommentVO comment);

	ArrayList<CommentVO> selectCommentList(@Param("bd_num")int bd_num, @Param("cri")Criteria cri);

	int getCommentCount(@Param("bd_num")int bd_num);

	CommentVO selectComment(@Param("co")CommentVO comment);

	void deleteComments(@Param("co")CommentVO comment);

	void updateComment(@Param("co")CommentVO comment);

	void insertFile(@Param("fi")FileVO file);

}
