package kr.green.hand.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

public interface ProductDAO {

	void categoryInsertL(String cl_name);

	ArrayList<String> getCategoryL();

	boolean categoryInsertS(@Param("cl_name")String cl_name, @Param("cs_name")String cs_name);

	ArrayList<String> getCategoryS(String cl_name);

	int countCategory(String pr_code);

	void productInsert(@Param("pr")ProductVO product, @Param("user")MemberVO user);

	ArrayList<ProductVO> getProductList(Criteria cri);

	int getTotalcountPr(Criteria cri);
	
	
	
}
