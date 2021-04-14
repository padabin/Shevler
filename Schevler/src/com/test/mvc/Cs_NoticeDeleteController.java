
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class Cs_NoticeDeleteController implements Controller
{

	private INoticeDAO dao;
	
	
	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		//이전 페이지(Cs_NoticeDetail.jsp)로 부터 데이터 수신
		String notice_code = request.getParameter("notice_code");
	
		try
		{
			dao.deleteData(notice_code);
	
			mav.setViewName("redirect:notice_list.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());		
		}
		
		return mav;
	}
}
