package kr.green.hand.service;

import java.util.ArrayList;

import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

public interface ProductService {

	boolean categoryInsertL(String cl_name);

	ArrayList<String> getCategoryL();

	boolean categoryInsertS(String cl_name, String cs_name);

	ArrayList<String> getCategoryS(String cl_name);

	int countCategory(String pr_code);

	String getCategoryCode(String ca_code, int pr_num);

	boolean productInsert(ProductVO product, MemberVO user);

}
