package com.yameokja.mc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class stDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/stDetail-userView.action", method = RequestMethod.GET)
	public String stDetail(Model model)
	{
		String result = "";
		
		IstDetailDAO_userView dao = sqlSession.getMapper(IstDetailDAO_userView.class);
		
		model.addAttribute("openClose", dao.openClose());
		model.addAttribute("breakTime", dao.breakTime());
		model.addAttribute("holiday", dao.holiday());
		model.addAttribute("store", dao.store());
		model.addAttribute("stName", dao.stName());
		model.addAttribute("clikeNum", dao.clikeNum());
		model.addAttribute("creviewScore", dao.creviewScore());
		model.addAttribute("creviewNum", dao.creviewNum());
		model.addAttribute("tel", dao.tel());
		model.addAttribute("lo", dao.lo());
		model.addAttribute("others", dao.others());
		model.addAttribute("menuLists", dao.menuLists());
		model.addAttribute("stKeys", dao.stKeys());
		model.addAttribute("reViews", dao.reViews());
		
		result = "/WEB-INF/view/storeDetail-userView(20230802).jsp";
		
		return result;
	}
}
