/*
 	PlannerListController.java
   - 사용자 정의 컨트롤러 클래스
   - 플래너 리스트 뷰페이지
  
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PlannerListController implements Controller
{
	private IPaging paging;
	
	public void setPaging(IPaging paging)
	{
		this.paging = paging;
	}
	
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
		String memberCode = (String)session.getAttribute("membercode");
		IPlannerDAO dao = sqlSession.getMapper(IPlannerDAO.class);
		ArrayList<PlannerDTO> list = new ArrayList<PlannerDTO>();
		
		try
		{
			
			if (memberCode == null)
			{
				mav.setViewName("redirect:loginopen.action");
				return mav;
			}
			
			// 페이징 처리 사전 작업
			String pageNum = request.getParameter("pageNum");
			
			int currentPage = 1;
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			int dataCount = dao.dataCount(memberCode);
			
			int numPerPage = 10;
			int totalPage = paging.getPageCount(numPerPage, dataCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			// lists 에 받은 플래너 리스트를 담아서 뷰페이지에 보내기
			list = dao.list(memberCode, start, end);
			mav.addObject("list", list);
			mav.addObject("pageNum", pageNum);
			
			String listUrl = "plannerlist.action";
			String pageIndexList = paging.getIndexList(currentPage, totalPage, listUrl);
			
			mav.addObject("pageIndexList", pageIndexList);
			
			mav.setViewName("PlannerList");
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
}




















