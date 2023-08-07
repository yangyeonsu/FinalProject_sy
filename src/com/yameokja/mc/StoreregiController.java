package com.yameokja.mc;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreregiController
{
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/storegiinsertform.action", method=RequestMethod.POST)
	public String SoreregiInsertForm()
	{
		String result = null;
		
		result = "WEB-INF/view/Store_Regi.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/storeregiinsert.action", method=RequestMethod.POST)
	public String StoreregiInsert(HttpServletRequest request, StoreregiDTO dto) 
	{
		
		 // 서블릿 컨텍스트 가져오기
        ServletContext context = request.getServletContext();

        // 루트 경로 가져오기
        String rootPath = context.getContextPath();

        System.out.println(rootPath);
		
		/* String savePath = root + "pds" + File.separator + "saveFile"; */
		
		IStoreregiDAO dao = sqlSession.getMapper(IStoreregiDAO.class);
		
		dao.add(dto);
		
		return "redirect:usermain.action";

	}
	
//	
//	public String getRealPath(HttpServletRequest request)
//	{
//		 String contextPath = request.getContextPath(); // 현 웹 어플리케이션 프로젝트명.
//	        String servletPath = request.getServletPath(); // 현 웹 어플리케이션의 프로젝트명을 제외한 경로.
//	        
//	        // 인자값인 string과 일치하는 파일명의 절대 경로가 아님.(현재 웹어플리케이션 절대경로 + string 일뿐.)
//	        String realPath = request.getRealPath(""); // string에 ""을 주면 현 웹 어플리케이션의 절대 경로를 구함.
//	        
//	        return realPath;
//	                                                                    }
}
