/*=============================
  TipUpdateController.java
=============================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TipUpdateController implements Controller
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
		
		// 이전 페이지로부터(TipArticleUpdateForm.jsp) 데이터 수신
		String articleTitle = request.getParameter("title");
		String articleContent = request.getParameter("content");
		String articleCode = request.getParameter("articleCode");
		
		try
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setArticleCode(articleCode);
			dto.setArticleTitle(articleTitle);
			dto.setArticleContent(articleContent);
			// dto.setMemberCode(memberCode);
			
			cdao.updateData(dto);
			
			mav.setViewName("redirect:tiparticleopen.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
