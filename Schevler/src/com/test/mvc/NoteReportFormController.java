/*
 * NoteReportFormController.java
 * - 관리자 쪽지 신고 처리 페이지 컨트롤러
 */

package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoteReportFormController implements Controller
{


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		String sender = request.getParameter("sender");	
		String note_code = request.getParameter("note_code");
		
		
		try
		{	
			mav.addObject("sender", sender);
			mav.addObject("note_code", note_code);
			mav.setViewName("NoteReportForm");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
