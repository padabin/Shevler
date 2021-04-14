
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.



public class FindIdController implements Controller
{

	private IFindIdPwDAO dao;
	
	public void setDao(IFindIdPwDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		//데이터 수신(FindIdForm.jsp로부터 수신)
		String search_name = request.getParameter("login_name");
		String search_email = request.getParameter("login_email");
	
		try
		{
			FindIdPwDTO dto = dao.getId(search_name, search_email);
			
			mav.addObject("result", dto);
	
			mav.setViewName("Login_FindIdResult");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
