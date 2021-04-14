/*
 * NoteMultipleBinController.jva
 * - 쪽지 휴지통 보내기 액션 처리
 */
package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoteMultipleBinController implements Controller
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
	
		// note dao 설정
		INoteDAO nDao = sqlSession.getMapper(INoteDAO.class);
				
		// 체크박스 가져오기
		String[] noteCodes = request.getParameterValues("noteCodes");

		try
		{
			if (noteCodes != null)
			{
				for (String noteCode : noteCodes)
				{
					// note_receiever_delete 를 sysdate로 업데이트 메소드
					nDao.putIntoBin(noteCode);
				}
			}
			
			
			
			mav.setViewName("redirect:mymessagereceive.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
