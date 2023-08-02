package com.yameokja.mc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserMypageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/usermainpage.action", method = RequestMethod.GET)	
	public String studentList(Model model)
	{
		String result = null;
		
		IUserMypageDAO dao = sqlSession.getMapper(IUserMypageDAO.class);
		
		model.addAttribute("usermp_likelist", dao.usermp_likelist()); 
		model.addAttribute("usermp_rvlist", dao.usermp_rvlist());
		model.addAttribute("dao.usermp_risonstlist", dao.usermp_risonstlist()); 
		model.addAttribute("usermp_compare_box", dao.usermp_compare_box()); 
		model.addAttribute("usermp_ni", dao.usermp_ni()); 
		model.addAttribute("usermp_ukeyword", dao.usermp_ukeyword());
		model.addAttribute("usermp_point", dao.usermp_point());
		model.addAttribute("usermp_grade", dao.usermp_grade());
		
		result = "WEB-INF/view/userMyPage(0801).jsp";
		
		return result;
	}
}
