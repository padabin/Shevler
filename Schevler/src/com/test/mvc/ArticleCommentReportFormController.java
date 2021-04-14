package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleCommentReportFormController implements Controller
{
	public IArticleDAO dao;
	
	public void setDao(IArticleDAO dao)
	{
		this.dao = dao;
	}

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
		

		String reporter = request.getParameter("reporter");
		String CommentCode = request.getParameter("articleCommentCode");
		String memberCode = (String)session.getAttribute("memberCode");
		
		ArticleDTO dto = dao.getCommentData(CommentCode);
		int resultCount = dao.getMemberCommentCount(CommentCode, memberCode);
		
		ArrayList<ArticleDTO> repdto = dao.repTypeList(); 
		
		mav.addObject("dto", dto);
		mav.addObject("repdto", repdto);
		mav.addObject("reporter", reporter);
		mav.addObject("resultCount", resultCount);
		
		
		mav.setViewName("ArticleCommentReportForm");
		
		return mav;
	}

}
