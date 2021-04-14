/*================================
   ArticleReportController.java
================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleReportAjaxFinalController implements Controller
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
		
		// 이전 페이지(ArticleReportForm.jsp)로부터 데이터 수신
		String articleCode = request.getParameter("articleCode");
		String rep_type_code = request.getParameter("reportReason");
		String article_rep_in_content = request.getParameter("reportDetail");
		
		HttpSession session = request.getSession();
		String memberCode = (String)session.getAttribute("membercode");
		
		String result = null;
		
		try
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setArticleCode(articleCode);
			dto.setRep_type_code(rep_type_code);
			dto.setArticle_rep_in_content(article_rep_in_content);
			dto.setMemberCode(memberCode);
			
			int res = cdao.reportArticle(dto);
			
			if(res >=1 )
				result = "신고가 완료되었습니다.";
			
			mav.addObject("result", result);
			
			mav.setViewName("ArticleReportAjaxFinal");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
