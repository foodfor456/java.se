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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.pagination.PageMaker;
import kr.green.hand.service.ProductService;
import kr.green.hand.vo.CategoryVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@RequestMapping(value= "/product/list")
	public ModelAndView productList(ModelAndView mv, Criteria cri){
		ArrayList<ProductVO> list = productService.getProductList(cri);
		int totalCount = productService.getTotalcountPr(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("list", list);
		mv.addObject("pm",pm);
		mv.setViewName("/product/list");
	  return mv;
	}
	@RequestMapping(value= "/product/select")
	public ModelAndView productSelect(ModelAndView mv, String pr_code){
		ProductVO pr = productService.selectProduct(pr_code);
		ArrayList<FileVO> file = productService.selectProductFile(pr_code);
		mv.addObject("pr",pr);
		mv.addObject("file",file);
		mv.setViewName("/product/select");
	  return mv;
	}
	@RequestMapping(value= "/product/insert", method=RequestMethod.GET)
	public ModelAndView productInsertGet(ModelAndView mv){
		ArrayList<CategoryVO> category = productService.getCategoryL();
		mv.addObject("categoryL",category);
		mv.setViewName("/product/insert");
	  return mv;
	}
	@RequestMapping(value= "/product/category")
	public ModelAndView categoryList(ModelAndView mv){
		mv.setViewName("/product/category");
	  return mv;
	}
	@RequestMapping(value ="/product/insert", method=RequestMethod.POST)
	public ModelAndView productInsert(ModelAndView mv, ProductVO product, HttpSession session,
			MultipartFile[] files){
		MemberVO user = (MemberVO)session.getAttribute("user");
	  boolean res = productService.productInsert(product, user, files);
	  
	  mv.setViewName("redirect:/product/insert");
	  return mv;
	}
	// ajax
	@RequestMapping(value ="/ajax/product/insertl", method=RequestMethod.POST)
	@ResponseBody
	public String categoryInsertL(String cl_name){
		boolean res = productService.categoryInsertL(cl_name);
		return "" + res;
	}
	@RequestMapping(value ="/ajax/product/listL", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> categoryListL(){
	  Map<Object, Object> map = new HashMap<Object, Object>();
	  ArrayList<CategoryVO> list = productService.getCategoryL();
	  System.out.println(list);
	  map.put("list", list);
	  return map;
	}
	@RequestMapping(value ="/ajax/product/inserts", method=RequestMethod.POST)
	@ResponseBody
	public String categoryInsertS(String cl_name, String cs_name){
		boolean res = productService.categoryInsertS(cl_name, cs_name);
	  return ""+res;
	}
	@RequestMapping(value="/product/insert/categoryS", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> productInsertS(@RequestBody CategoryVO cl_name){
		Map<Object, Object> map = new HashMap<Object, Object>();
		ArrayList<CategoryVO> categoryS = productService.getCategoryS(cl_name.getCl_name());
	  map.put("categoryS", categoryS);
		return map;
	}
	@RequestMapping(value="/product/select/category", method=RequestMethod.POST)
	@ResponseBody
	public String categoryGetca(String ca_code){
		int pr_num = productService.countCategory(ca_code);
		String pr_code = productService.getCategoryCode(ca_code, pr_num);
		return pr_code;
	}
	
}
