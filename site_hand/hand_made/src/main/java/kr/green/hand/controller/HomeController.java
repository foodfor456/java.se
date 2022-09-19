package kr.green.hand.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.hand.service.MemberService;
import kr.green.hand.vo.MemberVO;


@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value= "/")
	public ModelAndView home(ModelAndView mv){
		mv.setViewName("/main/home");
	  return mv;
	}
	@RequestMapping(value= "/signup")
	public ModelAndView signupGet(ModelAndView mv){
		mv.setViewName("/main/signup");
	  return mv;
	}
	@RequestMapping(value= "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member){
		boolean res = memberService.signup(member);
		System.out.println(member);
		mv.addObject("res",res);
		mv.setViewName("redirect:/signup");
	  return mv;
	}
	// ajax
	@RequestMapping(value ="/ajax/signup/check")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String me_id){
	  Map<Object, Object> map = new HashMap<Object, Object>();
	  boolean res = memberService.idCheck(me_id);
	  System.out.println(res);
	  map.put("res", res);
	  return map;
	}
	
}
