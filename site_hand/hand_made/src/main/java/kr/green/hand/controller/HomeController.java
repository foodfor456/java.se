package kr.green.hand.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.green.hand.service.MemberService;
import kr.green.hand.service.MessageService;
import kr.green.hand.vo.MemberVO;


@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value= "/")
	public ModelAndView home(ModelAndView mv){
		mv.setViewName("/main/home");
	  return mv;
	}
	@RequestMapping(value= "/login")
	public ModelAndView login(ModelAndView mv, MemberVO member){
		MemberVO user = memberService.login(member);
		mv.addObject("user",user);
		if(user == null)
			mv.setViewName("/main/login");
		else
			mv.setViewName("redirect:/");
	  return mv;
	}
	@RequestMapping(value= "/logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session){
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user == null)
			return null;
		session.removeAttribute("user");
		mv.setViewName("redirect:/");
	  return mv;
	}
	@RequestMapping(value= "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){
		mv.setViewName("/main/signup");
	  return mv;
	}
	@RequestMapping(value= "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member, HttpServletResponse response, Integer me_validate){
		boolean res = memberService.signup(member, me_validate);
		mv.addObject("res",res);
		if(res)
			messageService.message(response, "회원가입이 완료되었습니다.", "/hand");
		else
			messageService.message(response, "회원가입이 실패하였습니다.", "/hand/signup");
		
	  return mv;
	}
	// ajax
	@RequestMapping(value ="/ajax/signup/check")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody MemberVO member){
	  Map<Object, Object> map = new HashMap<Object, Object>();
	  boolean idRes = memberService.idCheck(member);
	  // System.out.println(member);
	  map.put("idRes", idRes);
	  return map;
	}
	@RequestMapping(value ="/ajax/email/check")
	@ResponseBody
	public String emailCheck(String me_email, String send){
	  System.out.println(me_email + send);
	  memberService.emailVali(me_email, send);
	  return me_email;
	}
	@RequestMapping(value ="/ajax/email/checked")
	@ResponseBody
	public String emailChecked(String me_vali, HttpServletResponse response){
	  boolean res = memberService.emailCheck(me_vali);
	  return ""+res;
	}
	
}
