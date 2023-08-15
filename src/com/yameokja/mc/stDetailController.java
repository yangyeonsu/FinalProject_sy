package com.yameokja.mc;

import java.time.LocalDate;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class stDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/stdetail-userview.action", method = RequestMethod.GET)
	public String stDetail(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		String result = "";
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		IMainDAO mdao = sqlSession.getMapper(IMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
		
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		//System.out.println(st_num);
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
		
		// user에게 등록된 가게가 있는지 조회 (사업자인지)
		int storeCheck = uDao.storeCheck(user_num);
		int user_st_check=0;
		
		if (storeCheck > 0)	// 사업자
		{
			// user에게 등록된 가게 리스트 조회(다수일 수 있음)
			ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
			
			// user에게 등록된 가게 리스트 안에 있는 st_num과 
			for (StoreDTO st_n : st_list)
			{   // 현재 상세보기할 st_num이 같을 때
				if(st_n.getSt_num() == st_num)
				{
					user_st_check=1;
				}
			}
		}
		
		model.addAttribute("user_st_check", user_st_check);
					
		// 가게 기본 사항
		model.addAttribute("store", dao.store(st_num));
		
		// 가게 찜 수
		model.addAttribute("clikeNum", dao.clikeNum(st_num));
		
		// 가게 키워드
		ArrayList<StoreKeyDTO> stKeyList =  dao.stKeys(st_num);
		
		if(stKeyList.size()>0)
		{
			model.addAttribute("stKeys", stKeyList);
		}
		else
			model.addAttribute("stKeys", null);
		
		// 가게 영업시간 + 휴무일
		model.addAttribute("openClose", dao.openClose(st_num));
		
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
		
		// 리뷰 키워드
		ArrayList<StoreReviewKeyDTO> reviewKeys = dao.reviewKeys(st_num);
		
		if(reviewKeys.size() > 0)
		{
			model.addAttribute("reviewKeys", reviewKeys);
		}
		else
			model.addAttribute("reviewKeys", null);
		
		// 가게 리뷰목록
		ArrayList<StoreReviewDTO> reviews = dao.reviews(st_num);
		
		if(reviews.size() > 0)
		{
			model.addAttribute("reviews", reviews);
		}
		else
			model.addAttribute("reviews", null);
		
		// 가게 리뷰 사진 목록
		ArrayList<StoreRvPhotoDTO> rvPhotos = dao.rvPhoto(st_num);
		
		model.addAttribute("rvPhotos", rvPhotos);
		
		if (comList.size() > 0)
			model.addAttribute("comList", mdao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		// 사용자의 해당 가게 추천/비추천 내역
		ArrayList<Integer> userRnList = dao.userRnList(st_num, user_num);
		ArrayList<Integer> userNrnList = dao.userNrnList(st_num, user_num);
		
		/*
		for (userRvRecDTO dto : userReviewList)
		{
			System.out.print(dto.getRec_nonrec_number() + "| ");
			System.out.println(dto.getRv_num());
		}
		*/
		
		/*
		 * if(userReviewList.size()>0) { model.addAttribute("userReviewList",
		 * userReviewList); } else model.addAttribute("userReviewList", null);
		 */
		model.addAttribute("userRnist", userRnList);
		model.addAttribute("userNrnList", userNrnList);
		
		model.addAttribute("userJjimList", mdao.userJjimSearch(user_num));
		
		result = "/WEB-INF/view/storeDetail.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/reviewrep.action")
		@ResponseBody
	public String insertReviewRep(@RequestParam("rv_num") int rv_num, @RequestParam("rep_rs_num") int rep_rs_num, @RequestParam("st_num") int st_num, HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		int resultNum = dao.reviewRepInsert(rv_num, user_num, rep_rs_num);
		ArrayList<StoreDetailDTO> stores = dao.store(st_num);
		int likenum = dao.clikeNum(st_num);
		//System.out.println("확인");
		
		String html = "";
		
		html += "<div class=\"likeRevC likeNum\">";
		html += "	찜 ❤ &nbsp; <span>" + likenum + "</span>";
		html += "</div>";
		html += "<div class=\"likeRevC score\">";
		html += "	별점 ⭐<span>" + stores.get(0).getStar_avg() + "</span>";
		html += "</div>";
		html += "<div class=\"likeRevC reviewNum\">";
		html += "	리뷰 수 &nbsp; <span>" + stores.get(0).getRv_count() + "</span>";
		html += "</div>";
		
		String result = String.valueOf(resultNum);
		
		return html;
	}
	
	@RequestMapping(value="/recinsertdelete.action")
		@ResponseBody
	public String recInsertDelete(@RequestParam("rv_num") int rv_num, @RequestParam("rec_nonrec_number") int rec_nonrec_number, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		//System.out.println("rv_num : " + rv_num);
		//System.out.println("user_num : " + user_num);
		//System.out.println("rnr : " + rec_nonrec_number);
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		String sr = dao.searchRec(rv_num, user_num);
		
		//System.out.println("sr : "+ sr);
		
		String html = "";
		int rec = 0;
		int nonrec = 0;

		
		html+= "{\"rv_num\":\""+rv_num+"\",";
		html+= "\"rec_nonrec_number\":\""+rec_nonrec_number+"\",";

		
		if(sr == null)	//없을 때
		{
			dao.reviewRecInsert(rv_num, user_num, rec_nonrec_number);
			rec = dao.reviewRecCount(rv_num, 1);
			nonrec = dao.reviewRecCount(rv_num, 2);
			html+= "\"rec\":\"" + rec + "\",";
			html+= "\"nonrec\":\"" + nonrec + "\",";
			html+= "\"action\":\"0\"}";
		}
		else if (Integer.parseInt(sr) != rec_nonrec_number) // 이미 선택된 것과 다른 추천을 눌렀을 떄
		{
			dao.reviewRecModify(rv_num, user_num, rec_nonrec_number);
			rec = dao.reviewRecCount(rv_num, 1);
			nonrec = dao.reviewRecCount(rv_num, 2);
			html+= "\"rec\":\"" + rec + "\",";
			html+= "\"nonrec\":\"" + nonrec + "\",";
			html+= "\"action\":\"1\"}";
		}
		else if (Integer.parseInt(sr) == rec_nonrec_number) // 같은 추천을 눌렀을 때
		{
			dao.reviewRecRemove(rv_num, user_num, rec_nonrec_number);
			rec = dao.reviewRecCount(rv_num, 1);
			nonrec = dao.reviewRecCount(rv_num, 2);
			html+= "\"rec\":\"" + rec + "\",";
			html+= "\"nonrec\":\"" + nonrec + "\",";
			html+= "\"action\":\"-1\"}";
		}

		//System.out.println(html);
		
		return html;
		
	}
	
	// 가게정보오류수정요청
	@RequestMapping(value = "/reqapply.action")
		@ResponseBody
	public int reqApply(@RequestParam("req_rs") String req_rs, @RequestParam("st_num") int st_num, @RequestParam("chbox_num") int chbox_num, HttpServletRequest request)
	{
		int result = 0;
		
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		// st_num 과 chbox_num으로 st_chbox_num 찾기
		int st_chbox_num = 0;
		st_chbox_num = dao.searchStChboxnum(st_num, chbox_num);
		
		// 찾은 st_chbox_num 으로 req_apply에 데이터 insert
		result = dao.reqApply(user_num, req_rs, st_chbox_num);
		
		return result;
	}
	
	//리뷰 작성 폼 연결
	@RequestMapping(value="/insertreveiwform.action")
	public String insertReviewForm(HttpServletRequest request, Model model)
	{
		String result = "";
		
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");

		int st_num = Integer.parseInt(request.getParameter("st_num"));
		String st_name = request.getParameter("st_name");
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		UserDTO user = udao.searchUserInfo(user_num, "num");
		
		LocalDate currentDate = LocalDate.now();
        int monthValue = currentDate.getMonthValue();
		
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
		
		model.addAttribute("user", user);
		
		model.addAttribute("st_num", st_num);
		model.addAttribute("st_name", st_name);
		
		//System.out.println("st_num: " + st_num);
		//System.out.println("st_name: " + st_name);
		//System.out.println("user_name: " + user_num);
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		ArrayList<StoreReviewKeyDTO> reviewKeywords = dao.reviewKeywords();
		
		model.addAttribute("reviewKeywords", reviewKeywords);

		result = "/WEB-INF/view/review_insert.jsp";
		
		return result;
	}
	
	// 리뷰 입력
	@RequestMapping(value="/insertreview.action")
	public String insertReview(HttpServletRequest request, Model model)
	{
		String result = null;
		// 사용자 정보 st_num
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
		// 가게 번호, 별점, 리뷰내용
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		int star_score = Integer.parseInt(request.getParameter("starHidden"));
		String rv_content = request.getParameter("reviewContent");
		
		System.out.println("st_num: " + st_num);
		System.out.println("user_name: " + user_num);
		
		// 리뷰키워드 받는 배열
		String[] rkArr = request.getParameterValues("rkArrHidden");
		System.out.println("rkArr[0]: " + rkArr[0]);
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		String[] rkList = null;
		rkList = rkArr[0].split(",");
		
		for (int i = 0; i < rkList.length; i++)
		{
			if(dao.rKeywordSearch(st_num, Integer.parseInt(rkList[i]))==null)
			{
				dao.rKeywordInsert(st_num, Integer.parseInt(rkList[i]));
			}
			else
				dao.rkeywordUpdate(st_num, Integer.parseInt(rkList[i]));
			
			System.out.println(rkList[i]);
		}
		
		// rv_box에 insert
		dao.reviewInsert(user_num, st_num, rv_content, star_score);
		
		// 가게 검색 키워드 받는 배열
		String[] skArr = request.getParameterValues("skArrHidden");
		
		String[] skList = null;
		skList = skArr[0].split(",");
		
		for (int i = 0; i < skList.length; i++)
		{
			// 작성된 가게 검색키워드가 없으면
			if(dao.skeywordSearch(st_num, skList[i]) == null)
			{	// 바로 insert
				dao.sKeywordInsert(st_num, skList[i]);
			}
			else // 작성된 가게 검색키워드가 있으면
				// 있는 가게 검색 키워드에 count += 1
				dao.skeywordUpdate(st_num, skList[i]);
		}

		
		// 가게상세페이지로 가기 위해 st_num을 model로 전송
		model.addAttribute("st_num", st_num);
		
		result = "redirect:stdetail-userview.action";
		
		return result;
	}

}
