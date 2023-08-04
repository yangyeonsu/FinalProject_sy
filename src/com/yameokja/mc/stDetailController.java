package com.yameokja.mc;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class stDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/stDetail-userView.action", method = RequestMethod.GET)
	public String stDetail(HttpServletRequest request, Model model)
	{
		String result = "";
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		
		model.addAttribute("openClose", dao.openClose(st_num));
		model.addAttribute("breakTime", dao.breakTime(st_num));
		model.addAttribute("holiday", dao.holiday(st_num));
		model.addAttribute("store", dao.store(st_num));
		model.addAttribute("stName", dao.stName(st_num));
		model.addAttribute("clikeNum", dao.clikeNum(st_num));
		model.addAttribute("creviewScore", dao.creviewScore(st_num));
		model.addAttribute("creviewNum", dao.creviewNum(st_num));
		model.addAttribute("tel", dao.tel(st_num));
		model.addAttribute("lo", dao.lo(st_num));
		model.addAttribute("others", dao.others(st_num));
		model.addAttribute("menuLists", dao.menuLists(st_num));
		model.addAttribute("stKeys", dao.stKeys(st_num));
		model.addAttribute("reViews", dao.reViews(st_num));
		
		result = "/WEB-INF/view/storeDetail.jsp";
		
		return result;
	}
}
