package kr.green.hand.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.hand.vo.BuyDetailVO;
import kr.green.hand.vo.BuyGetVO;
import kr.green.hand.vo.BuyVO;
import kr.green.hand.vo.CartVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;

public interface BuyDAO {

	void insertAddr(BuyVO buy);

	void insertBuy(BuyVO buy);

	FileVO getProductThemb(String pr_code);

	int insertCart(@Param("ca")CartVO cart, @Param("user")MemberVO user);

	ArrayList<CartVO> getCart(MemberVO user);

	String getProductTitle(String ca_pr_code);

	int deleteCart(@Param("ca")CartVO cart, @Param("user")MemberVO user);

	void successCart(@Param("ca_num")Integer ca_num, @Param("user")MemberVO user);

	void insertBuyDetail(BuyDetailVO li);

	int getProductAmount(String pr_code);

	ArrayList<BuyVO> getBuySelect(String bu_code);

	BuyVO getAddress(int bu_ad_num);


}
