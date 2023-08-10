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
public class UserrvReportController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/user_rv_report.action", method=RequestMethod.GET)
	public String rvReportListform(HttpServletRequest request, Model model)
	{
	    HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    String result = null;
	    
	    IuserrvReportDAO dao = sqlSession.getMapper(IuserrvReportDAO.class);
	    
	    List<UserrvreportDTO> rvReportList = dao.user_rv_Report(user_num); // 여러 개의 DTO 객체를 리스트로 가져옴
	    
	    model.addAttribute("user_rv_Report", rvReportList); // 리스트를 전달
	    result = "/WEB-INF/view/user_rv_Report.jsp";
	    
	    return result;
	}
	
}
