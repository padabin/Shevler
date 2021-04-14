/*===========================
	SampleController.java
=============================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.support.DaoSupport;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.



public class FindPwUpdateController implements Controller
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
		
		String pw = request.getParameter("login_pw");
		String id = request.getParameter("login_id");
		String name = request.getParameter("login_name");
		String email = request.getParameter("login_email");

		FindIdPwDTO dto = new FindIdPwDTO();
		dto.setMember_id(id);
		dto.setMember_pw(pw);
		dto.setMember_info_name(name);
		dto.setMember_info_email(email);
		
			
		dao.modifyPw(dto);
			
		mav.setViewName("Login_FindPwUpdateResult");

		return mav;
	}
	
}
