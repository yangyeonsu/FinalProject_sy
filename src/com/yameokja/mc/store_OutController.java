package com.yameokja.mc;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class store_OutController
{
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/storeOutform.action", method={RequestMethod.POST, RequestMethod.GET})
	public String storeOuttForm(HttpServletRequest request, Model model)
	{
		String result = null;
		
		String usernum = request.getParameter("user_num");
		String stnum = request.getParameter("st_num");
		int user_num = Integer.parseInt(usernum);
		int st_num = Integer.parseInt(stnum);
		
		IstoreOutDAO dao = sqlSession.getMapper(IstoreOutDAO.class);
		
		model.addAttribute("placeNum", dao.placeNum(user_num, st_num));
		
		result = "store_Out.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/storeOutinsert.action", method=RequestMethod.POST)
	public String StoreOutinsert(HttpServletRequest request, HttpServletResponse response) 
	{	
		String result = null;
		
		IstoreOutDAO dao = sqlSession.getMapper(IstoreOutDAO.class);
		storeOutDTO sodto = new storeOutDTO();
		
		String usernum = request.getParameter("user_num");
		String stnum = request.getParameter("st_num");
		
		int user_num = Integer.parseInt(usernum);
		int st_num = Integer.parseInt(stnum);
		
		IstoreOutDAO dao = sqlSession.getMapper(IstoreOutDAO.class);
		
		dao.st_Out_apply(sodto);
		
		return "redirect:main.action";
	}
	
	
}
