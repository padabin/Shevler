/*========================
  LikeAjaxController.java
========================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LikeAjaxController implements Controller
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
		
		// 이전 페이지(StoryArticleDetail.jsp) 로 부터 추천수 ajax 관련 데이터 수신
		String articleCode = request.getParameter("articleCode");
		String pageNum = request.getParameter("pageNum");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		
		HttpSession session = request.getSession();
		String memberCode = (String)session.getAttribute("membercode");
		
		int count = 0;
		
		try
		{
			count = cdao.getMemberLikeCount(articleCode, memberCode);
			
			mav.addObject("result", count);
			mav.setViewName("LikeAjax");
			
			/*
			if(count >= 1)
			{
				
				mav.addObject("result", count);
				mav.setViewName("LikeAjax");
			}
			else
			{
				
				mav.addObject("result", count);
				
				mav.setViewName("redirect:storylike.action?articleCode=" + articleCode
						+ "&pageNum=" + pageNum + "&bno=" + bno);
			}
			*/
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
