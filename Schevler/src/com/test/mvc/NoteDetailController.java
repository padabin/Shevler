/*
 * NoteReceiveController.jva
 * - 받은쪽찌함 리스트 뿌려주기
 */
package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoteDetailController implements Controller
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
		NoteDTO note = new NoteDTO();
		INoteDAO dao = sqlSession.getMapper(INoteDAO.class);
		// 넘겨받은 파라미터 noteCode
		String noteCode = request.getParameter("noteCode");
		try
		{
			
			
			// lists에 받은 쪽지들 리스트 담아서 뷰페이지에 보내기
			note = dao.getDetailContent(noteCode);
			mav.addObject("note", note);
		
			
			mav.setViewName("My_MessageDetail");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
