/*
 * NoteReceiveController.jva
 * - 받은쪽찌함 리스트 뿌려주기
 */
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoteWriteFormController implements Controller
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
		String membercode = (String)session.getAttribute("membercode");
		// 게시판에서 유저 버튼 눌렀을 때 GET방식으로 오는 보낼 유저의 ID
		String receiverId = request.getParameter("receiverId");
		try
		{
			mav.addObject("receiverId", receiverId);
			mav.setViewName("My_MessageInsertForm");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
