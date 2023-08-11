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
public class storeOutController
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
		
		result = "storeOut.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/storeOutinsert.action", method=RequestMethod.POST)
	public String StoreOutinsert(HttpServletRequest request, HttpServletResponse response) 
	{	
		
		System.out.println("Received user_num: " + request.getParameter("user_num"));
		System.out.println("Received st_num: " + request.getParameter("st_num"));

		
		IstoreOutDAO dao = sqlSession.getMapper(IstoreOutDAO.class);
		
		try 
		{	
			String usernum = request.getParameter("user_num");
			String stnum = request.getParameter("st_num");
			
			
			if(usernum == null || "null".equals(usernum) || usernum.isEmpty() 
				|| stnum == null || "null".equals(stnum) || stnum.isEmpty()) 
			{
			    return "storeOutform.action?user_num=" + usernum + "&st_num=" + stnum;
			}
			
			if(usernum == null || usernum.trim().isEmpty() 
					||  stnum == null || stnum.trim().isEmpty()) 
			{
				return "storeOutform.action?user_num=" + usernum + "&st_num=" + stnum;
			}

			int user_num = Integer.parseInt(usernum);
			int st_num = Integer.parseInt(stnum);
			
			
			
			int res = dao.st_Out_apply(user_num, st_num);
			
			System.out.println("user_num: " + usernum);
			System.out.println("st_num: " + stnum);
			
			if (res == 0) 
			{
				return "storeOutform.action?user_num=" + user_num + "&st_num=" + st_num;
			}
				
		} 
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return "redirect:main.action";
		
	}
	
	
}
