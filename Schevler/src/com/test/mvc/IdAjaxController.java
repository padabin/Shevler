/*==========================
   IdAjaxController.java
=========================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class IdAjaxController implements Controller
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
		
		// join.jsp 로 부터 데이터 수신(id)
		String id = request.getParameter("id");
		
		String resid = null;
		String result = null;
		
		try
		{
			resid = dao.idSearch(id);
			
			if(resid != null)
			{
				result = "이미 사용중인 아이디 입니다.";
			}
			else
			{
				result = "사용 가능한 아이디 입니다.";
			}
			
			mav.addObject("result", result);
			mav.setViewName("IdAjax");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
