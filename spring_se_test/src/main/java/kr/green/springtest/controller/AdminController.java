package kr.green.springtest.controller;

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

import kr.green.springtest.service.MemberService;
import kr.green.springtest.vo.MemberVO;


@Controller
public class AdminController {
	@Autowired
	MemberService memberService;

	
	@RequestMapping(value="/admin/member/list", method=RequestMethod.GET)
	public ModelAndView adminUpdateGet(ModelAndView mv, HttpSession session){
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<MemberVO> list = memberService.adminMemberSelect(user); 
		
		mv.addObject("list", list);
		mv.setViewName("/admin/member/list");
    return mv;
	}
	@RequestMapping(value="/ajax/member/list")
	@ResponseBody
	public Map<Object,Object> ajaxAdminPost(@RequestBody MemberVO member, HttpSession session){
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
    boolean res = memberService.adminUpdateAthority(member, user);
		map.put("res", res);
		return map;
	}
}
