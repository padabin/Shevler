
package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class Cs_NoticeUpdateFormController implements Controller
{
	private INoticeDAO dao;
		
	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		ArrayList<NoticeDTO> noticeType = new ArrayList<NoticeDTO>();
		
		try
		{
			//이전 페이지(Cs_NoticeDetail.jsp)로 부터 데이터 수신
			String pageNumStr = request.getParameter("pageNum");
			String notice_code = request.getParameter("notice_code");
			String nnoStr = request.getParameter("nno");
			String member_code = request.getParameter("member_code");
			String notice_type_code = request.getParameter("notice_type_code");
			
			int pageNum = Integer.parseInt(pageNumStr);
			int nno = Integer.parseInt(nnoStr);
		
		
			//수정 할 게시물 상세 내용 가져오기
			NoticeDTO dto = dao.getReadData(nno);
			noticeType = dao.noticeTypeList();
			
			mav.addObject("pageNum", pageNum);
			mav.addObject("notice_code", notice_code);
			mav.addObject("noticeType",noticeType );
			mav.addObject("member_code", member_code);
			mav.addObject("notice_type_code", notice_type_code);
			mav.addObject("nno", nno);
			mav.addObject("dto", dto);
			
			mav.setViewName("Cs_NoticeUpdateForm");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());		
		}
		
		return mav;
		
	}
	
}
