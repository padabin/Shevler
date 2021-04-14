/*
 * NoteWriteController.jva
 * - 쪽지 보내기 액션 처리
 */
package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoteWriteController implements Controller
{
	private SqlSession sqlSession;
	private IMemberDAO mDao;
	
	
	public void setmDao(IMemberDAO mDao)
	{
		this.mDao = mDao;
	}

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		// 아이디 체크 분기
		boolean IdCheck = true;
		
		// note dao 설정
		INoteDAO nDao = sqlSession.getMapper(INoteDAO.class);
				
		// 보내는 사람 코드
		String membercode = (String)session.getAttribute("membercode");
		
		
		// 받는 사람 아이디
		String receiverId = request.getParameter("receiver");
		// 받는 사람 코드 
		String receivercode = mDao.codeSearchById(receiverId);
		
		// 만약 존재하지 않는 아이디라면
		if (receivercode == null)
		{
			IdCheck = false;
		}
		
		// 쪽지 내용
		String content = request.getParameter("content");
		// 노트DTO 설정
		NoteDTO note = new NoteDTO();
		note.setNote_sender_code(membercode);
		note.setNote_receiver_code(receivercode);
		note.setNote_content(content);
		
		try
		{
			if (IdCheck)	// 존재하는 아이디라면
			{
				nDao.add(note);
				
				mav.setViewName("redirect:mymessagesend.action");
			}
			else
			{
				mav.addObject("failId", receiverId);
				mav.setViewName("My_MessageInsertFail");
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
