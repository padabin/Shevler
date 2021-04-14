package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QuitController implements Controller
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
		
		dao.memberRemove(membercode);
		
		
		mav.setViewName("redirect:logout.action");
		
		return mav;
	}
	
}
