
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class Cs_NoticeInsertController implements Controller
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
		
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		String notice_title = request.getParameter("notice_title");
		String notice_type_code = request.getParameter("notice_type_code");
		String notice_content = request.getParameter("notice_content");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setMember_code(member_code);
		dto.setNotice_title(notice_title);
		dto.setNotice_type_code(notice_type_code);
		dto.setNotice_content(notice_content);
		
		try
		{
			dao.insertData(dto);
			mav.setViewName("redirect:notice_list.action");
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}	
		return mav;		
	}	
}
