/*
 * CommentReportProcessController.java
 * - 관리자 댓글 신고 처리 페이지 컨트롤러
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CommentReportProcessController implements Controller
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
		
		
		HttpSession session = request.getSession();
		String reportType = (String)session.getAttribute("reportType");
		
		try
		{
			
			if (reportType.equals(""))		// 세션에 값이 없다면
			{
				session.setAttribute("reportType", "comment");		//바로 세션에 담기
			}
			else							// 세션에 다른 값이 있다면
			{
				session.removeAttribute("reportTpye"); 			// 세션 값 비우고
				session.setAttribute("reportType", "comment");		// 다시 담기
			}
			
			
			mav.setViewName("AdminReportTables");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
