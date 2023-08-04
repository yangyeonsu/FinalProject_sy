package com.yameokja.mc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

@Controller
public class AdminMainController
{
	@Autowired
	private SqlSession sqlSesion;
	
	@RequestMapping(value="/adminmain.action", method=RequestMethod.GET)
	public String allList(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		String admin_num = (String)session.getAttribute("admin_num");
		
		IAdminMainDAO dao = sqlSesion.getMapper(IAdminMainDAO.class);
		
		model.addAttribute("admin_name", dao.searchNum(admin_num, "num").getAdmin_name());
		model.addAttribute("rvList", dao.rvList());
		model.addAttribute("reqList", dao.reqList());
		model.addAttribute("objList", dao.objList());
		model.addAttribute("revoList", dao.revoList());
		model.addAttribute("inoutList", dao.inoutList());
		
		result = "/WEB-INF/view/main_admin.jsp";
		
		return result;
	}
	
}
