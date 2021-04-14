/*
 * QnaAnswerProcessPageController
 * - 관리자 1대1 문의 답변 페이지 컨트롤러
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QnaAnswerProcessPageController implements Controller
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
		
		ArrayList<ArticleReportDTO> lists = dao.lists();
		HttpSession session = request.getSession();
		String reportType = (String)session.getAttribute("reportType");
		
		try
		{
			
			
			
			mav.addObject("lists", lists);
			mav.setViewName("AdminReportTables");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
