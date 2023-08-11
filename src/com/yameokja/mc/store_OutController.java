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
		
		result = "store_Out.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/storeOutinsert.action", method=RequestMethod.POST)
	public String StoreOutinsert(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		String rootPath = servletContext.getRealPath("/");
		String CHARSET = "utf-8";
		int LIMIT_SIZE_BYTES = 5 * 1024 * 1024;
		
		storeOutDTO sodto = new storeOutDTO();
		
		// 경로상 디렉터리가 존재하지 않으면... 만든다.
		String savePath_stOut = rootPath + File.separator + "Store_Out_File";
		File st_out_dir = new File(savePath_stOut);
		if (!st_out_dir.exists())
		{
			st_out_dir.mkdirs();
		}
		
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(st_out_dir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try 
		{
            List<FileItem> items = fileUpload.parseRequest(request);
            for (FileItem item : items)
            {
                if (!item.isFormField())
                {
                	if (item.getFieldName().equals("st_out_file"))
                	{
	                    if (item.getSize() > 0)
	                    {
	                        String separator = File.separator;
	                        int index =  item.getName().lastIndexOf(separator);
	                        String fileName = item.getName().substring(index  + 1);
	                        File uploadFile = new File(savePath_stOut +  separator + fileName);
	                        item.write(uploadFile);
	                        sodto.setSt_out_file(String.valueOf(uploadFile));
	                        
	                    }
                	}
                	
                }
                else
                {
                	if (item.getFieldName().equals("st_out_num"))
                	{
                		String tmpStr = item.getString(CHARSET);
                		int st_out_num = Integer.parseInt(tmpStr.substring(1, tmpStr.length()));
                		sodto.setSt_out_num(st_out_num);
                	}
                	else if (item.getFieldName().equals("st_name"))
                		sodto.setSt_name(item.getString(CHARSET));
                } 
            }
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		sodto.setUser_num((String)session.getAttribute("user_num"));
		
		IstoreOutDAO dao = sqlSession.getMapper(IstoreOutDAO.class);
		
		dao.st_Out_apply(sodto);
		
		return "redirect:main.action";
	}
	
	
}
