package kr.green.hand.service;

import java.util.ArrayList;
import java.util.Map;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.BoardVO;
import kr.green.hand.vo.MemberVO;

public interface BoardService {

	boolean insertRegion(BoardVO board);

	String[] selectPvname();

	String[] selectRgname(String pv_name);

	void insertBoardCategory(BoardVO board);

	ArrayList<String> getBt();

	ArrayList<Map<Object, Object>> getBc(String board_type);

	boolean insertBoard(BoardVO board, MemberVO user);

	ArrayList<BoardVO> rgBoardList(Criteria cri);

	int getTotalcountBo();

}
