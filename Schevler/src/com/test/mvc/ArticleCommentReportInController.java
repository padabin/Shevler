package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleCommentReportInController implements Controller
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
		
		HttpSession session = request.getSession();

		
		// 값 받아오기
		String reporter = (String)session.getAttribute("membercode");
		String articleCommentCode = request.getParameter("articleCommentCode");
		String reptype = request.getParameter("reptype");
		String repnote = request.getParameter("repnote");
		
		
		ArticleDTO dto = new ArticleDTO();
		
		dto.setMemberCode(reporter);
		dto.setArticleCommentCode(articleCommentCode);
		dto.setRep_type_code(reptype);
		dto.setArticle_rep_in_content(repnote);

		
		dao.inArticleCommentReport(dto);
		
		
		mav.setViewName("ArticleCommentReportResult");
		
		
		return mav;
	}
}
