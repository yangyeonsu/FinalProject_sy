package com.yameokja.mc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;


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
	
	@RequestMapping(value="/reviewListView.action", method=RequestMethod.GET)
	public String reviewListView(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		String admin_num = (String)session.getAttribute("admin_num");
		
		IAdminMainDAO dao = sqlSesion.getMapper(IAdminMainDAO.class);
		
		model.addAttribute("admin_name", dao.searchNum(admin_num, "num").getAdmin_name());
		model.addAttribute("rvList", dao.rvList());
		
		result = "/WEB-INF/view/admin_reviewListView.jsp";
		return result;
	}
	
	@RequestMapping(value="/storeErrView.action", method=RequestMethod.GET)
	public String storeErrView(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		String admin_num = (String)session.getAttribute("admin_num");
		
		IAdminMainDAO dao = sqlSesion.getMapper(IAdminMainDAO.class);
		
		model.addAttribute("admin_name", dao.searchNum(admin_num, "num").getAdmin_name());
		model.addAttribute("reqList", dao.reqList());
		
		result = "/WEB-INF/view/admin_storeErrView.jsp";
		return result;
	}
	
	@RequestMapping(value="/objectionView.action", method = RequestMethod.GET)
	public String objectionView(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		String admin_num = (String)session.getAttribute("admin_num");
		
		IAdminMainDAO dao = sqlSesion.getMapper(IAdminMainDAO.class);
		
		model.addAttribute("admin_name", dao.searchNum(admin_num, "num").getAdmin_name());
		model.addAttribute("objList", dao.objList());
		
		result = "/WEB-INF/view/admin_objectionView.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/penaltyView.action", method = RequestMethod.GET)
	public String penaltyView(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		String admin_num = (String)session.getAttribute("admin_num");
		
		IAdminMainDAO dao = sqlSesion.getMapper(IAdminMainDAO.class);
		
		model.addAttribute("admin_num", dao.searchNum(admin_num, "num").getAdmin_name());
		model.addAttribute("revoList", dao.revoList());
		
		result = "/WEB-INF/view/admin_penaltyView.jsp";
		return result;
	}
	
	@RequestMapping(value = "/inoutView.action", method = RequestMethod.GET)
	public String inoutView(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		String admin_num = (String)session.getAttribute("admin_num");
		
		IAdminMainDAO dao = sqlSesion.getMapper(IAdminMainDAO.class);
		
		model.addAttribute("admin_num", dao.searchNum(admin_num, "num").getAdmin_name());
		model.addAttribute("inoutList", dao.inoutList());
		
		result = "/WEB-INF/view/admin_inoutView.jsp";
		return result;
	}
	
	@RequestMapping(value = "/mainAdminView.action", method = RequestMethod.GET)
	public String mainAdminView(HttpServletRequest request, Model model)
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
	
	@RequestMapping(value="/reviewreportform.action", method=RequestMethod.GET)
	public String reviewReportForm(Model model,HttpServletRequest request, RvApplyViewDTO dto)
	{
		String result;
		
		int reviewNum = Integer.parseInt(request.getParameter("rep_apply_num"));
		
		IAdminFindDAO dao = sqlSesion.getMapper(IAdminFindDAO.class);
		
		model.addAttribute("review", dao.rvSearch(reviewNum));
		
		result = "/WEB-INF/view/reviewReportForm.jsp";
		
		return result;
	}
	
}
