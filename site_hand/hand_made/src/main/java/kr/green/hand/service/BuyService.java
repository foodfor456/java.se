package kr.green.hand.service;

import java.util.ArrayList;

import kr.green.hand.vo.BuyDetailVO;
import kr.green.hand.vo.BuyGetListVO;
import kr.green.hand.vo.BuyGetVO;
import kr.green.hand.vo.BuyVO;
import kr.green.hand.vo.CartVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

public interface BuyService {

	String getOrderNum(String pr_code);

	void insertAddr(BuyVO buy);

	void insertBuy(BuyVO buy);
	
	ArrayList<BuyGetVO> getOrderInfo(BuyGetListVO buyGet);

	boolean insertCart(CartVO cart, MemberVO user);

	ArrayList<CartVO> getCart(MemberVO user);

	boolean deleteCart(CartVO cart, MemberVO user);

	boolean deleteSelectCart(Integer[] ca_num, MemberVO user);

	void buySuccess(ArrayList<BuyDetailVO> bl, MemberVO user);

	int[] getProductAmount(BuyGetListVO buyGet);

	ArrayList<BuyVO> getBuyState(String bu_code);

	BuyVO getAddress(int bu_ad_num);

	boolean getAmount(String pr_code);


}
