/*==========================
  ReportAjaxController.java
==========================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleReportAjaxController implements Controller
{
	private IArticleDAO cdao;
	
	public void setCdao(IArticleDAO cdao)
	{
		this.cdao = cdao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 가져오기
		String articleCode = request.getParameter("articleCode");
		
		HttpSession session = request.getSession();
		String memberCode = (String)session.getAttribute("membercode");
		
		int count = 0;
		String result = null;
		
		try
		{
			count = cdao.getMemberReportCount(articleCode, memberCode);
			
			mav.addObject("count", count);
			mav.setViewName("ArticleReportAjax");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
