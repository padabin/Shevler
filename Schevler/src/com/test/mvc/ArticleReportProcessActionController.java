/*
 * NoteReportProcessActionController.java
 * - 관리자 쪽지 신고 처리 액션 컨트롤러
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleReportProcessActionController implements Controller
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
		IArticleReportDAO dao = sqlSession.getMapper(IArticleReportDAO.class);
		
		ArrayList<ArticleReportDTO> lists =  dao.lists();
		HttpSession session = request.getSession();
		
		String memberCode = (String)session.getAttribute("membercode");
		String article_rep_in_code = request.getParameter("article_rep_in_code");
		String article_rep_out_process = request.getParameter("article_rep_out_process");
		try
		{
			dao.reportProcess(article_rep_in_code, memberCode, article_rep_out_process);

			mav.setViewName("redirect:articlereportprocess.action");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
