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

public class NoteReportActionController implements Controller
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
		
		// ReportForm에서 ajax로 넘어온 파라미터들
		String rep_type_code =request.getParameter("rep_type_code");
		String note_rep_in_content =request.getParameter("note_rep_in_content");
		String note_code =request.getParameter("note_code");
		
		
		
		
		dao.reportAction(note_code, member_code, rep_type_code ,note_rep_in_content);
		
		try
		{	
			
			mav.addObject("check", "신고가 완료되었습니다.");
			mav.setViewName("NoteReportAjax");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
