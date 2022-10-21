package kr.green.hand.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.hand.dao.BuyDAO;
import kr.green.hand.dao.ProductDAO;
import kr.green.hand.vo.BuyDetailVO;
import kr.green.hand.vo.BuyGetListVO;
import kr.green.hand.vo.BuyGetVO;
import kr.green.hand.vo.BuyVO;
import kr.green.hand.vo.CartVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;
import kr.green.hand.vo.WaitingVO;

@Service
public class BuyServiceImp implements BuyService{
	@Autowired
	BuyDAO buyDao;
	@Autowired
	ProductDAO productDao;

	@Override
	public String getOrderNum(String pr_code) {
		if(pr_code == null)
			return null;
		String res = createRandom(pr_code, 8);
		return res;
	}
	private String createRandom(String str, int count) {
		Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		if(str == null)
			return "";
		str += "-"+ymd+"-";
		for(int i = 0; i < count; i++) {
			int r = (int)(Math.random()*10);
			str += r;
		}
		return str;
	}
	@Override
	public void insertAddr(BuyVO buy) {
		if(buy == null || buy.getAd_addr() == null || buy.getAd_phon() == null || buy.getAd_to() == null)
			return;
		buyDao.insertAddr(buy);
	}
	@Override
	public void insertBuy(BuyVO buy) {
		if(buy == null)
			return;
		buyDao.insertBuy(buy);
	}
	@Override
	public ArrayList<BuyGetVO> getOrderInfo(BuyGetListVO buyGet) {
		if(buyGet == null)
			return null;
		for(BuyGetVO list : buyGet.getList()) {
			FileVO file = buyDao.getProductThemb(list.getPr_code());
			list.setFi_name(file.getFi_name());
		}
		return buyGet.getList();
	}
	@Override
	public boolean insertCart(CartVO cart, MemberVO user) {
		if(cart == null || user.getMe_id() == null)
			return false;
		
		return buyDao.insertCart(cart,user) == 1 ? true : false;
	}
	@Override
	public ArrayList<CartVO> getCart(MemberVO user) {
		if(user.getMe_id() == null)
			return null;
		ArrayList<CartVO> cartList = buyDao.getCart(user);
		FileVO fi_name = new FileVO();
		for(CartVO list : cartList) {
			fi_name = buyDao.getProductThemb(list.getCa_pr_code());
			list.setFi_name(fi_name.getFi_name());
			list.setCa_pr_title(buyDao.getProductTitle(list.getCa_pr_code()));
		}
		return cartList;
	}
	@Override
	public boolean deleteCart(CartVO cart, MemberVO user) {
		if(cart.getCa_num() == null || user.getMe_id() == null)
			return false;
		
		return buyDao.deleteCart(cart,user) == 1 ? true : false;
	}
	@Override
	public boolean deleteSelectCart(Integer[] ca_num, MemberVO user) {
		if(ca_num.length == 0 || user.getMe_id() == null)
			return false;
		CartVO cart = new CartVO();
		for(Integer ca : ca_num) {
			cart.setCa_num(ca);
			buyDao.deleteCart(cart,user);
		}
		return true;
	}
	@Override
	public void buySuccess(ArrayList<BuyDetailVO> bl, MemberVO user) {
		if(bl.size() == 0 || user.getMe_id() == null)
			return;
		int i = 1;
		for(BuyDetailVO li : bl) {
			productDao.updateProductAmount(li.getBy_pr_code(), li.getBy_amount()); 
			int amount = buyDao.getProductAmount(li.getBy_pr_code());
			String res = li.getBy_bu_code() + "-" + i;
			li.setBy_code(res);
			buyDao.insertBuyDetail(li);
			if(li.getCa_num() != null)
				buyDao.successCart(li.getCa_num(), user);
			i++;
			if(amount == 0) {
				productDao.waitingProduct(li.getBy_pr_code());
				WaitingVO wa = new WaitingVO("품절", "수량부족으로 품절", li.getBy_pr_code());
				productDao.insertWaiting(wa);
			}
		}
	}
	@Override
	public int[] getProductAmount(BuyGetListVO list) {
		if(list.getList().size() == 0)
			return null;
		int[] res = new int[list.getList().size()];
		int amount;
		int i = 0;
		for(BuyGetVO li : list.getList()) {
			amount = buyDao.getProductAmount(li.getPr_code()); 
			res[i] = amount; 
			i++;
		}
		return res;
	}
	@Override
	public ArrayList<BuyVO> getBuyState(String bu_code) {
		if(bu_code == null)
			return null;
		return buyDao.getBuySelect(bu_code);
	}
	@Override
	public BuyVO getAddress(int bu_ad_num) {
		if(bu_ad_num == 0)
			return null;
		return buyDao.getAddress(bu_ad_num);
	}
	@Override
	public boolean getAmount(String pr_code) {
		if(pr_code == null)
			return false;
		return buyDao.getProductAmount(pr_code) == 0 ? true : false;
	}
}
