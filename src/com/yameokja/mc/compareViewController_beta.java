package com.yameokja.mc;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
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
public class compareViewController_beta 
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="/compareview.action", method = RequestMethod.POST)
	public String stDetail(HttpServletRequest request, Model model, String checkedCompare)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		IcompareViewDAO dao = sqlSession.getMapper(IcompareViewDAO .class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		IMainDAO mdao = sqlSession.getMapper(IMainDAO.class);
		IstDetailDAO_userView sdDao = sqlSession.getMapper(IstDetailDAO_userView .class);
		IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
		
		// 사용자 정보
		UserDTO user = uDao.searchUserInfo(user_num, "num");
		
		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);
		
		model.addAttribute("user", user);
		
		// 사업자이면 가게 정보 함께 넘김
		ArrayList<StoreDTO> st_list=null;

		UserDTO userInfo = uDao.searchUserInfo(user.user_id, "id");
		session.setAttribute("user_num", userInfo.user_num);
		
		int storeCheck = uDao.storeCheck(userInfo.user_num);
		
		if (storeCheck > 0)
			st_list = smDao.searchStoreInfo(user_num);
	
		model.addAttribute("st_list", st_list);
		
		/*
		 * System.out.println(checkedCompare.substring(0, checkedCompare.length() - 1));
		 */
		String tmpStr = checkedCompare.substring(0, checkedCompare.length() - 1);
		String[] comparedStore = tmpStr.split(",");
		
		List<Integer> comList = mdao.getStoreComList(user_num);
		
		List<Integer> stnumList = new ArrayList<Integer>();
		
		for (String st_num : comparedStore)
		{
			stnumList.add(Integer.parseInt(st_num));
			/* System.out.println(st_num); */
			
			// 비교했던 테이블에 데이터 insert
			if(dao.comparedIsNull(user_num, Integer.parseInt(st_num))!=null)
				dao.comparedUpdate(user_num, Integer.parseInt(st_num));
			else
				dao.comparedInsert(user_num, Integer.parseInt(st_num));
		}
		/* System.out.println(comparedStore); */
		
		ArrayList<StoreDetailDTO> stores = dao.store(stnumList);
		
		ArrayList<StoreOpencloseDTO> openCloses = dao.openClose(stnumList);	//-- 비교함에서 선택한 가게 영업정보 리스트
		
		HashMap<Integer, Integer> clikeNumList = new HashMap<Integer, Integer>();
		
		// 가게 찜 수
		for (int i = 0; i < stnumList.size(); i++)
		{				
			clikeNumList.put(stnumList.get(i), sdDao.clikeNum(stnumList.get(i)));
		}
		
		model.addAttribute("clikeNumList", clikeNumList);
		
		
		ArrayList<ArrayList<StoreOpencloseDTO>> dbstoc = new ArrayList<ArrayList<StoreOpencloseDTO>>();
		
		for (int st_num : stnumList)
		{
			ArrayList<StoreOpencloseDTO> stOc = new ArrayList<StoreOpencloseDTO>();
			for (StoreOpencloseDTO opencloseDTO : openCloses)
			{
				if (opencloseDTO.getSt_num() == st_num)
				{
					//System.out.println(opencloseDTO.getSt_num());
					stOc.add(opencloseDTO);
				}
			}
			
			if (stOc.size() > 0)
				dbstoc.add(stOc);
			else
				dbstoc.add(null);
		}
		
		model.addAttribute("dbstoc", dbstoc);
		
		// 가게 브레이크 타임
		ArrayList<StoreBreaktimeDTO> breakTimeList = new ArrayList<StoreBreaktimeDTO>();	//-- 최종 가게들의 브레이크타임 리스트
		
		for (int i = 0; i < stnumList.size(); i++)
		{		
			ArrayList<StoreBreaktimeDTO> templists = new ArrayList<StoreBreaktimeDTO>();	
			templists = sdDao.breakTime(stnumList.get(i));									//-- 가게 하나 당의 브레이크타임 리스트
				
			for (int j = 0; j < templists.size(); j++)
			{
				breakTimeList.add(templists.get(j));	//--StoreBreaktimeDTO 객체 하나
			}
		}
		
		if(breakTimeList.size()>0)
		{
			model.addAttribute("breakTimeList", breakTimeList);
		}
		else
			model.addAttribute("breakTimeList", null);
		
		// 가게 메뉴 평균가격
		ArrayList<StoreMenuDTO> menuAvgLists = dao.menuAvg(stnumList);
		model.addAttribute("menuAvgLists", menuAvgLists);
		
		// 가게 메뉴
		ArrayList<StoreMenuDTO> menuLists = new ArrayList<StoreMenuDTO>();
		
		
		for (int i = 0; i < stnumList.size(); i++)
		{
			StoreMenuDTO dto = new StoreMenuDTO();
			if(dao.menuList(stnumList.get(i))!=null)
			{
				try
				{
					dto = dao.menuList(stnumList.get(i));
					menuLists.add(dto);
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}
		}
		
		if(menuLists.size()>0)
		{
			model.addAttribute("menuLists", menuLists);
		}
		else
			model.addAttribute("menuLists", null);
			
		
		//-- 비교함에서 선택한 가게 체크정보 리스트
		
		ArrayList<StoreCheckDTO> stChekList = new ArrayList<StoreCheckDTO>();
		
		for (int i = 0; i < stnumList.size(); i++)
		{
			//System.out.println("st_num : " + stnumList.get(i));
			ArrayList<StoreCheckDTO> templists = new ArrayList<StoreCheckDTO>();	
			templists = dao.comStcheck(stnumList.get(i));									//-- 가게 하나 당의 체크박스 리스트
				
			for (int j = 0; j < templists.size(); j++)
			{
				stChekList.add(templists.get(j));	//--StoreCheckDTO 객체 하나
				//System.out.println("chbox_num : " + templists.get(j).getChbox_num());
			}
		}
		
		if(stChekList.size()>0)
		{
			model.addAttribute("stChekList", stChekList);
		}
		else
			model.addAttribute("stChekList", null);		
		
		model.addAttribute("stnumList", stnumList);
		model.addAttribute("storeLen", stnumList.size());
		model.addAttribute("store", stores);
		model.addAttribute("openClose", openCloses);
		
		if (comList.size() > 0)
			model.addAttribute("comList", mdao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		model.addAttribute("userJjimList", mdao.userJjimSearch(user_num));
		
		result = "/WEB-INF/view/compareView-beta.jsp";
		
		return result;
	}
	
}

