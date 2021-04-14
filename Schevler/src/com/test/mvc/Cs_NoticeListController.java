/*==================================
	Cs_NoticeListController.java
	- 공지사항 조회 리스트 컨트롤러
====================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class Cs_NoticeListController implements Controller
{
	//인터페이스 기반 자료형 구성
	private INoticeDAO dao;
	
	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}

	// 인터페이스 기반 페이징 구성
	
	private INotice_paging paging;
	
	public void setPaging(INotice_paging paging)
	{
		this.paging = paging;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<NoticeDTO> lists = new ArrayList<NoticeDTO>();
		
		String pageNum = request.getParameter("pageNum");
		String notice_code = request.getParameter("notice_code");
		String notice_type_code = request.getParameter("notice_type_code");
		String member_id = request.getParameter("member_id");
		String member_code = request.getParameter("member_code");
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("notice_code", notice_code);
		mav.addObject("notice_type_code", notice_type_code);
		mav.addObject("member_code", member_code);
		mav.addObject("member_id", member_id);
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getDataCount();
		mav.addObject("dataCount", dataCount);
		
		int numPerPage = 10;
		int totalPage = paging.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		try
		{
			lists = dao.Lists(start, end);
			
			mav.addObject("lists", lists);
			
			String listUrl = "notice_list.action";
			String pageIndexList = paging.getIndexList(currentPage, totalPage, listUrl);
			
			mav.addObject("pageIndexList", pageIndexList);
			
			mav.setViewName("Cs_NoticeList");
					
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
}
