/*
 	PlannerCreateFormController.java
   - 사용자 정의 컨트롤러 클래스
   - 플래너 1차 생성 페이지 뷰
  
 */

package com.test.mvc;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PlannerCreateForm2Controller implements Controller
{
	

	@Override

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
	
		
		
		try
		{
			
			HttpSession session = request.getSession();
			
			// 세션값 있다면 지우기
			session.removeAttribute("title");
			session.removeAttribute("matching_availability");
			session.removeAttribute("startdate");
			session.removeAttribute("enddate");
			session.removeAttribute("traveltype");
			session.removeAttribute("budget");
			session.removeAttribute("min");
			session.removeAttribute("max");
			session.removeAttribute("transportation");
			
			
			// 지운 후 다시 설정
			if (session.getAttribute("title") == null )
			{
				session.setAttribute("title", request.getParameter("title"));
				session.setAttribute("matching_availability", request.getParameter("matchingavailability"));
				session.setAttribute("startdate", request.getParameter("startdate"));
				session.setAttribute("enddate", request.getParameter("enddate"));
				session.setAttribute("traveltype", request.getParameter("traveltype"));
				session.setAttribute("budget", request.getParameter("budget"));
				session.setAttribute("min", request.getParameter("min"));
				session.setAttribute("max", request.getParameter("max"));
				session.setAttribute("transportation", request.getParameter("transportation"));
			}
			
			
			
			mav.setViewName("Planner_Main");
			
			String date1 = request.getParameter("startdate");
	        String date2 = request.getParameter("enddate");
	          
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	          
	        Date startdate = sdf.parse(date1);
	        Date enddate = sdf.parse(date2);
	          
	        long diffDay = (enddate.getTime() - startdate.getTime()) / (24*60*60*1000) + 1;
	
	           
	        mav.addObject("calDateDays", diffDay);
		   
	        
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		return mav;
	}
	
}




















