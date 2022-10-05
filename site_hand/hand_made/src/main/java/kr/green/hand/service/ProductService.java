package kr.green.hand.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.CategoryVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.OptionListVO;
import kr.green.hand.vo.OptionVO;
import kr.green.hand.vo.ProductVO;
import kr.green.hand.vo.WaitingVO;

public interface ProductService {

	boolean categoryInsertL(String cl_name);

	boolean categoryInsertS(String cl_name, String cs_name);

	ArrayList<CategoryVO> getCategoryS(String cl_name);

	int countCategory(String pr_code);

	String getCategoryCode(String ca_code, int pr_num);

	boolean productInsert(ProductVO product, MemberVO user, MultipartFile[] files, OptionListVO op);

	ArrayList<ProductVO> getProductList(Criteria cri);

	int getTotalcountPr(Criteria cri);

	ProductVO selectProduct(String pr_code);

	ArrayList<FileVO> selectProductFile(String pr_code);

	ArrayList<CategoryVO> getCategoryL();

	CategoryVO getCategory(String pr_code);

	ArrayList<FileVO> getFileList();

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<CategoryVO> updateCategory(CategoryVO cl_name, ArrayList<CategoryVO> categoryS);

	ArrayList<FileVO> getDelFile(FileVO file);

	boolean updateProduct(MemberVO user, MultipartFile[] files, ProductVO pr, int[] delFiles, String pr_num, OptionListVO op);

	boolean insertWaiting(WaitingVO wa, MemberVO user, ProductVO pr);

	WaitingVO getWaiting(String pr_code);

	boolean deleteWaiting(String pr_code, ProductVO prd, MemberVO user);

	ArrayList<OptionVO> getOption(String pr_code);

}
