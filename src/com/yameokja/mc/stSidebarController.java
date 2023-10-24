package com.yameokja.mc;

import java.time.LocalDate;
import java.util.ArrayList;
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
public class stSidebarController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 가게정보오류수정 요청 받은 내역
	@RequestMapping(value="/stinfoupdaterelist.action", method=RequestMethod.GET)
	public String stInfoUpdateReqList(HttpServletRequest request, Model model)
	{
	    HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
	    
	    String actionName = "/stinfoupdaterelist.action";
	    
	    String result = null;

	    IStinfoUpdaterelistDAO dao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
	    IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
	    IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
	    
	    UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
	    
		model.addAttribute("alarm", udao.userAlarm(user_num));
	    
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
	    int totalPage = dao.count_relist(user.getUser_id()) / itemsPerPage;
	    
	    if (dao.count_relist(user_num) % itemsPerPage != 0)
	    	totalPage++;
	    System.out.println(currentPage);
	    System.out.println(totalPage);
	    // 전체 페이지 수 보다 표시할 페이지가 큰 경우
		// 표시할 페이지를 전체 페이지로 처리
		// → 데이터를 삭제해서 페이지가 줄어들었을 경우...
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		// 데이터베이스에서 가져올 시작과 끝 위치	    
	    int startRow = (currentPage - 1) * itemsPerPage + 1;
	    int endRow = currentPage + itemsPerPage - 1;
	    
	    
	    
	    List<StinfoUpdaterelistDTO> stinfoupdatelist = dao.stinfoupdatelist(
	        user_num, 
	        startRow, 
	        endRow
	    );
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    model.addAttribute("user", user);
	    model.addAttribute("stinfoupdatelist", stinfoupdatelist);
	    result = "/WEB-INF/view/st_update_reLis.jsp";
	    
	    return result;
	};
	
	// 이의제기 폼
	@RequestMapping(value="/objectionform.action", method=RequestMethod.POST)
	public String stObjForm(HttpServletRequest request, Model model) 
	{	
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
        
        IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
        IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
        IStinfoUpdaterelistDAO suDao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
        
        UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    model.addAttribute("user", user);
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("alarm", udao.userAlarm(user_num));
		
		int req_num = Integer.parseInt(request.getParameter("reqnum"));
		
		model.addAttribute("req", suDao.reqRs(req_num));		
		
		result = "/WEB-INF/view/st_objectionForm.jsp";
	    
	    return result;
	}
	
	// 이의제기 신청
	@RequestMapping(value="/objapply.action", method=RequestMethod.POST)
	public String stObjApply(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
        
        IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
        IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
        IStinfoUpdaterelistDAO suDao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
        
        UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    model.addAttribute("user", user);
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("alarm", udao.userAlarm(user_num));
		
		int req_apply_num = Integer.parseInt(request.getParameter("req_apply_num"));

		int req_process_num = suDao.findReqProNum(req_apply_num);
		String obj_rs = request.getParameter("obj_rs");

		int check = suDao.objapply(req_process_num, obj_rs);
		
		result = "redirect:objlist.action";
		
		return result;		
	}
	
	// 이의제기요청 내역
	@RequestMapping(value="/objlist.action", method=RequestMethod.GET)
	public String stObjList(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
	    String user_num = (String) session.getAttribute("user_num");
	    
	    LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
	    
	    String actionName = "/objlist.action";
	    
	    String result = null;

	    IStinfoUpdaterelistDAO dao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
	    IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
	    IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
	    
	    UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("alarm", udao.userAlarm(user_num));	    
	    
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
	    System.out.println(currentPage);
	    System.out.println(totalPage);
	    // 전체 페이지 수 보다 표시할 페이지가 큰 경우
		// 표시할 페이지를 전체 페이지로 처리
		// → 데이터를 삭제해서 페이지가 줄어들었을 경우...
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		// 데이터베이스에서 가져올 시작과 끝 위치	    
	    int startRow = (currentPage - 1) * itemsPerPage + 1;
	    int endRow = currentPage + itemsPerPage - 1;
	    
	    
	    
	    List<ReportListDTO> stobjlist = dao.stobjlist(
	        user.getUser_id(), 
	        startRow, 
	        endRow
	    );
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    model.addAttribute("user", user);
	    model.addAttribute("stobjlist", stobjlist);
	    
		result = "/WEB-INF/view/St_Appeal_Request.jsp";
	    
	    return result;
	}
	
	// 패널티회수 폼
	@RequestMapping(value="/revokeform.action", method=RequestMethod.POST)
	public String stRevoForm(HttpServletRequest request, Model model) 
	{	
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
        
        IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
        IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
        IStinfoUpdaterelistDAO suDao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
        
        UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    model.addAttribute("user", user);
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("alarm", udao.userAlarm(user_num));
		
		int req_num = Integer.parseInt(request.getParameter("reqnum"));	
		
		model.addAttribute("req", suDao.reqRs(req_num));
		
		result = "/WEB-INF/view/st_penaltyRevokeForm.jsp";
	    
	    return result;
		
	}
	
	// 패널티 회수 신청
	@RequestMapping(value="/revoapply.action", method=RequestMethod.POST)
	public String stRevoApply(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
        
        IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
        IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
        IStinfoUpdaterelistDAO suDao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
        
        UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    model.addAttribute("user", user);
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("alarm", udao.userAlarm(user_num));
		
		int req_apply_num = Integer.parseInt(request.getParameter("req_apply_num"));

		int pen_grant_num = suDao.findPenNum(req_apply_num);
		int st_chbox_num = 0;
		String revo_rs = request.getParameter("revo_rs");

		int check = suDao.revoapply(pen_grant_num, st_chbox_num, revo_rs);
		
		result = "redirect:penaltylist.action";
		
		return result;		
	}
	
	
	// 패널티 회수 요청 내역
	@RequestMapping(value="/penaltylist.action", method=RequestMethod.GET)
	public String stPenaltyRevList(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
	    String user_num = (String)session.getAttribute("user_num");
	    
	    LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
	    
	    String actionName = "/stinfoupdaterelist.action";
	    
	    String result = null;

	    IStinfoUpdaterelistDAO dao = sqlSession.getMapper(IStinfoUpdaterelistDAO.class);
	    IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
	    IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
	    
	    UserDTO user = udao.searchUserInfo(user_num, "num");
	    if (1 <= monthValue && monthValue <= 6)
		{
			user.setPoint_sum(udao.secondHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.firstHalf(user_num).getUser_grade());
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).getPoint_sum());
			user.setUser_grade(udao.secondHalf(user_num).getUser_grade());
		}
	    
	    ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		model.addAttribute("st_list", st_list);
	    
	    
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
	    System.out.println(currentPage);
	    System.out.println(totalPage);
	    // 전체 페이지 수 보다 표시할 페이지가 큰 경우
		// 표시할 페이지를 전체 페이지로 처리
		// → 데이터를 삭제해서 페이지가 줄어들었을 경우...
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		// 데이터베이스에서 가져올 시작과 끝 위치	    
	    int startRow = (currentPage - 1) * itemsPerPage + 1;
	    int endRow = currentPage + itemsPerPage - 1;
	    
	    
	    
	    List<ReportListDTO> strevolist = dao.strevolist(
	        user.getUser_id(), 
	        startRow, 
	        endRow
	    );
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    model.addAttribute("user", user);
	    model.addAttribute("strevolist", strevolist);
	    
	    result = "/WEB-INF/view/St_Penaltyre.jsp";
	    
	    return result;
	};
}
