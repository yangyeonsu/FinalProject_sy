package com.yameokja.mc;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/*import java.util.ArrayList;
import java.util.HashMap;*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/yameokja.action", method=RequestMethod.GET)
	public String firstPageLoad(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String result = "";
		
		if (session != null && session.getAttribute("user_num") != null && !session.getAttribute("user_num").equals(""))
		{
			result = "redirect:main.action";
			
			return result;
		}
		 
		
		String check = "";
		
		if (session.getAttribute("check") != null)
		{
			check = (String)session.getAttribute("check");
			if (check.equals("Loginfail"))
				session.setAttribute("check", "fail");
			else
				session.removeAttribute("check");
		}
		
		
		result = "/WEB-INF/view/yameokja_login.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value="/login.action", method=RequestMethod.POST)
	public String storeMainLoad(HttpServletRequest request, Model model, UserDTO user)
	{
		HttpSession session = request.getSession();

		String result = "";
		int check = 0;
		
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		IAdminMainDAO iDao = sqlSession.getMapper(IAdminMainDAO.class);
		
		check = uDao.userLoginCheck(user.user_id, user.user_pw);
		
		if (check == 1)
		{
			UserDTO userInfo = uDao.searchUserInfo(user.user_id, "id");
			session.setAttribute("user_num", userInfo.user_num);
			
			int storeCheck = uDao.storeCheck(userInfo.user_num);
			
			if (storeCheck > 0)
				result = "redirect:storemain.action";
			else
				result = "redirect:main.action";
		}
		else if (check == 0)
		{
			check = iDao.adminLoginCheck(user.user_id, user.user_pw);
			
			if (check == 1)
			{
				String admin_num = iDao.searchNum(user.user_id, "id").getAdmin_num();
				session.setAttribute("admin_num", admin_num);
				
				result = "redirect:adminmain.action";
			}
			else
			{
				session.setAttribute("check", "Loginfail");
				result = "redirect:yameokja.action";
			}
		}
		
		return result;
	}
	
	@RequestMapping(value="/join.action", method=RequestMethod.POST)
	public String join(Model model)
	{
		String result = "";
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		
		// 입맛키워드 범례
	    model.addAttribute("tasteKLabel", udao.tasteKeyword());
		
		result = "/WEB-INF/view/yameokja_join.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/idduplicheck.action", method=RequestMethod.POST)
		@ResponseBody
	public String idCheck(@RequestParam("user_id") String user_id, String userid)
	{
		String result = "";
		
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		int count = udao.idCheck(user_id);
		
		System.out.println(count);
		
		result += "{\"count\":\""+count+"\"}";
		
		return result;
	}
	
	
	@RequestMapping(value="/nickduplicheck.action", method=RequestMethod.POST)
		@ResponseBody
	public String nickCheck(@RequestParam("user_nick") String user_nick, String usernick)
	{
		String result = "";
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		int count = udao.nickCheck(user_nick);
		
		System.out.println("user_nick : " + user_nick);
		System.out.println("count : " + count);
		
		result += "{\"count\":\""+count+"\"}";
		
		return result;
	}
	
	
	@RequestMapping(value="/joinsend.action", method=RequestMethod.POST)
	public String joinSend(HttpServletRequest request, UserDTO user)
	{
		String result = "";
		String user_num = "";
		int check = 0;
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		do
		{
			user_num = randStr();
			check = dao.userNumCheck(user_num);
			
		} while (check != 0);
		
		user.setUser_num(user_num);
		
		int count = dao.joinSend(user);
		
		String user_email = request.getParameter("userEmailFinal");
		System.out.println("user_email : " + user_email);
		
		String[] ibmatCbList = null;
		String[] ibmatChk = request.getParameterValues("ibmatChk");
		//System.out.println(ibmatChk.length);
		//System.out.println(ibmatChk[0]);
		
		if(user_email != "")
		{
			// 사용자 이메일 update
			dao.userEmailUpdate(user_num, user_email);
		}
		
		// 사용자 입맛 키워드 추가 및 수정
		if (ibmatChk[0] != "")
		{
			ibmatCbList = ibmatChk[0].split(",");
			System.out.println("ibmatCbList : " + ibmatCbList[0]);
			
			for (String ibmat : ibmatCbList)
			{
				System.out.println("입맛키워드 : " + ibmat);
				// 사용자 입맛 키워드 insert
				dao.userIbmatInsert(user_num, Integer.parseInt(ibmat));			
			}
		}

		result = "redirect:yameokja.action";
		
		return result;
	}
	
	
	
	
	String randStr()
	{
		Random rnd =new Random();

		StringBuffer buf =new StringBuffer();

		for(int i=0; i<10; i++)
		{

		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. 
			// true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.

		    if(rnd.nextBoolean())
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    else
		    	buf.append((rnd.nextInt(10)));

		}

		return buf.toString();
	}
	
	
	@RequestMapping(value="/usermypage.action", method = {RequestMethod.POST, RequestMethod.GET})	
	public String studentList(HttpServletRequest requset, Model model)
	{
		HttpSession session = requset.getSession();
		
		String user_num = (String)session.getAttribute("user_num");
		String result = "";
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
		
        IMainDAO idao = sqlSession.getMapper(IMainDAO.class);
        IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
        
		List<StoreDTO> jimList = udao.searchLikeList(user_num);
		model.addAttribute("likelist", jimList);
		
		/* System.out.println(comList); */
		
		UserDTO user = udao.searchUserInfo(user_num, "num");
		
		if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
		}
		
		// 비교함 내역
		List<Integer> comList = idao.getStoreComList(user_num);
		
		if (comList.size() > 0)
			model.addAttribute("comList", idao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		/*
		List<Integer> ibmatList = idao.getIbmatStNumber(user_num);
		List<Integer> jjimList = idao.getJjimStNumber(user_num);
		
		if (ibmatList.size() > 0)
			model.addAttribute("ibmat_list", idao.getStoreList(ibmatList));
		else
			model.addAttribute("ibmat_list", null);
		
		if (jjimList.size() > 0)
			model.addAttribute("likelist", idao.getStoreList(jjimList));
		else
			model.addAttribute("likelist", null);
		*/
		
		// 찜한 가게 내역
		List<Integer> jjimList = idao.userJjimSearch(user_num);
		
		if (jjimList.size() > 0)
			model.addAttribute("userJjimList", idao.getStoreList(jjimList));
		else
			model.addAttribute("userJjimList", null);
		
		// 사용자 정보
		model.addAttribute("user", user);
		
		// 작성한 리뷰 내역
		model.addAttribute("rvlist", udao.searchRvList(user_num));
		
		// 비교했던 가게 내역
		model.addAttribute("comparedlist", udao.searchComparedList(user_num));
		
		// 입맛키워드
		model.addAttribute("tastekeyword", udao.searchTasteKeyword(user_num));
		
		model.addAttribute("alarm", udao.userAlarm(user_num));
		String modifyOk =  (String) session.getAttribute("modifyOk");
		model.addAttribute("modifyOk", modifyOk);
		
		session.removeAttribute("modifyOk");
		
		result = "WEB-INF/view/user_MyPage.jsp";
		
		return result;
	}
	
	// 사용자가 가게정보오류수정 요청한 내역
	@RequestMapping(value="/user_stupdate_relist.action", method=RequestMethod.GET)
	public String userstUpdatereListform(HttpServletRequest request, Model model)
	{
	    HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
	    
	    String actionName = "/user_stupdate_relist.action";
	    
	    String result = null;
	    
	    
	    
	    
	    
	    IUserSidebarDAO dao = sqlSession.getMapper(IUserSidebarDAO.class);
	    IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
	    
	    UserDTO user = udao.searchUserInfo(user_num, "num");
	    
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
		}
	    
	    // 이전 페이지(?)로부터 넘어온 게시물 번호 수신
		String strNum = request.getParameter("num");
		int num=0;
		if (strNum != null)
			num = Integer.parseInt(strNum);
		
		// 이전 페이지(?)로부터 넘어온 페이지 번호 수신
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
	    
		// 페이지당 아이템 수를 여기에 설정하세요
	    int itemsPerPage = 10;
	    
	    // 전체 데이터 수 구해서 총 페이지 수 계산
	    int totalPage = dao.count_relist(user_num) / itemsPerPage;
	    
	    if (dao.count_relist(user_num) % itemsPerPage != 0)
	    	totalPage++;
	    //System.out.println(currentPage);
	    //System.out.println(totalPage);
	    // 전체 페이지 수 보다 표시할 페이지가 큰 경우
		// 표시할 페이지를 전체 페이지로 처리
		// → 데이터를 삭제해서 페이지가 줄어들었을 경우...
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		// 데이터베이스에서 가져올 시작과 끝 위치	    
	    int startRow = (currentPage - 1) * itemsPerPage + 1;
	    int endRow = currentPage + itemsPerPage - 1;
	    
		/*
		 * System.out.println(actionName);
		 * 
		 * System.out.println(Paging.pageIndexList(currentPage, totalPage, actionName));
		 */
	    
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    List<UserStupdaterelistDTO> user_stupdate_relist = dao.user_stupdate_relist(user_num, startRow, endRow);
	    //System.out.println(user_stupdate_relist);
	    model.addAttribute("user", user);
	    model.addAttribute("stupdateReList", user_stupdate_relist);
	    result = "/WEB-INF/view/user_StUpdate_reList.jsp";
	    
	    return result;
	};
	
	// 사용자가 리뷰 신고한 내역
	@RequestMapping(value="/user_rv_report.action", method=RequestMethod.GET)
	public String rvReportListform(HttpServletRequest request, Model model)
	{
	    HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
	    
	    String actionName = "/user_rv_report.action";
	    
	    String result = null;
	    
	    IUserSidebarDAO dao = sqlSession.getMapper(IUserSidebarDAO.class);
	    IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
	    
	    UserDTO user = udao.searchUserInfo(user_num, "num");
	    
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
		}
	    
	    // 이전 페이지(?)로부터 넘어온 게시물 번호 수신
 		String strNum = request.getParameter("num");
 		int num=0;
 		if (strNum != null)
 			num = Integer.parseInt(strNum);
 		
 		// 이전 페이지(?)로부터 넘어온 페이지 번호 수신
 		String pageNum = request.getParameter("pageNum");
 		int currentPage = 1;
 		if (pageNum != null)
 			currentPage = Integer.parseInt(pageNum);
 	    
 		// 페이지당 아이템 수를 여기에 설정하세요
 	    int itemsPerPage = 10;
 	    
 	    // 전체 데이터 수 구해서 총 페이지 수 계산
 	    int totalPage = dao.count_replist(user_num) / itemsPerPage;
 	    
 	    if (dao.count_replist(user_num) % itemsPerPage != 0)
 	    	totalPage++;
 	    //System.out.println(currentPage);
 	    //System.out.println(totalPage);
 	    // 전체 페이지 수 보다 표시할 페이지가 큰 경우
 		// 표시할 페이지를 전체 페이지로 처리
 		// → 데이터를 삭제해서 페이지가 줄어들었을 경우...
 		if (currentPage > totalPage)
 			currentPage = totalPage;
 		
 		// 데이터베이스에서 가져올 시작과 끝 위치	    
 	    int startRow = (currentPage - 1) * itemsPerPage + 1;
 	    int endRow = currentPage + itemsPerPage - 1;
	    
 	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    List<UserrvreportDTO> rvReportList = dao.user_rv_Report(user_num, startRow, endRow); // 여러 개의 DTO 객체를 리스트로 가져옴
	    //System.out.println(rvReportList);
	    model.addAttribute("rvReportList", rvReportList); // 리스트를 전달
	    model.addAttribute("user", user);
	    result = "/WEB-INF/view/user_rv_Report.jsp";
	    
	    return result;
	};
	
	// 사용자가 작성한 리뷰에 대해 신고 받은 내역
	@RequestMapping(value="/userrvpenalty.action", method=RequestMethod.GET)
	public String rvPenaltyList(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
	    
	    String actionName = "/userrvpenalty.action";
	    
	    String result = null;
	    
	    IUserSidebarDAO dao = sqlSession.getMapper(IUserSidebarDAO.class);
	    IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
	    
	    // 사용자 정보
	    UserDTO user = udao.searchUserInfo(user_num, "num");
	    
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
		}
	    
	    // 페이징 처리
	    // 이전 페이지(?)로부터 넘어온 게시물 번호 수신
 		String strNum = request.getParameter("num");
 		int num=0;
 		if (strNum != null)
 			num = Integer.parseInt(strNum);
 		
 		// 이전 페이지(?)로부터 넘어온 페이지 번호 수신
 		String pageNum = request.getParameter("pageNum");
 		int currentPage = 1;
 		if (pageNum != null)
 			currentPage = Integer.parseInt(pageNum);
 	    
 		// 페이지당 아이템 수를 여기에 설정하세요
 	    int itemsPerPage = 10;
 	    
 	    // 전체 데이터 수 구해서 총 페이지 수 계산
 	    int totalPage = dao.count_penlist(user_num) / itemsPerPage;
 	    
 	    if (dao.count_replist(user_num) % itemsPerPage != 0)
 	    	totalPage++;
 	    //System.out.println(currentPage);
 	    //System.out.println(totalPage);
 	    // 전체 페이지 수 보다 표시할 페이지가 큰 경우
 		// 표시할 페이지를 전체 페이지로 처리
 		// → 데이터를 삭제해서 페이지가 줄어들었을 경우...
 		if (currentPage > totalPage)
 			currentPage = totalPage;
 		
 		// 데이터베이스에서 가져올 시작과 끝 위치	    
 	    int startRow = (currentPage - 1) * itemsPerPage + 1;
 	    int endRow = currentPage + itemsPerPage - 1;
	    
 	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
 	    
 	    // 데이터베이스에서 사용자가 작성한 리뷰에 대해 신고 받은 내역 가져오기
 	    List<penaltyListDTO> penaltyList = dao.user_penList(user_num, startRow, endRow);
 	    //System.out.println(penaltyList);
	    model.addAttribute("penaltyList", penaltyList); // 리스트를 전달
	    model.addAttribute("user", user);
 	    
		result = "/WEB-INF/view/user_penaltyList.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/logout.action", method = {RequestMethod.POST, RequestMethod.GET})	
	public String logout(HttpServletRequest requset)
	{
		HttpSession session = requset.getSession();
		
		String result = "";
		
		session.removeAttribute("user_num");
		session.removeAttribute("admin_num");
		session.removeAttribute("st_num");
		
		result = "redirect:yameokja.action";
		
		return result;
	}
	
	@RequestMapping(value="/usermodify.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyCheck(HttpServletRequest request, Model model, String user_num, String user_pw)
	{
		HttpSession session = request.getSession();
		
		//String user_num = (String) request.getAttribute("user_num");
		//String user_pw = (String) request.getAttribute("user_pw");
		
		String result = "";
		
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		
		if(user_pw == "")
		{
			result = "redirect:usermypage.action";
			session.setAttribute("modifyOk", "fail");
		}
		else
		{
			int check = uDao.userPwCheck(user_num, user_pw);
			
			if(check==1)
			{
				result = "redirect:usermodifyOk.action";
			}
			else
			{
				result = "redirect:usermypage.action";
				session.setAttribute("modifyOk", "fail");
			}
		}
		
		return result;
	}
	
	@RequestMapping(value="/usermodifyOk.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		
		String result = "";
		
		String user_num = (String)session.getAttribute("user_num");
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
        
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		UserDTO user = udao.searchUserInfo(user_num, "num");
		
		if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
		}
	    
	    UserDTO modify = udao.userModify(user_num);
	    
	    // 입맛키워드 범례
	    model.addAttribute("tasteKLabel", udao.tasteKeyword());
	    
	    List<TasteLabelDTO> userTasteK = udao.searchTasteKeyword(user_num);

		List<Integer> userTasteKLabel = new ArrayList<Integer>();
		
		if(userTasteK.size() > 0)
		{
			for (TasteLabelDTO userTaste : userTasteK)
			{
				userTasteKLabel.add(userTaste.getTaste_num());
			}
		}
		
		model.addAttribute("userTasteKLabel", userTasteKLabel);
		
	 	//System.out.println(user_num);
	    //System.out.println(user.user_tel);
	    //System.out.println(user.getUser_ssn1());
	 	model.addAttribute("user", user);
	    model.addAttribute("modify", modify);
		
		result = "WEB-INF/view/user_modify.jsp";
		
		return result;
	}
	
	/*
	@RequestMapping(value = "/nicknamecheck.action", method = RequestMethod.POST)
		@ResponseBody
	public String nickName(@RequestParam("nickName") String nickName, HttpServletRequest request, Model model, UserDTO user)
	{
		String result = "";
		
		System.out.println(nickName);
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		int count = udao.nickCheck(nickName);
		
		System.out.println(nickName);
		System.out.println(count);
		
		result += "{\"count\":\""+count+"\"}";
		
		return result;
	}
	*/
	
	@RequestMapping(value="/userinfomodify.action", method = RequestMethod.POST)
	public String userInfoModify(HttpServletRequest request, Model model)
	{
		String result = "";
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		String user_num = request.getParameter("userNum");
		//System.out.println("user_num : " + user_num);
		String user_pw = request.getParameter("userPwCheck");
		//System.out.println("user_pw : " + user_pw);
		String user_nickname = request.getParameter("userNickName");
		//System.out.println("user_nickname : " + user_nickname);
		String user_email = request.getParameter("userEmailFinal");
		//System.out.println("user_email : " + user_email);
		
		String[] ibmatCbList = null;
		String[] ibmatChk = request.getParameterValues("ibmatChk");
		//System.out.println(ibmatChk.length);
		//System.out.println(ibmatChk[0]);
		
		if(user_pw != "")
		{
			//System.out.println("비번 변경");
			// 사용자 비밀번호 update
			dao.userPwUpdate(user_num, user_pw);
		}
		
		if((dao.nickCheck(user_nickname)==0) && (user_nickname != ""))
		{
			// 사용자 닉네임 update
			dao.userNicknameUpdate(user_num, user_nickname);
		}
		
		if(user_email != "")
		{
			// 사용자 이메일 update
			dao.userEmailUpdate(user_num, user_email);
		}
		
		// 사용자 입맛 키워드 없앰
		if(ibmatChk[0] == "")
		{
			// 사용자 입맛 키워드 delete
			dao.userIbmatDelete(user_num);
		}
		
		// 사용자 입맛 키워드 추가 및 수정
		if (ibmatChk[0] != "")
		{
			ibmatCbList = ibmatChk[0].split(",");
			System.out.println("ibmatCbList : " + ibmatCbList[0]);
			
			// 사용자 입맛 키워드 delete
			dao.userIbmatDelete(user_num);
			
			for (String ibmat : ibmatCbList)
			{
				// 사용자 입맛 키워드 insert
				dao.userIbmatInsert(user_num, Integer.parseInt(ibmat));			
			}
		}
		
		//int user = dao.userModify(user_num);
		//model.addAttribute("user", user);
		result = "redirect:usermypage.action";
		
		return result;
	}
	
	@RequestMapping(value="/userinfosearch.action")
	public String userInfoSearch(HttpServletRequest request, Model model)
	{
		return "WEB-INF/view/user_info_search.jsp";
	}
}
