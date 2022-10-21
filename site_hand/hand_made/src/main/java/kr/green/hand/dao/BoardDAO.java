package kr.green.hand.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.BoardVO;

public interface BoardDAO {

	void insertRegionP(String pv_name);

	void insertRegionR(@Param("rg_name")String rg_name, @Param("pv_name")String pv_name);

	String[] selectPv();

	String[] selectRg(String pv_name);

	void insertBt(String bt_name);

	void insertBc(BoardVO board);

	ArrayList<String> getbt();

	ArrayList<Map<Object, Object>> getBc(String board_type);

	void insertBoard(BoardVO board);

	int insertRegionBoard(BoardVO board);

	ArrayList<BoardVO> getBoardListR(Criteria cri);

	int getTotalCountR();

}
