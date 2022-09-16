package kr.green.hand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		System.out.println(member);
		boolean res = memberService.signup(member);
		System.out.println(member);
		mv.setViewName("redirect:/signup");
	  return mv;
	}
	
}
