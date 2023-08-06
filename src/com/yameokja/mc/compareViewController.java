package com.yameokja.mc;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class compareViewController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/compareView.action", method=RequestMethod.GET)
	public String compareView(HttpServletRequest request, Model model)
	{
		String result = "";
		
		IcompareViewDAO dao = sqlSession.getMapper(IcompareViewDAO.class);
		
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		
		model.addAttribute("", dao.nameLoCat(st_num));
		model.addAttribute("", dao.scoRe(st_num));
		model.addAttribute("", dao.openClose(st_num));
		model.addAttribute("", dao.others(st_num));
		model.addAttribute("", dao.menuLists(st_num));
		
		result = "/WEB-INF/view/compareView.jsp";

		return result;
	}
}
