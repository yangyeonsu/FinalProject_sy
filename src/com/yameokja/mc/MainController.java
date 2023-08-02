package com.yameokja.mc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/main.action", method=RequestMethod.GET)
	public String storeList(Model model)
	{
		String result = "";
		
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		
		List<Integer> ibmat_list = dao.getIbmatStNumber(); 
		List<Integer> jjim_list = dao.getJjimStNumber(); 
		List<Integer> hot_list = dao.getHotStNumber();
	 
		
		model.addAttribute("ibmat_list", dao.getStoreList(ibmat_list));
		model.addAttribute("jjim_list", dao.getStoreList(jjim_list));
		model.addAttribute("hot_list", dao.getStoreList(hot_list));
		 
		
		result = "/WEB-INF/view/MY_personal_main(0801).jsp";
		
		return result;
	}

}
