
package com.test.mvc;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class Cs_NoticeSearchController implements Controller
{
	private INoticeDAO dao;
	
	
	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}
	
	private INotice_paging paging;
	
	
	public void setPaging(INotice_paging paging)
	{
		this.paging = paging;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		//이전 페이지로부터 수신
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String pageNum = request.getParameter("pageNum");
		
		//검색 기능을 통해 페이지가 요청되었을 경우...
		if(searchKey != null)
		{
			//넘어온 값이 GET 방식이라면...
			//인코딩 처리
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		else
		{
			searchKey = "notice_title";
			searchValue = "";
		}
		
		int currentPage = 1;		//현재 페이지 초기화
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//검색한 데이터 갯수 구하기
		int dataCount = dao.getSearchDataCount(searchKey, searchValue);
		
		//한 페이지에 출력할 게시글 수
		int numPerPage = 10;
		//총 페이지
		int totalPage = paging.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		try
		{
			ArrayList<NoticeDTO> lists = dao.searchList(start, end, searchKey, searchValue);
			mav.addObject("lists", lists);
			
			String param = "";
			
			//검색 값이 존재한다면
			if(!searchValue.equals(""))
			{
				param += "?searchKey=" + searchKey;
				param += "&searchValue=" + searchValue;
			}
			
			String listUrl = "notice_list.action" + param;
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
