package kr.green.hand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import kr.green.hand.service.MessageService;
import kr.green.hand.service.ProductService;
import kr.green.hand.vo.CategoryVO;
import kr.green.hand.vo.FileVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.OptionListVO;
import kr.green.hand.vo.OptionVO;
import kr.green.hand.vo.ProductVO;
import kr.green.hand.vo.WaitingVO;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value= "/product/list")
	public ModelAndView productList(ModelAndView mv, Criteria cri){
		ArrayList<ProductVO> list = productService.getProductList(cri);
		int totalCount = productService.getTotalcountPr(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		ArrayList<FileVO> files = productService.getFileList();
		mv.addObject("files",files);
		mv.addObject("list", list);
		mv.addObject("pm",pm);
		mv.setViewName("/product/list");
	  return mv;
	}
	@RequestMapping(value= "/product/select")
	public ModelAndView productSelect(ModelAndView mv, String pr_code){
		ProductVO pr = productService.selectProduct(pr_code);
		ArrayList<FileVO> file = productService.selectProductFile(pr_code);
		CategoryVO ca = productService.getCategory(pr_code);
		WaitingVO wa = productService.getWaiting(pr_code);
		if(pr != null) {
			if(pr_code.matches("(..B)(\\d{5})$"))
				pr.setPr_check(1);
		}
		mv.addObject("wa", wa);
		mv.addObject("pr",pr);
		mv.addObject("file",file);
		mv.addObject("ca",ca);
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
			MultipartFile[] files, OptionListVO op){
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = productService.productInsert(product, user, files, op);
	  mv.setViewName("redirect:/product/insert");
	  return mv;
	}
	@RequestMapping(value= "/product/update", method=RequestMethod.GET)
	public ModelAndView productUpdateGet(ModelAndView mv, String pr_code){
		ProductVO pr = productService.selectProduct(pr_code);
		ArrayList<FileVO> file = productService.selectProductFile(pr_code);
		ArrayList<CategoryVO> ca = productService.getCategoryList();
		CategoryVO cl_num = productService.getCategory(pr_code);
		WaitingVO wa = productService.getWaiting(pr_code);
		ArrayList<CategoryVO> category = new ArrayList<CategoryVO>();
		if(pr_code.matches("(..B)(\\d{5})$"))
			pr.setPr_check(1);
		for(CategoryVO cas : ca) {
			if(cas.getCl_name().equals(cl_num.getCl_name()))
				category.add(cas);
		}
		mv.addObject("wa", wa);
		mv.addObject("category",category);
		mv.addObject("cl_num",cl_num);
		mv.addObject("pr",pr);
		mv.addObject("file",file);
		mv.addObject("ca",ca);
		mv.setViewName("/product/update");
	  return mv;
	}
	@RequestMapping(value= "/product/update", method=RequestMethod.POST)
	public ModelAndView productUpdatePost(ModelAndView mv, int[] delFiles, MultipartFile[] files,
			HttpSession session, ProductVO pr, String pr_num, HttpServletResponse response){
		System.out.println(pr_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		WaitingVO wa = productService.getWaiting(pr_num);
		boolean res = productService.updateProduct(user, files, pr, delFiles, pr_num);
		if(res)
			messageService.message(response, "제품을 수정했습니다.", "/hand/product/select?pr_code="+pr.getPr_code());
		else
			messageService.message(response, "제품 수정에 실패했습니다.", "/hand/product/select?pr_code="+pr.getPr_code());
		return mv;
	}
	@RequestMapping(value= "/product/waiting/list", method=RequestMethod.GET)
	public ModelAndView productWaitingList(ModelAndView mv, Criteria cri){
		cri.setPr_waiting("Y");
		ArrayList<ProductVO> list = productService.getProductList(cri);
		int totalCount = productService.getTotalcountPr(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		ArrayList<FileVO> files = productService.getFileList();
		mv.addObject("files",files);
		mv.addObject("list", list);
		mv.addObject("pm",pm);
		mv.setViewName("/product/waiting/list");
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
	public String productSelectCategory(String ca_code){
		int pr_num = productService.countCategory(ca_code);
		String pr_code = productService.getCategoryCode(ca_code, pr_num);
	  return pr_code;
	}
	@RequestMapping(value="/product/update/categoryL", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> productUpdateCategoryL(@RequestBody CategoryVO cl_name){
		Map<Object, Object> map = new HashMap<Object, Object>();
		ArrayList<CategoryVO> categoryS = productService.getCategoryList();
		ArrayList<CategoryVO> category = productService.updateCategory(cl_name, categoryS);
		map.put("cas", category);
	  map.put("cl_name", cl_name);
		return map;
	}
	@RequestMapping(value="/product/update/categoryCode", method=RequestMethod.POST)
	@ResponseBody
	public String productUpdateCategoryS(String ca_code){
		int pr_num = productService.countCategory(ca_code);
		String pr_code = productService.getCategoryCode(ca_code, pr_num);
		return pr_code;
	}
	@RequestMapping(value="/product/update/files", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> productUpdateFiles(@RequestBody FileVO file){
		Map<Object, Object> map = new HashMap<Object, Object>();
		ArrayList<FileVO> fi = productService.getDelFile(file);
		map.put("fi", fi);
		return map;
	}
	@RequestMapping(value= "/product/waiting/insert", method=RequestMethod.POST)
	@ResponseBody
	public boolean productWaitingNote(@RequestBody WaitingVO wa,
				HttpSession session){
		MemberVO user = (MemberVO)session.getAttribute("user");
		ProductVO pr = productService.selectProduct(wa.getWp_pr_code());
		boolean res = productService.insertWaiting(wa, user, pr);
		return res;
	}
	@RequestMapping(value= "/product/waiting/delete", method=RequestMethod.POST)
	@ResponseBody
	public boolean productWaitingDelete(@RequestBody ProductVO pr,
				HttpSession session){
		MemberVO user = (MemberVO)session.getAttribute("user");
		ProductVO prd = productService.selectProduct(pr.getPr_code());
		boolean res = productService.deleteWaiting(pr.getPr_code(), prd, user);
		return res;
	}
}
