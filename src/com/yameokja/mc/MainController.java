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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;


	@RequestMapping(value = "/main.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String storeList(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String) session.getAttribute("user_num");
		
		/* Random random = new Random(); */

		String result = "";

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		IUserDAO umDao = sqlSession.getMapper(IUserDAO.class);

		List<Integer> ibmatList = dao.getIbmatStNumber(user_num);
		List<Integer> jjimList = dao.getJjimStNumber(user_num);
		List<Integer> hotList = dao.getHotStNumber();
		List<Integer> comList = dao.getStoreComList(user_num);

		UserDTO user = umDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(umDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(umDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		
		if (ibmatList.size() > 0)
			model.addAttribute("ibmat_list", dao.getStoreList(ibmatList));
		else
			model.addAttribute("ibmat_list", null);
		
		if (jjimList.size() > 0)
			model.addAttribute("jjim_list", dao.getStoreList(jjimList));
		else
			model.addAttribute("jjim_list", null);

		if (hotList.size() >= 5)
		{
			hotList = hotList.subList(0, 5);
		}
		else
		{
			for (int i=0; i<=5-(hotList.size()); i++)
			{
				/* hotList.add(random.nextInt()); */
				hotList.add(i+1);
			}
			
			//System.out.println(hotList);
		}
		
		model.addAttribute("hot_list", dao.getStoreList(hotList));

		if (comList.size() > 0)
			model.addAttribute("comList", dao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		model.addAttribute("userJjimList", dao.userJjimSearch(user_num));
		
		model.addAttribute("alarm", umDao.userAlarm(user_num));

		result = "/WEB-INF/view/user_main.jsp";

		return result;
	}


	@RequestMapping(value = "/search.action", method= RequestMethod.POST)
	public String searchStore(HttpServletRequest request, Model model)
	{
		String result = "";
		
		// dao
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		IUserDAO umDao = sqlSession.getMapper(IUserDAO.class);
		
		// session에 저장된 user_num
		HttpSession session = request.getSession();
		String user_num = (String) session.getAttribute("user_num");

		// 검색어 처리
		String keyword = request.getParameter("typingArea");

		List<String> keywordList = new ArrayList<String>();

		String[] keywordsplit = keyword.trim().replaceAll("\\s+", " ").split("\\s");	// -> "[홍대, 김밥]"

		for (int i = 0; i < keywordsplit.length; i++)
		{
			keywordList.add("%" + keywordsplit[i] + "%");
		}

		// 검색을 한 단어들을 띄어쓰기로 구분하여 sql문에 넣을 준비 완.
		// ArrayList 안에 있는 단어들을 하나씩 꺼내서 getStoreSeachList 메소드 호출하여 가져온 integer 리스트를 다시
		// 하나씩 꺼내서
		// 최종 integer리스트에 넣어서 getStoreList 에 넘겨주기

		List<Integer> finalKeyword = new ArrayList<Integer>();

		for (int i = 0; i < keywordList.size(); i++)
		{
			List<Integer> temp = dao.getStoreSearchList(keywordList.get(i));

			for (int j = 0; j < temp.size(); j++)
			{
				//System.out.println(temp.get(j));
				finalKeyword.add(temp.get(j));
			}
		}
		
		// 검색 단어들로 찾은 storeDTO 리스트
		model.addAttribute("searchList", dao.getStoreList(finalKeyword));
		
		// 검색어
		model.addAttribute("keyword", keyword);
		
		// 검색 단어들로 찾은 st_num 리스트
		model.addAttribute("firstSearchResult", finalKeyword);

		// 필터 검색을 위한 범례리스트
		model.addAttribute("regionList", dao.regionList());
		model.addAttribute("foodLabelList", dao.foodLabelList());
		model.addAttribute("stKeyList", dao.stKeyList());
		
		// 비교함
		List<Integer> comList = dao.getStoreComList(user_num);
		
		if (comList.size() > 0)
			model.addAttribute("comList", dao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		
		// 사용자가 찜한 가게 리스트
		model.addAttribute("userJjimList", dao.userJjimSearch(user_num));
		
		// 사용자 정보
		UserDTO user = umDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(umDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(umDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);

		result = "/WEB-INF/view/user_main_2.jsp";

		return result;
	}
	
	@RequestMapping(value = "/comparinginsert.action", method = RequestMethod.POST)
		@ResponseBody
	public Object comparingInsert(@RequestParam("user_num") String user_num, @RequestParam("st_num") String st_num,  Model model)
	{
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		String html = "";
		
		int res = dao.comparingSearch(user_num, Integer.parseInt(st_num));

		if (res == 0) // -- 비교함에 없으면..
		{
			dao.comparingInsert(user_num, Integer.parseInt(st_num)); // -- 비교함에 insert 완료
			
			// 다시 새로 비교함 불러와서 innerHTML로 넣기
			List<Integer> newComparingList = (ArrayList<Integer>) dao.getStoreComList(user_num);
			
			List<StoreDTO> storeList = dao.getStoreList(newComparingList);
			
			model.addAttribute("comList", storeList);
			for (StoreDTO store : storeList)
			{
				html += "<div class='comStoreDiv'>";
				html += "	<div class='comStoreImgDiv'>";
				html += "		<button type=\"button\" value=\""+ String.valueOf(store.getSt_num()) + "\" class=\"comDelete\">X</button>";
				html += "		<label for='" + String.valueOf(store.getSt_num()) + "' class='stLabel'>";
				html += "			<input type='checkbox' class='comStImgCB' id='" + store.getSt_num() + "'>";
				
				if (store.getPhoto_link() == null || store.getPhoto_link().isEmpty())
				    html += " <img class=\"stImg\" src=\"/FinalProject_sy/images/logo_text.png\">";
				else
				    html += " <img class=\"stImg\" src=\"" + store.getPhoto_link() + "\">";
				/*
				 * if (store.getPhoto_link().equals("") || store.getPhoto_link() == (null)) html
				 * +=
				 * " 			<img class=\"stImg\" src=\"/FinalProject_sy/images/logo_text.png\">"
				 * ; else html +=
				 * " 			<img class'=\"stImg\" src=\""+store.getPhoto_link()+"\">";
				 */
				html += "		</label>";
				html += "	</div>";
				html += "	<div class=\"comStoreNameDiv\">"+store.getSt_name()+"</div>";
				html += "</div>";
			}
			if (storeList.size() < 10)
			{
				for (int i=0; i<(10-storeList.size()); i++)
				{
					html += "<div class=\"comStoreDiv\">";
					html += "<div class=\"comStoreImgDiv\">";
					html += "	<img class=\"comStNoImg\" src=\"images/comp_img01.png\">";
					html += "</div>";
					html += "<div class=\"comStoreNameDiv\"></div>";
					html += "</div>";
				}
			}
				
		}
		return html;
	}
	
	
	
	
	@RequestMapping(value = "/comdelete.action", method = RequestMethod.POST)
		@ResponseBody
	public Object comDelete(@RequestParam("user_num") String user_num, @RequestParam("st_num") String st_num, Model model)
	{
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		String html = "";

		int res = dao.comparingSearch(user_num, Integer.parseInt(st_num));
		
		if(res==0)
		{
			html = "";
		}
		else
		{
			// 비교함 삭제 메소드 실행
			dao.comparingDelete(user_num, Integer.parseInt(st_num));
			
			// 다시 새로 비교함 불러와서 innerHTML로 넣기
			List<Integer> newComparingList = (ArrayList<Integer>) dao.getStoreComList(user_num);
			
			//System.out.println(newComparingList);
			
			List<StoreDTO> storeList= null;
			
			if (newComparingList.size() > 0)
			{
				storeList = dao.getStoreList(newComparingList);
				
				for (StoreDTO store : storeList)
				{
					// System.out.println(store.getSt_name());
					html += "<div class='comStoreDiv'>";
					html += "	<div class='comStoreImgDiv'>";
					html += "		<button type=\"button\" value=\""+ store.getSt_num() + "\" class=\"comDelete\">X</button>";
					html += "		<label for='" + store.getSt_num() + "' class='stLabel'>";
					html += "			<input type='checkbox' class='comStImgCB' id='" + store.getSt_num() + "'>";

					if (store.getPhoto_link() == null || store.getPhoto_link().isEmpty())
					    html += " <img class=\"stImg\" src=\"/FinalProject_sy/images/logo_text.png\">";
					else
					    html += " <img class=\"stImg\" src=\"" + store.getPhoto_link() + "\">";

					html += "		</label>";
					html += "	</div>";
					html += "	<div class=\"comStoreNameDiv\">"+store.getSt_name()+"</div>";
					html += "</div>";
				}
				
				if (storeList.size() < 10)
				{
					for (int i=0; i<(10-storeList.size()); i++)
					{
						html += "<div class=\"comStoreDiv\">";
						html += "<div class=\"comStoreImgDiv\">";
						html += "	<img class=\"comStNoImg\" src=\"images/comp_img01.png\">";
						html += "</div>";
						html += "<div class=\"comStoreNameDiv\"></div>";
						html += "</div>";
					}
				}
			}
			else
			{
				for (int i=0; i<10; i++)
				{
					html += "<div class=\"comStoreDiv\">";
					html += "<div class=\"comStoreImgDiv\">";
					html += "	<img class=\"comStNoImg\" src=\"images/comp_img01.png\">";
					html += "</div>";
					html += "<div class=\"comStoreNameDiv\"></div>";
					html += "</div>";
				}
			}
			
			model.addAttribute("comList", storeList);
		}

		return html;
	}

	@RequestMapping(value = "/jjiminsertdelete.action", method = RequestMethod.POST)
		@ResponseBody
	public String jjimSearch(@RequestParam("user_num") String user_num, @RequestParam("st_num") String st_num, Model model)
	{
		String result = "";

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		if (dao.jjimSearch(user_num, Integer.parseInt(st_num)) == 0)
		{
			dao.jjimInsert(user_num, Integer.parseInt(st_num));
			result = "❤️";
		} else
		{
			dao.jjimDelete(user_num, Integer.parseInt(st_num));
			result = "🤍";
		}

		return result;
	}
	
	

	/*
	@RequestMapping(value = "/filterSearch.action", headers="application/json;"
		@ResponseBody
	public String filterSearchStore(@RequestBody Map<String, Object> requestData, Model model) {
	    @SuppressWarnings("unchecked")
		ArrayList<String> regionCbList = (ArrayList<String>) requestData.get("regionCbList");
	    @SuppressWarnings("unchecked")
		ArrayList<String> catCbList = (ArrayList<String>) requestData.get("catCbList");
	    @SuppressWarnings("unchecked")
		ArrayList<String> stKeyCbList = (ArrayList<String>) requestData.get("stKeyCbList");
	    @SuppressWarnings("unchecked")
		ArrayList<Integer> resultStoreList = (ArrayList<Integer>) requestData.get("resultStoreList");
	
		// 가져온 것 : keyword + 1차 검색 결과 st_num - firstSearchResult
		// 보내야 할 것 : keyword + 필터검색 한 st_num - filterSearchResult

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		System.out.println(resultStoreList);
		System.out.println(regionCbList);
		System.out.println(catCbList);
		System.out.println(stKeyCbList);
		
		ArrayList<Integer> resultArr = (ArrayList<Integer>) dao.filterSearchList(regionCbList, regionCbList, stKeyCbList, resultStoreList);
		
		ArrayList<StoreDTO> storeList = null;
		String html = "";

		storeList = dao.getStoreList(resultArr);
			
		for (StoreDTO store : storeList)
		{
			System.out.println(store.getSt_name());

			html += "<div class='store'>";
			html += "	<div class='stImgBtnDiv'>";
			html += "		<div class='stImgDiv'>";
			html += "			<c:set var = 'photo' value='" + store.getPhoto_link() + "'/>";
			html += "			<c:choose>";
			html += "				<c:when test='${empty photo}'>";
			html += "					<img class='stImg' src='<%=cp%>/images/logo_text.png'>";
			html += "				</c:when>";
			html += "				<c:otherwise>";
			html += "					<img class='stImg' src='<%=cp%>/${photo}'>";
			html += "				</c:otherwise>";
			html += "			</c:choose>";
			html += "		</div>";
			html += "		<div class='likeComAddBtn'>";
			html += "			<button type='button' class='comAddBtn' value='" + store.getSt_num() + "'></button>";
			html += "				<div class='likeBtnDiv'>";
			html += "					<c:set var='list' value='${userJjimList}' />";
			html += "					<c:set var='num' value='" + store.getSt_num() + "' />";
			html += "					<c:choose>";
			html += "						<c:when test='${list.contains(num)}'>";
			html += "							<button type='button' class='likeAddBtn'";
			html += "								value='" + store.getSt_num() + "'>❤️</button>";
			html += "						</c:when>";
			html += "						<c:otherwise>";
			html += "							<button type='button' class='likeAddBtn'";
			html += "								value='" + store.getSt_num() + "'>🤍</button>";
			html += "						</c:otherwise>";
			html += "					</c:choose>";
			html += "				</div>";
			html += "		</div>";
			html += "</div>";
			html += "<div class='name_reviewDiv'>";
			html += "		<div class='stName'>" + store.getSt_name() + "</div>";
			html += "			<div class='startReviewDivs'>";
			html += "				<span>⭐" + store.getStar_avg() + "</span>(" + store.getRv_count() + ")";
			html += "			</div>";
			html += "		</div>";
			html += "</div>";

		}
		return html;
	}
	*/

	@RequestMapping(value = "/filterSearch.action")
	public String filterSearchStore(HttpServletRequest request, Model model)
	{
		String result = "";
		
		// dao
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		IUserDAO umDao = sqlSession.getMapper(IUserDAO.class);
		
		// session에 저장된 user_num
		HttpSession session = request.getSession();
		String user_num = (String) session.getAttribute("user_num");

		// 검색어 처리
		String keyword = request.getParameter("typingArea");

		List<String> keywordList = new ArrayList<String>();

		String[] keywordsplit = keyword.trim().replaceAll("\\s+", " ").split("\\s");	// -> "[홍대, 김밥]"

		for (int i = 0; i < keywordsplit.length; i++)
		{
			keywordList.add("%" + keywordsplit[i] + "%");
		}

		// 검색을 한 단어들을 띄어쓰기로 구분하여 sql문에 넣을 준비 완.
		// ArrayList 안에 있는 단어들을 하나씩 꺼내서 getStoreSeachList 메소드 호출하여 가져온 integer 리스트를 다시
		// 하나씩 꺼내서
		// 최종 integer리스트에 넣어서 getStoreList 에 넘겨주기

		List<Integer> finalKeyword = new ArrayList<Integer>();		//-- 검색어로 검색한 가게 넘버

		for (int i = 0; i < keywordList.size(); i++)
		{
			List<Integer> temp = null;
			temp = dao.getStoreSearchList(keywordList.get(i));

			for (int j = 0; j < temp.size(); j++)
			{
				finalKeyword.add(temp.get(j));
			}
		}
		
		// 검색어
		model.addAttribute("keyword", keyword);
		
		// 검색 단어들로 찾은 st_num 리스트
		model.addAttribute("firstSearchResult", finalKeyword);

		// 필터 검색을 위한 범례리스트
		model.addAttribute("regionList", dao.regionList());
		model.addAttribute("foodLabelList", dao.foodLabelList());
		model.addAttribute("stKeyList", dao.stKeyList());
		
		// 비교함
		List<Integer> comList = dao.getStoreComList(user_num);
		
		if (comList.size() > 0)
			model.addAttribute("comList", dao.getStoreList(comList));
		else
			model.addAttribute("comList", null);
		
		
		// 사용자가 찜한 가게 리스트
		model.addAttribute("userJjimList", dao.userJjimSearch(user_num));
		
		// 사용자 정보
		UserDTO user = umDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(umDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(umDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		
		String[] regionCbList = null;
		String[] catCbList = null;
		String[] stKeyCbList = null;
		
		String[] regionChk = request.getParameterValues("regionChk");
		String[] foodlabelChk = request.getParameterValues("foodlabelChk");
		String[] stKeyChk = request.getParameterValues("stKeyChk");
		
		regionCbList = regionChk[0].split(",");
		catCbList = foodlabelChk[0].split(",");
		stKeyCbList = stKeyChk[0].split(",");
		
		if (regionCbList.length > 0)
			model.addAttribute("regionChecked", regionCbList);
		else
		{
			model.addAttribute("regionChecked", null);
			regionCbList = null;
		}
		
		if (catCbList.length > 0)
			model.addAttribute("catChecked", catCbList);
		else
		{
			model.addAttribute("catChecked", null);
			catCbList = null;
		}
		
		if (stKeyCbList.length > 0)
			model.addAttribute("stKeyChecked", stKeyCbList);
		else
		{
			model.addAttribute("stKeyChecked", null);
			stKeyCbList = null;
		}
		
		ArrayList<Integer> filterResult = dao.filterSearchList(regionCbList, catCbList, stKeyCbList, finalKeyword);


		if(filterResult == null)
		{
			model.addAttribute("searhList", null);
		}
		else
		{
			/*
			System.out.println("filterSearchList : ");
			
			for (Integer integer : filterResult)
			{
				System.out.println(integer);
			}
			*/
			
			ArrayList<StoreDTO> searchList = dao.getStoreList(filterResult);
			
			model.addAttribute("searchList", searchList);
		}

		result = "/WEB-INF/view/user_main_2.jsp";
		
		return result;
	}
}
