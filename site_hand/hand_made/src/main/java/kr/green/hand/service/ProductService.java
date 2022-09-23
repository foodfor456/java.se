package kr.green.hand.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.vo.CategoryVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

public interface ProductService {

	boolean categoryInsertL(String cl_name);

	boolean categoryInsertS(String cl_name, String cs_name);

	ArrayList<CategoryVO> getCategoryS(String cl_name);

	int countCategory(String pr_code);

	String getCategoryCode(String ca_code, int pr_num);

	boolean productInsert(ProductVO product, MemberVO user, MultipartFile[] files);

	ArrayList<ProductVO> getProductList(Criteria cri);

	int getTotalcountPr(Criteria cri);

	ProductVO selectProduct(String pr_code);

	ArrayList<FileVO> selectProductFile(String pr_code);

	ArrayList<CategoryVO> getCategoryL();

}
