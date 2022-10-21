package kr.green.hand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.hand.service.BuyService;
import kr.green.hand.service.ProductService;
import kr.green.hand.vo.BuyDetailListVO;
import kr.green.hand.vo.BuyDetailVO;
import kr.green.hand.vo.BuyGetListVO;
import kr.green.hand.vo.BuyGetVO;
import kr.green.hand.vo.BuyVO;
import kr.green.hand.vo.CartVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

@Controller
public class BuyController {
	@Autowired
	BuyService buyService;
	@Autowired
	ProductService productService;
	
	
	@RequestMapping(value= "/product/buy")
	public ModelAndView buyPagePost(ModelAndView mv, BuyGetListVO buyGet, HttpSession session){
		ArrayList<BuyGetVO> list = buyService.getOrderInfo(buyGet);
		MemberVO user = (MemberVO)session.getAttribute("user");
		int[] amount = buyService.getProductAmount(buyGet);
		mv.addObject("amount", amount);
		mv.addObject("list", list);
		mv.addObject("user", user);
		mv.addObject("buyGet", buyGet);
		mv.setViewName("/product/buy");
		return mv;
	}
	@RequestMapping(value= "/product/buysuccess", method=RequestMethod.GET)
	public ModelAndView buySuccessPageGet(ModelAndView mv, HttpSession session, String bu_code){
		//ArrayList<FileVO> file = productService.selectProductFile(pr.getPr_code());
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<BuyVO> buySelect = buyService.getBuyState(bu_code);
		BuyVO res = buySelect.get(0);
		ProductVO pr = productService.selectProduct(res.getBy_pr_code());
		BuyVO addr = buyService.getAddress(res.getBu_ad_num());
		mv.addObject("addr", addr);
		mv.addObject("pr", pr);
		mv.addObject("res", res);
		mv.addObject("user", user);
		mv.setViewName("/product/buysuccess");
	  return mv;
	}
	@RequestMapping(value= "/buy/cart", method=RequestMethod.GET)
	public ModelAndView cartGet(ModelAndView mv, HttpSession session){
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<CartVO> list = buyService.getCart(user);
		mv.addObject("list",list);
		mv.setViewName("/buy/cart");
	  return mv;
	}
	//ajax
	
	@RequestMapping(value ="/ajax/product/buy", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> buy(@RequestBody BuyVO buy){
		Map<Object, Object> map = new HashMap<Object, Object>();
		buyService.insertAddr(buy);
		int ad_num = buy.getAd_num();
		String order_num = buyService.getOrderNum(buy.getPr_code());
		buy.setBu_code(order_num);
		buy.setBu_ad_num(ad_num);
		buyService.insertBuy(buy);
		boolean res = buyService.getAmount(buy.getPr_code());
		map.put("order_num", order_num);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value ="/ajax/product/buySuccess", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> buySuccess(@RequestBody ArrayList<BuyDetailVO> bl, HttpSession session){
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		buyService.buySuccess(bl, user);
		return map;
	}
	@RequestMapping(value ="/ajax/buy/cart", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> cartPost(@RequestBody CartVO cart, HttpSession session){
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = buyService.insertCart(cart, user);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value ="/ajax/cart/cancle", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> cartCancle(@RequestBody CartVO cart, HttpSession session){
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = buyService.deleteCart(cart, user);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value ="/ajax/cart/select/cancle", method=RequestMethod.POST)
	@ResponseBody
	public boolean cartSelectCancle(@RequestBody Integer[] ca_num, HttpSession session){
		MemberVO user = (MemberVO)session.getAttribute("user");
		return buyService.deleteSelectCart(ca_num, user);
	}
}
