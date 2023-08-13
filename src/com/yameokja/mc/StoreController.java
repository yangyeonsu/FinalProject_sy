package com.yameokja.mc;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StoreController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/storemain.action", method=RequestMethod.GET)
	public String storeMainLoad(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String result = "";
		
		/* int st_num = Integer.parseInt(str_st_num); */ 
		
		IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		
		
		String user_num = (String)session.getAttribute("user_num");
		
		UserDTO user = uDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		
		ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		int st_num;
		
		if(smDao.searchRepStore(user_num) == null)
			st_num = st_list.get(0).getSt_num();
		else
			st_num = smDao.searchRepStore(user_num);
		
		
		session.setAttribute("st_num", st_num);
				
		ArrayList<HashMap<String, String>> hashmaplist = smDao.rv_key_sum(st_num);
		
		ArrayList<String> rv_labels = new ArrayList<String>();
		ArrayList<String> rv_data = new ArrayList<String>();
		 
		for (HashMap<String, String> hashMap : hashmaplist)
		{
			rv_labels.add("'" +hashMap.get("RV_KEY_NAME")+"'");
			rv_data.add(String.valueOf(hashMap.get("COUNT_RV_KEY")));
		}
		
		
		ArrayList<HashMap<String, String>> star_transition = smDao.star_transition(st_num);
		
		ArrayList<String> star_labels = new ArrayList<String>();
		ArrayList<String> star_data = new ArrayList<String>();
		 
		for (HashMap<String, String> star : star_transition)
		{
			star_labels.add("'" +star.get("QUARTER_START_DATE")+"'");
			star_data.add(String.valueOf(star.get("AVERAGE_STAR_SCORE")));
		}
		
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("rv_labels", rv_labels.subList(0, 5));
		model.addAttribute("rv_data", rv_data.subList(0, 5));
		
		model.addAttribute("star_labels", star_labels);
		model.addAttribute("star_data", star_data);
		
		model.addAttribute("rv_key_list", smDao.rv_key_sum(st_num));
		model.addAttribute("rv_list", smDao.rv_list(st_num));
		
		model.addAttribute("alarm", uDao.userAlarm(user_num));
		
		result = "/WEB-INF/view/StoreMainPage.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/stdetailmodify.action", method = RequestMethod.POST)
	public String stDetailModify(HttpServletRequest request, Model model)
	{
		String result = "";
		
		HttpSession session = request.getSession();
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		IStoreMainDAO sdao = sqlSession.getMapper(IStoreMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		
		String user_num = (String)session.getAttribute("user_num");
		int st_num = (int) session.getAttribute("st_num");
		
		UserDTO user = uDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		
		// 가게가 선택할 수 있는 카테고리
		model.addAttribute("foodLabel", sdao.foodLabel());
		model.addAttribute("payLabel", sdao.payLabel());
		model.addAttribute("weekdayLabel", sdao.weekDayLabel());
		model.addAttribute("weekWeekendDayLabel", sdao.weekWeekendDayLabel());
		
		// 가게 기본 사항
		model.addAttribute("store", dao.store(st_num));
		
		// 가게 키워드
		ArrayList<StoreKeyDTO> stKeyList =  dao.stKeys(st_num);
		if(stKeyList.size()>0)
		{
			model.addAttribute("stKeys", stKeyList);
		}
		else
			model.addAttribute("stKeys", null);
		
		// 가게 영업시간 + 휴무일
		ArrayList<StoreOpencloseDTO> openClose =  dao.openClose(st_num);
		if(openClose.size() > 0)
		{
			model.addAttribute("openClose", openClose);
		}
		else
			model.addAttribute("openClose", null);
		
		
		// 가게 브레이크 타임
		ArrayList<StoreBreaktimeDTO> breakTime = dao.breakTime(st_num);
		if(breakTime.size() > 0)
		{
			model.addAttribute("breakTime", breakTime);
		}
		else
			model.addAttribute("breakTime", null);
		
		// 가게 결제수단
		ArrayList<String> stPayList = dao.stPay(st_num);
		model.addAttribute("stPayList", stPayList);
		
		// 가게 체크박스
		ArrayList<StoreCheckDTO> stCheckList = dao.stcheck(st_num);
		
		if(stCheckList.size()>0)
		{
			model.addAttribute("stCheckList", stCheckList);
		}
		else
		{
			model.addAttribute("stCheckList", null);
		}
		
		
		// 가게 메뉴
		ArrayList<StoreMenuDTO> menuLists = dao.menuLists(st_num);
		
		if(menuLists.size()>0)
		{
			model.addAttribute("menuLists", menuLists);
		}
		else
			model.addAttribute("menuLists", null);
		
		
		
		result = "/WEB-INF/view/st_detail_form.jsp";
		
		return result;
	}
  
	@RequestMapping(value = "/rvReply.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String rvReply(@RequestParam("rv_num") int rv_num, @RequestParam("reply_content") String reply_content, HttpServletRequest request, Model model)
	{	
		int rvReplynum = 0;
		
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		IStoreMainDAO dao = sqlSession.getMapper(IStoreMainDAO.class);
		
		rvReplynum = dao.reviewReply(rv_num, reply_content);
		
		
	    return "redirect:storemain.action";
  }
  
}
