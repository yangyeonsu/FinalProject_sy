package com.yameokja.mc;


import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class store_OutController
{
	@Autowired 
	private SqlSession sqlSession;
	
	@Autowired
    private ServletContext servletContext;
	
	@RequestMapping(value = "/storeOutform.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String storeOuttForm()
	{
		String result = null;
		
		result = "WEB-INF/view/store_Out.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/storeregiinsert.action", method=RequestMethod.POST)
	public String StoreregiInsert(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		String rootPath = servletContext.getRealPath("/");
		String CHARSET = "utf-8";
		int LIMIT_SIZE_BYTES = 5 * 1024 * 1024;
		
		StoreregiDTO srdto = new StoreregiDTO();
		
		// 경로상 디렉터리가 존재하지 않으면... 만든다.
		String savePath_stIn = rootPath + File.separator + "Store_In_File";
		File st_in_dir = new File(savePath_stIn);
		if (!st_in_dir.exists())
		{
			st_in_dir.mkdirs();
		}
		
		// 경로상 디렉터리가 존재하지 않으면... 만든다.
		String savePath_stPlace = rootPath + File.separator + "Store_Place_File";
		File st_place_dir = new File(savePath_stPlace);
		if (!st_place_dir.exists())
		{
			st_place_dir.mkdirs();
		}
		
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(st_in_dir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try 
		{
            List<FileItem> items = fileUpload.parseRequest(request);
            for (FileItem item : items)
            {
                if (!item.isFormField())
                {
                	if (item.getFieldName().equals("st_in_file"))
                	{
	                    if (item.getSize() > 0)
	                    {
	                        String separator = File.separator;
	                        int index =  item.getName().lastIndexOf(separator);
	                        String fileName = item.getName().substring(index  + 1);
	                        File uploadFile = new File(savePath_stIn +  separator + fileName);
	                        item.write(uploadFile);
	                        srdto.setSt_in_file(String.valueOf(uploadFile));
	                        
	                    }
                	}
                	else if (item.getFieldName().equals("st_place_file"))
                	{
	                    if (item.getSize() > 0)
	                    {
	                        String separator = File.separator;
	                        int index =  item.getName().lastIndexOf(separator);
	                        String fileName = item.getName().substring(index  + 1);
	                        File uploadFile = new File(savePath_stPlace +  separator + fileName);
	                        item.write(uploadFile);
	                        srdto.setSt_place_file(String.valueOf(uploadFile));
	                    }
                	}
                }
                else
                {
                	if (item.getFieldName().equals("st_in_num"))
                	{
                		String tmpStr = item.getString(CHARSET);
                		int st_in_num = Integer.parseInt(tmpStr.substring(1, tmpStr.length()));
                		srdto.setSt_in_num(st_in_num);
                	}
                	else if (item.getFieldName().equals("st_place_num"))
                	{
                		String tmpStr = item.getString(CHARSET);
                		int st_place_num = Integer.parseInt(tmpStr.substring(1, tmpStr.length()));
                		srdto.setSt_in_num(st_place_num);
                	}
                	else if (item.getFieldName().equals("st_name"))
                		srdto.setSt_name(item.getString(CHARSET));
                	else if (item.getFieldName().equals("st_location"))
                		srdto.setSt_location(item.getString(CHARSET));
                	else if (item.getFieldName().equals("st_location_dt"))
                		srdto.setSt_location_dt(item.getString(CHARSET));
                	else if (item.getFieldName().equals("st_tel"))
                		srdto.setSt_tel(item.getString(CHARSET));
                } 
            }
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		srdto.setUser_num((String)session.getAttribute("user_num"));
		
		IStoreregiDAO dao = sqlSession.getMapper(IStoreregiDAO.class);
		
		dao.St_In_Apply(srdto);
		
		return "redirect:main.action";
	}
	
	
}
