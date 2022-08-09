package kr.green.springtest.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.springtest.dao.BoardDAO;
import kr.green.springtest.vo.BoardVO;
import kr.green.springtest.vo.MemberVO;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBoardList();
		
	}

	
	@Override
	public BoardVO boardSelect(int bd_num) {
		
		return boardDao.boardDetail(bd_num);
	}


	@Override
	public void updateViews(int bd_num) {
		boardDao.updateViews(bd_num);
		
	}


	@Override
	public void insertBoard(BoardVO board, MemberVO user) {
		if(board.getBd_title() == null || board.getBd_content() == null)
			return;
		if(user == null || user.getMe_id() == null)
			return;
		// board.setBd_me_id(user.getMe_id()); // 미리 id정보를 넘겨줌
		boardDao.insertBoard(board,user);
		
	}
}
