package com.yameokja.mc;

import java.time.LocalDate;
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
public class stDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/stDetail-userView.action", method = RequestMethod.GET)
	public String stDetail(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		IMainDAO mdao = sqlSession.getMapper(IMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		
		// 사용자 정보
		UserDTO user = uDao.searchUserInfo(user_num, "num");
		
		List<Integer> comList = mdao.getStoreComList(user_num);
		
		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);
		
		model.addAttribute("user", user);
		model.addAttribute("openClose", dao.openClose(st_num));
		model.addAttribute("breakTime", dao.breakTime(st_num));
		model.addAttribute("holiday", dao.holiday(st_num));
		model.addAttribute("store", dao.store(st_num));
		model.addAttribute("stName", dao.stName(st_num));
		model.addAttribute("clikeNum", dao.clikeNum(st_num));
		model.addAttribute("creviewScore", dao.creviewScore(st_num));
		model.addAttribute("creviewNum", dao.creviewNum(st_num));
		model.addAttribute("tel", dao.tel(st_num));
		model.addAttribute("lo", dao.lo(st_num));
		model.addAttribute("others", dao.others(st_num));
		model.addAttribute("menuLists", dao.menuLists(st_num));
		model.addAttribute("stKeys", dao.stKeys(st_num));
		model.addAttribute("reViews", dao.reViews(st_num));
		
		if (comList.size() > 0)
			model.addAttribute("comList", mdao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		result = "/WEB-INF/view/storeDetail.jsp";
		
		return result;
	}
}
