package com.yameokja.mc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreregiController
{
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/storegiinsertform.action", method=RequestMethod.GET)
	public String SoreregiInsertForm()
	{
		String result = null;
		
		result = "WEB-INF/view/Store_Regi.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/storeregiinsert.action", method=RequestMethod.POST)
	public String StoreregiInsert(StoreregiDTO dto) 
	{
		IStoreregiDAO dao = sqlSession.getMapper(IStoreregiDAO.class);
		
		dao.add(dto);
		
		return "redirect:usermain.action";

	}
}
