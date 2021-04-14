/*====================================
  StoryCommentUpdateController.java
====================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class StoryCommentUpdateController implements Controller
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
		
		// 이전 페이지(StoryArticleDetail.jsp)로 부터 댓글 수정 관련 데이터 수신
		String articleCode = request.getParameter("articleCode");
		String pageNum = request.getParameter("pageNum");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		String articleCommentCode = request.getParameter("articleCommentCode");
		String updateCommentTxt = request.getParameter("updateCommentTxt");
		
		try
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setArticleCommentCode(articleCommentCode);
			dto.setArticleCommentContent(updateCommentTxt);
			
			cdao.updateComment(dto);
			
			mav.setViewName("redirect:storydetailopen.action?articleCode=" + articleCode
					+ "&pageNum=" + pageNum + "&bno=" + bno);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
