/*
 * NoteReportDoubleCheckAjaxController.java
 * - 관리자 쪽지 신고 중복 확인 처리 컨트롤러
 */

package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoteReportDoubleCheckAjaxController implements Controller
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
		INoteReportDAO dao = sqlSession.getMapper(INoteReportDAO.class); 
		
		HttpSession session = request.getSession();
		String member_code = (String) session.getAttribute("membercode");
		
		// ajax로 넘긴 파라미터
		String note_code =request.getParameter("note_code");
		
		
		// 현재 쪽지에 현재 아이디로 신고한 횟수 
		int count = dao.doubleCheck(note_code, member_code);
		
		try
		{	
			mav.addObject("count" , count);
			
			mav.setViewName("NoteReportDoubleCheckAjax");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
