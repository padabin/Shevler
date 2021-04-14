
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.



public class Cs_NoticeInsertFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		
		String member_code = (String)session.getAttribute("member_code");
		session.setAttribute("member_code", "M1");
	
		mav.setViewName("Cs_NoticeInsertForm");

		return mav;
		
	}
	
}
