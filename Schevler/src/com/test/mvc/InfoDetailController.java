/*
 	PlannerCreateFormController.java
   - 사용자 정의 컨트롤러 클래스
   - 플래너 1차 생성 페이지 뷰
  
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class InfoDetailController implements Controller
{
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("Planner_Info_Detail");
		
		return mav;
	}
	
}




















