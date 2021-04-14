/*====================================
  StoryCommentWriteController.java
====================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TipCommentWriteController implements Controller
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
		
		// 이전 페이지(StoryArticleDetail.jsp)로 부터 댓글 관련 데이터 수신
		String articleCode = request.getParameter("articleCode");
		String pageNum = request.getParameter("pageNum");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		String commentTxt = request.getParameter("commentTxt");
		
		try
		{
			HttpSession session = request.getSession();
			String memberCode = (String)session.getAttribute("membercode");
			
			ArticleDTO dto = new ArticleDTO();
			
			dto.setArticleCode(articleCode);
			dto.setArticleCommentContent(commentTxt);
			dto.setCommentMemberCode(memberCode);
			
			cdao.writeComment(dto);
			
			mav.setViewName("redirect:tipdetailopen.action?pageNum=" + pageNum + "&articleCode=" 
									+ articleCode + "&bno=" + bno);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
