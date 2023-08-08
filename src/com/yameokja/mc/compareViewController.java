package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class compareViewController 
{
	@Autowired
	private SqlSession sqlSession;
	


	/*
	 @RequestMapping(value="/compareView.action", method=RequestMethod.GET) public
	 String compareView(HttpServletRequest request, Model model)
	 
    
	@RequestMapping(value="/compareView.action", method=RequestMethod.POST)
	public String compareView(HttpServletRequest request, HttpServletResponse response, Model model)
	{
		IcompareViewDAO dao = sqlSession.getMapper(IcompareViewDAO.class);

		int[] st_nums = new int[3];
		
		IUserDAO udao = sqlSession.getMapper(IUserDAO.class);
		
		/*
		 * int st_num1 = Integer.parseInt(request.getParameter("st_num1")); int st_num2
		 * = Integer.parseInt(request.getParameter("st_num2")); int st_num3 =
		 * Integer.parseInt(request.getParameter("st_num3"));
		 */
		/* System.out.println(request.getParameter("stnum"));
		
		String[] str = request.getParameterValues("checkedCompare");
		String[] stArr = null;
		
		System.out.println(str);
		
		stArr = str[0].split(",");
		
		System.out.println(stArr);
		
		System.out.println(str);
		
		System.out.println(stArr);
		
		System.out.println(str); 
		
		for (String string : stArr)
		{
			st_nums[0] = Integer.parseInt(request.getParameter("st_num1")); 
			st_nums[1] = Integer.parseInt(request.getParameter("st_num2")); 
			System.out.println("Before: " + st_nums[2]);
			st_nums[2] = request.getParameter("st_num3") != null ? Integer.parseInt(request.getParameter("st_num3")) : 0;
			System.out.println("After: " + st_nums[2]);
		}
		catch (NumberFormatException e)
		{
			System.out.println(e.toString());
			return "/WEB-INF/view/errorPage.jsp";
		}
		
		for (int i = 0; i < st_nums.length; i++)
		{
		    if (i == 2 && st_nums[i] == 0)
		    {
		        continue; 
		    }
		    System.out.println("Value of st_nums[" + i + "] is: " + st_nums[i]);
		    addModelAttributes(dao, st_nums[i], i+1, model);
		}

		
		System.out.println("Value of st_num3 is: " + st_nums[2]);
		
		return "/WEB-INF/view/compareView.jsp";
	}

	
	private void addModelAttributes(IcompareViewDAO dao, int st_num, int index, Model model)
	{
		if (st_num != 0)
		{
			model.addAttribute("nameLoCat" + index, dao.nameLoCat(st_num));
			model.addAttribute("scoRe" + index, dao.scoRe(st_num));
			model.addAttribute("openClose" + index, dao.openClose(st_num));
			model.addAttribute("others" + index, dao.others(st_num));
			model.addAttribute("menuLists" + index, dao.menuLists(st_num));
		}
	}*/
}

