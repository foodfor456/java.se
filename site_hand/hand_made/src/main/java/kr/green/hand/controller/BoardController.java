package kr.green.hand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.hand.pagination.Criteria;
import kr.green.hand.pagination.PageMaker;
import kr.green.hand.service.BoardService;
import kr.green.hand.service.MessageService;
import kr.green.hand.vo.BoardVO;
import kr.green.hand.vo.MemberVO;
import kr.green.hand.vo.ProductVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	@Autowired
	MessageService messageService;
	@RequestMapping(value= "/board/craft", method= RequestMethod.GET)
	public ModelAndView boardHome(ModelAndView mv){
		mv.setViewName("/board/craft");
	  return mv;
	}
	@RequestMapping(value= "/board/region", method= RequestMethod.GET)
	public ModelAndView boardRegin(ModelAndView mv, Criteria cri, Integer page){
		String[] pv_name = boardService.selectPvname();
		ArrayList<BoardVO> list = boardService.rgBoardList(cri);
		int totalCount = boardService.getTotalcountBo();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		int i = 0;
		if(page == null){
			page = 1;
		}
		for(BoardVO li : list) {
			li.setBd_num(totalCount - (page * cri.getPerPageNum() - cri.getPerPageNum()) - i);
		  i++;
		}
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.addObject("pv_name", pv_name);
		mv.setViewName("/board/region");
	  return mv;
	}
	@RequestMapping(value= "/board/region-insert", method= RequestMethod.GET)
	public ModelAndView boardReginInsertGet(ModelAndView mv){
		mv.setViewName("/board/region-insert");
	  return mv;
	}
	@RequestMapping(value= "/board/insertR", method= RequestMethod.GET)
	public ModelAndView boardInsertGet(ModelAndView mv, HttpSession session, String board_type){
		MemberVO user = (MemberVO)session.getAttribute("user");
		String[] region = boardService.selectPvname();
		ArrayList<Map<Object, Object>> bca = boardService.getBc(board_type);
		mv.addObject("bca", bca);
		mv.addObject("region",region);
		mv.setViewName("/board/insertR");
	  return mv;
	}
	@RequestMapping(value= "/board/insertR", method= RequestMethod.POST)
	public ModelAndView boardInsertPost(ModelAndView mv, HttpSession session, BoardVO board, HttpServletResponse response){
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = boardService.insertBoard(board, user);
		if(res)
			messageService.message(response, "게시글을 등록하였습니다.", "/hand/board/region");
		else
			messageService.message(response, "게시글 등록에 실패하였습니다.", "/hand/board/insertR");
		mv.setViewName("/board/insertR");
	  return mv;
	}
	@RequestMapping(value= "/board/category", method= RequestMethod.GET)
	public ModelAndView boardCategoryInsertGet(ModelAndView mv, HttpSession session){
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		mv.setViewName("/board/category");
	  return mv;
	}
	@RequestMapping(value= "/board/category", method= RequestMethod.POST)
	public ModelAndView boardCategoryInsertPost(ModelAndView mv, BoardVO board, HttpSession session){
		boardService.insertBoardCategory(board);
		mv.setViewName("/board/category");
	  return mv;
	}
	// ajax
	@RequestMapping(value ="/ajax/region/insert", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> regionInsert(@RequestBody BoardVO board, HttpSession session){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean res = boardService.insertRegion(board);
		map.put("res", res);
		MemberVO user = (MemberVO)session.getAttribute("user");
		return map;
	}
	@RequestMapping(value ="/ajax/region/select", method=RequestMethod.POST)
	@ResponseBody
	public String[] regionSelect(){
			String[] pv_name = boardService.selectPvname();
		return pv_name;
	}
	@RequestMapping(value ="/ajax/board/region/select", method=RequestMethod.POST)
	@ResponseBody
	public String[] boardRegionSelect(@RequestBody String pv_name){
		String[] rg_name = boardService.selectRgname(pv_name);
		
		return rg_name;
	}
	@RequestMapping(value ="/ajax/board/category", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<String> boardCategory(){
		ArrayList<String> board = boardService.getBt();
		return board;
	}
	
}
