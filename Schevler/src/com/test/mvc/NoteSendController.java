/*
 * NoteSendController.jva
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

public class NoteSendController implements Controller
{
	private SqlSession sqlSession;
	private IPaging paging;
	
	public void setPaging(IPaging paging)
	{
		this.paging = paging;
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
		String membercode = (String)session.getAttribute("membercode");
		ArrayList<NoteDTO> lists = new ArrayList<NoteDTO>();
		INoteDAO dao = sqlSession.getMapper(INoteDAO.class);
		try
		{
			// 페이징 처리 사전 작업
			String pageNum = request.getParameter("pageNum");
			
			int currentPage = 1;
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			int dataCount = dao.getDataCountSend(membercode);
			
			int numPerPage = 10;
			int totalPage = paging.getPageCount(numPerPage, dataCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			
			// lists에 받은 쪽지들 리스트 담아서 뷰페이지에 보내기
			lists = dao.sendMsgList(membercode,start,end);
			mav.addObject("lists", lists);
			
			
			String listUrl = "mymessagesend.action";
			String pageIndexList = paging.getIndexList(currentPage, totalPage, listUrl);
			
			mav.addObject("pageIndexList", pageIndexList);
			
			
			
			
			mav.setViewName("My_MessageSendList");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
