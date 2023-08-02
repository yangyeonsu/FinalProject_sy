package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/main.action", method=RequestMethod.GET)
	public String storeList(Model model)
	{
		String result = "";
		
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		List<Integer> ibmatList = dao.getIbmatStNumber(); 
		List<Integer> jjimList = dao.getJjimStNumber(); 
		List<Integer> hotList = dao.getHotStNumber();
		List<Integer> comList = dao.getStoreComList("1");
		
		model.addAttribute("ibmatList", dao.getStoreList(ibmatList));
		model.addAttribute("jjimList", dao.getStoreList(jjimList));
		model.addAttribute("hotList", dao.getStoreList(hotList));
		model.addAttribute("comList", dao.getStoreList(comList));
		
		result = "MY_personal_main.jsp";
		
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
		 * List<Integer> comList = dao.getStoreComList("1");
		 * model.addAttribute("com_list", dao.getStoreList(comList));
		 */
		
		result = "MY_personal_main_2.jsp";
		
		return result;
	}
	

}
