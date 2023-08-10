package com.yameokja.mc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class penaltyListController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/penaltyList.action", method=RequestMethod.GET)
	public String userstUpdatereListform(HttpServletRequest request, Model model) 
	{
	    HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    String result = null;
	    
	    int currentPage = 1; // 현재 페이지를 여기에 설정하세요
	    int itemsPerPage = 10; // 페이지당 아이템 수를 여기에 설정하세요
	    int startRow = (currentPage - 1) * itemsPerPage + 1;
	    int endRow = startRow + itemsPerPage - 1;
	    
	    IpenaltyListDAO dao = sqlSession.getMapper(IpenaltyListDAO.class);
	    
	    List<penaltyListDTO> penList = dao.penList(user_num, startRow, endRow);
	    
	    model.addAttribute("penList", penList);
	    result = "/WEB-INF/view/penaltyList-beta.jsp";
	    //result = "penaltyList-beta.jsp";
	    
	    return result;
	}
	
}
