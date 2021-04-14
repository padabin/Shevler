package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QnaInsertFormController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가) ----------------------------------------
		HttpSession session = request.getSession();
		
		if(session.getAttribute("name")!=null)
		{
			// 만약 로그인되어있는 상황인데 회원가입 페이지로 들어올 경우
			mav.setViewName("redirect:main.action");
		}
		//  ---------------------------------------- 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가)
		
		
		mav.setViewName("Qna");
		
		return mav;
	}
}
