/*====================================
   TipCommentDeleteController.java
====================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TipCommentDeleteController implements Controller
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
		
		// 이전 페이지(TipArticleDetail.jsp)로 부터 댓글 삭제 관련 데이터 수신
		String pageNum = request.getParameter("pageNum");
		String articleCode = request.getParameter("articleCode");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		String articleCommentCode = request.getParameter("articleCommentCode");
		
		try
		{
			cdao.deleteComment(articleCommentCode);
			
			mav.setViewName("redirect:tipdetailopen.action?pageNum=" + pageNum
					+ "&articleCode=" + articleCode + "&bno=" + bno);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
