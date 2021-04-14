/*==================================
  ArticleReportOpenController.java
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleReportOpenController implements Controller
{
	private SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 가져오기
		String articleCode = request.getParameter("articleCode");
		String articleTitle = request.getParameter("articleTitle");
		String writerMemberId = request.getParameter("memberId");
		
		mav.addObject("articleCode", articleCode);
		mav.addObject("articleTitle", articleTitle);
		mav.addObject("writerMemberId", writerMemberId);
		
		mav.setViewName("ArticleReportForm");
		
		return mav;
	}

}
