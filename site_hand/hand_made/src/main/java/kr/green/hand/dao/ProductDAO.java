package kr.green.hand.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.CategoryVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;
import kr.green.hand.vo.WaitingVO;

public interface ProductDAO {

	void categoryInsertL(String cl_name);

	boolean categoryInsertS(@Param("cl_name")String cl_name, @Param("cs_name")String cs_name);

	ArrayList<CategoryVO> getCategoryS(String cl_name);

	int countCategory(String pr_code);

	void productInsert(@Param("pr")ProductVO product, @Param("user")MemberVO user);

	ArrayList<ProductVO> getProductList(Criteria cri);

	int getTotalcountPr(Criteria cri);

	void insertFile(FileVO fileVo);

	ProductVO selectProduct(String pr_code);

	ArrayList<FileVO> selectProductFile(String pr_code);

	ArrayList<CategoryVO> getCategoryL();

	CategoryVO getCategory(@Param("cl_num")int cl_num, @Param("cs_num")int cs_num);

	ArrayList<FileVO> getFileList();

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<FileVO> getDelFile(FileVO file);

	void deleteFile(Integer fi_num);

	FileVO delFileInfo(Integer num);

	void updateProduct(@Param("p")ProductVO pr, @Param("pr_ori_code")String pr_num);

	void updateFile(@Param("fi_ori_code")String fi_ori_code, @Param("fi_code")String fi_code2);

	void insertWaiting(WaitingVO wa);

	WaitingVO getWaiting(String pr_code);

	void deleteWaiting(String pr_code);
	
	
	
}
