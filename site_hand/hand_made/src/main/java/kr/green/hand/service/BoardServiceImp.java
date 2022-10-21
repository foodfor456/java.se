package kr.green.hand.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.hand.dao.BoardDAO;
import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.BoardVO;
import kr.green.hand.vo.MemberVO;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDAO boardDao;

	@Override
	public boolean insertRegion(BoardVO board) {
		if(board.getPv_name() == null && board.getRg_name() == null)
			return false;
		if(board.getPv_name() == null)
			return false;
		if(board.getRg_name() == null)
			boardDao.insertRegionP(board.getPv_name());
		else
			boardDao.insertRegionR(board.getRg_name(), board.getPv_name());
		return true;
	}

	@Override
	public String[] selectPvname() {
		
		return boardDao.selectPv();
	}

	@Override
	public String[] selectRgname(String pv_name) {
		if(pv_name == null)
			return null;
		return boardDao.selectRg(pv_name);
	}

	@Override
	public void insertBoardCategory(BoardVO board) {
		if(board.getBt_name() == null && board.getBc_name() == null)
			return;
		if(board.getBc_name() == null) {
			boardDao.insertBt(board.getBt_name());
		}else{
			board.setBc_bt_name(board.getBt_name());
			boardDao.insertBc(board);
		}
	}

	@Override
	public ArrayList<String> getBt() {
		
		return boardDao.getbt();
	}

	@Override
	public ArrayList<Map<Object, Object>> getBc(String board_type) {
		if(board_type == null)
			return null;
		return boardDao.getBc(board_type);
	}

	@Override
	public boolean insertBoard(BoardVO board, MemberVO user) {
		if(board.getBd_title() == null || board.getBd_me_id() == null || board.getBd_content() == null)
			return false;
		if(user == null)
			return false;
		boardDao.insertBoard(board);
		return  boardDao.insertRegionBoard(board) == 1 ? true : false;
	}

	@Override
	public ArrayList<BoardVO> rgBoardList(Criteria cri) {
		cri.setPerPageNum(2);
		
		return boardDao.getBoardListR(cri);
	}

	@Override
	public int getTotalcountBo() {
		return boardDao.getTotalCountR();
	}

}
