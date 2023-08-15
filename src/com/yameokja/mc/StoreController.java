package com.yameokja.mc;


import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.javassist.compiler.ast.Stmnt;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreController
{
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
    private ServletContext servletContext;
	
	@RequestMapping(value="/storemain.action", method=RequestMethod.GET)
	public String storeMainLoad(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String result = "";
		
		/* int st_num = Integer.parseInt(str_st_num); */ 
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		IStoreMainDAO smDao = sqlSession.getMapper(IStoreMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		
		
		String user_num = (String)session.getAttribute("user_num");
		
		UserDTO user = uDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		
		ArrayList<StoreDTO> st_list = smDao.searchStoreInfo(user_num);
		int st_num;
		
		if(smDao.searchRepStore(user_num) == null)
			st_num = st_list.get(0).getSt_num();
		else
			st_num = smDao.searchRepStore(user_num);
		
		
		session.setAttribute("st_num", st_num);
				
		ArrayList<HashMap<String, String>> hashmaplist = smDao.rv_key_sum(st_num);
		
		ArrayList<String> rv_labels = new ArrayList<String>();
		ArrayList<String> rv_data = new ArrayList<String>();
		 
		for (HashMap<String, String> hashMap : hashmaplist)
		{
			rv_labels.add("'" +hashMap.get("RV_KEY_NAME")+"'");
			rv_data.add(String.valueOf(hashMap.get("COUNT_RV_KEY")));
		}
		
		
		ArrayList<HashMap<String, String>> star_transition = smDao.star_transition(st_num);
		
		ArrayList<String> star_labels = new ArrayList<String>();
		ArrayList<String> star_data = new ArrayList<String>();
		 
		for (HashMap<String, String> star : star_transition)
		{
			star_labels.add("'" +star.get("QUARTER_START_DATE")+"'");
			star_data.add(String.valueOf(star.get("AVERAGE_STAR_SCORE")));
		}
		
		
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
		
		model.addAttribute("st_list", st_list);
		
		model.addAttribute("rv_labels", rv_labels.subList(0, 5));
		model.addAttribute("rv_data", rv_data.subList(0, 5));
		
		model.addAttribute("star_labels", star_labels);
		model.addAttribute("star_data", star_data);
		
		model.addAttribute("rv_key_list", smDao.rv_key_sum(st_num));
		model.addAttribute("rv_list", smDao.rv_list(st_num));
		
		ArrayList<ReviewDTO> arr = smDao.rv_list(st_num);
		for (ReviewDTO reviewDTO : arr)
		{
			System.out.println(reviewDTO.getReply_content());
		}
		/* model.addAttribute("reply_content", reply_content(rv_num)); */
		
		model.addAttribute("alarm", uDao.userAlarm(user_num));
		
		result = "/WEB-INF/view/StoreMainPage.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/stdetailmodify.action", method = RequestMethod.POST)
	public String stDetailModify(HttpServletRequest request, Model model)
	{
		String result = "";
		
		HttpSession session = request.getSession();
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		IStoreMainDAO sdao = sqlSession.getMapper(IStoreMainDAO.class);
		IMainDAO mdao = sqlSession.getMapper(IMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		
		String user_num = (String)session.getAttribute("user_num");
		int st_num = (int) session.getAttribute("st_num");
		
		UserDTO user = uDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		
		// 가게가 선택할 수 있는 카테고리
		model.addAttribute("foodLabel", sdao.foodLabel());
		model.addAttribute("payLabel", sdao.payLabel());
		model.addAttribute("weekdayLabel", sdao.weekDayLabel());
		model.addAttribute("weekWeekendDayLabel", sdao.weekWeekendDayLabel());
		model.addAttribute("chBoxLabel", sdao.chBoxLabel());
		model.addAttribute("stKeyLabel", mdao.stKeyList());
		
		// 가게 기본 사항
		model.addAttribute("store", dao.store(st_num));
		
		// 가게 키워드
		ArrayList<Integer> stKeyList =  dao.stKeysStr(st_num);
		if(stKeyList.size()>0)
		{
			model.addAttribute("stKeys", stKeyList);
		}
		else
			model.addAttribute("stKeys", null);
		System.out.println(stKeyList);
		
		// 가게 영업시간 + 휴무일
		ArrayList<StoreOpencloseDTO> openClose =  dao.openClose(st_num);
		if(openClose.size() > 0)
		{
			model.addAttribute("openClose", openClose);
		}
		else
			model.addAttribute("openClose", null);
		
		
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
		
		
		
		result = "/WEB-INF/view/st_detail_form.jsp";
		
		return result;
	}
  
	@RequestMapping(value="/rvReply.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String rvReply(HttpServletRequest request, Model model)
	{	
		String rvnum = request.getParameter("rv_num");
		String reply_content = request.getParameter("reply_content");
		int rv_num = 0;
		
		System.out.println("rv_num: " + rvnum);
		System.out.println("reply_content from HttpServletRequest: " + reply_content);


		
        // 점검 코드
        if (rvnum == null) 
        {
            System.out.println("경고: 'rv_num' 값이 null 입니다.");
        }
        else
        {
        	rv_num = Integer.parseInt(rvnum);
        }
        
        if (reply_content == null) 
        {
            System.out.println("경고: 'reply_content' 값이 비어있습니다.");
        } 
       
        
        if(reply_content == null || reply_content.trim().isEmpty()) 
        {
            // 에러 메시지를 반환하거나 기타 오류 처리를 수행
            return "redirect:storemain.action";  // 예제용 반환 값, 실제로 적절한 페이지나 메시지로 변경해야 합니다.
        }

		
		HttpSession session = request.getSession();
		IStoreMainDAO dao = sqlSession.getMapper(IStoreMainDAO.class);
		IUserDAO uDao = sqlSession.getMapper(IUserDAO.class);
		//StoreReviewDTO dto = new StoreReviewDTO();
		
		String user_num = (String)session.getAttribute("user_num");
		Integer stNumInteger = (Integer)session.getAttribute("st_num");
		String stnum = (stNumInteger != null) ? stNumInteger.toString() : null;
		int st_num = Integer.parseInt(stnum);
		
		UserDTO user = uDao.searchUserInfo(user_num, "num");

		LocalDate currentDate = LocalDate.now();
		int month = currentDate.getMonthValue();

		if (month < 7)
			user.setUser_grade(uDao.firstHalf(user_num).user_grade);
		else
			user.setUser_grade(uDao.secondHalf(user_num).user_grade);

		model.addAttribute("user", user);
		session.setAttribute("st_num", st_num);
		
		
		//dto.setRv_content(reply_content);
		//dto.setRv_num(rv_num);
		
		
		//dao.reviewReply(dto);
		dao.reviewReply(rv_num, reply_content);
		
	    return "redirect:storemain.action";
	}
	
	@RequestMapping(value="/rvcompletebtn.action", method = RequestMethod.POST)
		@ResponseBody
	public String replyCheck(@RequestParam("rv_num") int rv_num, @RequestParam("reply_content") String reply_content)
	{
		String html= "";
		
		
		System.out.println(rv_num);
		System.out.println(reply_content);
		
		
		IStoreMainDAO dao = sqlSession.getMapper(IStoreMainDAO.class);
		int result = dao.reviewReply(rv_num, reply_content);
		
		html += "<div class=\"replyBox\">";
		html += "사장님 : " + reply_content +"</div>";
		
		return html; 
	}
	
	
	@RequestMapping(value="/stdetailinsert.action", method=RequestMethod.POST)
	public String stDetailInsert(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String rootPath = servletContext.getRealPath("/");
		String CHARSET = "utf-8";
		int LIMIT_SIZE_BYTES = 5 * 1024 * 1024;
		
		StoreregiDTO srdto = new StoreregiDTO();
		
		// 경로상 디렉터리가 존재하지 않으면... 만든다.
		String savePath_menuImg = rootPath + File.separator + "Store_Menu_Img";
		File menu_img_dir = new File(savePath_menuImg);
		if (!menu_img_dir.exists())
		{
			menu_img_dir.mkdirs();
		}
		
		System.out.println("넘어와서 파일 만듬");
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(menu_img_dir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try 
		{
			HashMap<String, StoreMenuDTO> menuMap = new HashMap<String, StoreMenuDTO>();
			
			List<FileItem> items = fileUpload.parseRequest(request);
            for (FileItem item : items)
            {
                if (!item.isFormField())
                {
                	if (item.getSize() > 0)
                    {
                		StoreMenuDTO mdto = new StoreMenuDTO();
                		
                        String separator = File.separator;
                        int index =  item.getName().lastIndexOf(separator);
                        String fileName = item.getName().substring(index  + 1);
                        File uploadFile = new File(savePath_menuImg +  separator + fileName);
                        item.write(uploadFile);
                        mdto.setImage_link(String.valueOf(uploadFile));
                        
                        menuMap.put(item.getFieldName(), mdto);
                        
                    }
                }
            }
            
            for (FileItem item : items)
            {
                if (item.isFormField())
                {
                   	if(menuMap.keySet().contains(item.getFieldName().substring(0, item.getFieldName().length()-1)))
                	{
                		if (item.getFieldName().substring(item.getFieldName().length()-1).equals("m"))
                			menuMap.get(item.getFieldName().substring(0, item.getFieldName().length()-1)).setMenu_name(item.getString(CHARSET)); 
                		else if (item.getFieldName().substring(item.getFieldName().length()-1).equals("p"))
                			menuMap.get(item.getFieldName().substring(0, item.getFieldName().length()-1)).setPrice(Integer.parseInt(item.getString(CHARSET)));
                		
                		System.out.println(item.getString(CHARSET));
                	}
                		
					/*
					 * else if (item.getFieldName().equals("st_place_num")) { String tmpStr =
					 * item.getString(CHARSET); int st_place_num =
					 * Integer.parseInt(tmpStr.substring(0, tmpStr.length()));
					 * srdto.setSt_place_num(st_place_num); } else if
					 * (item.getFieldName().equals("st_name"))
					 * srdto.setSt_name(item.getString(CHARSET)); else if
					 * (item.getFieldName().equals("st_location"))
					 * srdto.setSt_location(item.getString(CHARSET)); else if
					 * (item.getFieldName().equals("st_location_dt"))
					 * srdto.setSt_location_dt(item.getString(CHARSET)); else if
					 * (item.getFieldName().equals("st_tel"))
					 * srdto.setSt_tel(item.getString(CHARSET));
					 */
                }
            }
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		return "";
	}
	
  
}
