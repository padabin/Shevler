package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyPageController implements Controller
{
	private IMemberDAO dao; 
	
	
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String membercode = (String) session.getAttribute("membercode");
		if (membercode != null)	// 로그인 했다면
		{
			
			mav.addObject("member", dao.myPageInfo(membercode));
			
			mav.setViewName("MyPage");
		}
		else					// 로그인 안했다면
		{
			mav.setViewName("redirect:login.action");
		}
		return mav;
	}
	
}
