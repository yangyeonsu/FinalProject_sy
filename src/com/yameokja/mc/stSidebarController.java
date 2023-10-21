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
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
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
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
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
	    
	    
	    
	    List<StinfoUpdaterelistDTO> stinfoupdatelist = dao.stinfoupdatelist(
	        user_num, 
	        startRow, 
	        endRow
	    );
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    model.addAttribute("user", user);
	    
	    IpenaltyListDAO plDao = sqlSession.getMapper(IpenaltyListDAO.class);
	    
	    List<penaltyListDTO> penList = plDao.penList(user_num, startRow, endRow);
	    
	    model.addAttribute("penList", penList);
	    result = "/WEB-INF/view/St_Penaltyre.jsp";
	    
	    return result;
	};
	
	// 이의제기요청 내역
	@RequestMapping(value="/objlist.action", method=RequestMethod.GET)
	public String stObjList(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
	    String user_num = (String) session.getAttribute("user_num");
	    
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
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
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
	    
	    
	    
	    List<StinfoUpdaterelistDTO> stinfoupdatelist = dao.stinfoupdatelist(
	        user_num, 
	        startRow, 
	        endRow
	    );
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    model.addAttribute("user", user);
	    
		result = "/WEB-INF/view/St_Appeal_Request.jsp";
	    
	    return result;
	}
	
	// 가게 등록/폐업 요청 내역
	@RequestMapping(value="/objlist.action", method=RequestMethod.GET)
	public String stInoutList(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
	    String user_num = (String) session.getAttribute("user_num");
	    
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
			user.setPoint_sum(udao.secondHalf(user_num).point_sum);
			user.setUser_grade(udao.firstHalf(user_num).user_grade);
		}
		else if(7 <= monthValue && monthValue <= 12)
		{
			user.setPoint_sum(udao.firstHalf(user_num).point_sum);
			user.setUser_grade(udao.secondHalf(user_num).user_grade);
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
	    
	    
	    
	    List<StinfoUpdaterelistDTO> stinfoupdatelist = dao.stinfoupdatelist(
	        user_num, 
	        startRow, 
	        endRow
	    );
	    
	    model.addAttribute("pageIndex", Paging.pageIndexList(currentPage, totalPage, actionName));
	    model.addAttribute("user", user);
	    
		result = "/WEB-INF/view/St_Appeal_Request.jsp";
	    
	    return result;
	}
}
