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

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/main.action", method=RequestMethod.GET)
	public String storeList(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String user_num = (String)session.getAttribute("user_num");
		
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
		model.addAttribute("ibmat_list", dao.getStoreList(ibmatList));
		model.addAttribute("jjim_list", dao.getStoreList(jjimList));
		model.addAttribute("hot_list", dao.getStoreList(hotList));
		model.addAttribute("comList", dao.getStoreList(comList));
		 
		
		result = "/WEB-INF/view/user_main.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value="/search.action", method=RequestMethod.GET)
	public String searchStore(String keyword, Model model)
	{
		String result = "";
		
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		//keyword = "서울 김밥";
		
		List<String> keywordList = new ArrayList<String>();
		
		String[] keywordsplit = keyword.split("\\s");
		
		for (int i = 0; i < keywordsplit.length; i++)
		{
			keywordList.add("%" + keywordsplit[i] + "%");
		}
		
		// 검색을 한 단어들을 띄어쓰기로 구분하여 sql문에 넣을 준비 완.
		
		// ArrayList 안에 있는 단어들을 하나씩 꺼내서 getStoreSeachList 메소드 호출하여 가져온 integer 리스트를 다시 하나씩 꺼내서
		// 최종 integer리스트에 넣어서 getStoreList 에 넘겨주기
		
		List<Integer> finalKeyword = new ArrayList<Integer>();
		
		for (int i = 0; i < keywordList.size(); i++)
		{
			List<Integer> temp = null;
			temp = dao.getStoreSearchList(keywordList.get(i));
			
			for (int j = 0; j < temp.size(); j++)
			{
				finalKeyword.add(temp.get(j));
			}
		}
		
		model.addAttribute("searchList", dao.getStoreList(finalKeyword));
		
		// 비교함
		
		/*
		 * List<Integer> comList = dao.getStoreComList(user_num);
		 * model.addAttribute("com_list", dao.getStoreList(comList));
		 */
		 
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("firstSearchResult", finalKeyword);
		
		// 필터 검색을 위한 범례리스트
		model.addAttribute("regionList", dao.regionList());
		model.addAttribute("foodLabelList", dao.foodLabelList());
		model.addAttribute("stKeyList",dao.stKeyList());
		
		result = "MY_personal_main_2.jsp";
		
		return result;
	}
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public String filterSearchStore(Model model)
	{
		String result = "";
		
		// 가져온 것 : keyword + 1차 검색 결과 st_num - firstSearchResult
		// 보내야 할 것 : keyword + 필터검색 한 st_num - filterSearchResult
		
		result = "MY_personal_main_2.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/comparingInsert.action")
	public String comparingInsert(@RequestParam("user_num") String user_num, @RequestParam("st_num") String st_num, Model model)
	{
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		String html = "";
		
		if(dao.comparingSearch(user_num, Integer.parseInt(st_num)) == 0)	//-- 비교함에 없으면..
		{
			dao.comparingInsert(user_num, Integer.parseInt(st_num));  		//--비교함에 insert 완료
		}
		else
		{
			return html;
		}
		
		// 다시 새로 비교함 불러와서 innerHTML로 넣기
		List<Integer> newComparingList = (ArrayList<Integer>) dao.getStoreComList(user_num);
		
		List<StoreDTO> storeList = dao.getStoreList(newComparingList);
		
		for (StoreDTO store : storeList)
		{
			
			html += "<div class='comStoreDiv'>";
			html += "	<div class='comStoreImgDiv>";
			html += "		<label for='" + store.getSt_num() + "', class='stLabel'>";
			html += "			<input type='checkbox' class='comStImgCB' id='" + store.getSt_num() + "'>";
			html += " 			<imag class='comStImg' src='/images/" + store.getPhoto_link() + "'>";
			html += "		</label>";
			html += "	<div class='comStoreNameDiv'>";
			html += 	store.getSt_name();
			html += "	</div>";
			html += "</div>";
		}
		
		return html;
	}
	
	@RequestMapping(value="/jjimInsert.action")
	public String jjimSearch(@RequestParam("user_num") String user_num, @RequestParam("st_num") String st_num, Model model)
	{
		String result = "";

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		if (dao.jjimSearch(user_num, Integer.parseInt(st_num)) == 0)
		{
			dao.jjimInsert(user_num, Integer.parseInt(st_num));
			result = "찜 목록에 추가되었습니다!";
		}
		else
		{
			dao.jjimDelete(user_num, Integer.parseInt(st_num));
			result = "찜 목록에서 삭제되었습니다!";
		}
		
		return result;
	}
	
	@RequestMapping(value="/comdelete.action")
	public String comDelete(@RequestParam("user_num") String user_num, @RequestParam("st_num") String st_num, Model model)
	{
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		// 비교함 삭제 메소드 실행
		dao.comparingDelete(user_num, Integer.parseInt(st_num));
		
		String result = "비교함에서 삭제되었습니다.";
		
		return result;
	}

}
