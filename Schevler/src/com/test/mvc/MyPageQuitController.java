package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyPageQuitController implements Controller
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
		String membercode = (String) session.getAttribute("membercode");// 세션에서 멤버코드 확인
		mav.addObject("member", dao.myPageInfo(membercode));			// 멤버 정보 가져오기
		mav.setViewName("MyPageQuit");
		
		
		return mav;
	}
	
}
