package kr.green.hand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.hand.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@RequestMapping(value= "/product/list")
	public ModelAndView productList(ModelAndView mv){
		mv.setViewName("/product/list");
	  return mv;
	}
	@RequestMapping(value= "/product/category")
	public ModelAndView categoryList(ModelAndView mv){
		mv.setViewName("/product/category");
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
	  ArrayList<String> list = productService.getCategoryL();
	  map.put("list", list);
	  return map;
	}
	@RequestMapping(value ="/ajax/product/inserts", method=RequestMethod.POST)
	@ResponseBody
	public String categoryInsertS(String cl_name, String cs_name){
		boolean res = productService.categoryInsertS(cl_name, cs_name);
	  return ""+res;
	}
	
	
}
