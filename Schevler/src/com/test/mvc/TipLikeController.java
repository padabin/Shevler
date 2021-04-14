/*===========================
   TipLikeController.java
===========================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TipLikeController implements Controller
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

		// 이전 페이지(각 ArticleDetail.jsp) 로부터 데이터 수신
		String articleCode = request.getParameter("articleCode");
		String pageNum = request.getParameter("pageNum");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		
		int likeCount = 0;
		int check = 0;
		
		try
		{
			HttpSession session = request.getSession();
			
			String memberCode = (String)session.getAttribute("membercode");
			
			if(memberCode != null)
			{
				// 추천수 증가
				cdao.updateAddLikeCount(articleCode, memberCode);
				// 추천수 조회
				likeCount = cdao.getLikeCount(articleCode);
				
				mav.addObject("likeCount", likeCount);
				
				mav.setViewName("redirect:tipdetailopen.action?articleCode=" + articleCode 
						+ "&pageNum=" + pageNum + "&bno=" + bno);
				
			}
			else
			{
				// 로그인 안되어있으면
				mav.setViewName("redirect:loginopen.action");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
