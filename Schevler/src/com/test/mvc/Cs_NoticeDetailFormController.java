
package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.


public class Cs_NoticeDetailFormController implements Controller
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
		
		//이전 페이지(Cs_NoticeList.jsp로부터 데이터 수신
		// ( 게시판번호(nno),공지사항코드(notice_code),아이디(member_id),멤버코드(member_code)
		//,공지사항카테고리코드(notice_type_code) ,페이징숫자(pageNum) )
		String nnoStr = request.getParameter("nno");
		int nno = Integer.parseInt(nnoStr);
		String notice_code = request.getParameter("notice_code");
		String member_id = request.getParameter("member_id");
		String member_code = request.getParameter("member_code");
		String notice_type_code = request.getParameter("notice_type_code");
		String pageNum = request.getParameter("pageNum");
		
		ArrayList<NoticeDTO> lists = new ArrayList<NoticeDTO>();
		
		try
		{
			// 해당 게시물 상세 내용 가져오기
			NoticeDTO dto = dao.getReadData(nno);
			
			// 해당 게시물의 이전글,다음글 게시물 번호 확인
			int beforeNum = dao.getBeforeNum(nno);
			int nextNum = dao.getNextNum(nno);
			
			NoticeDTO dtoBefore = null;
			NoticeDTO dtoNext = null;
			
			if(beforeNum != -1)
				dtoBefore = dao.getReadData(beforeNum);
			if(nextNum != -1)
				dtoNext = dao.getReadData(nextNum);
			
			mav.addObject("dto", dto);
			mav.addObject("notice_code", notice_code);
			mav.addObject("pageNum", pageNum);
			mav.addObject("beforeNum", beforeNum);
			mav.addObject("nextNum", nextNum);
			mav.addObject("dtoBefore", dtoBefore);
			mav.addObject("dtoNext", dtoNext);
			mav.addObject("lists", lists);
			mav.addObject("notice_type_code", notice_type_code);
			mav.addObject("member_code", member_code);
			mav.addObject("member_id", member_id);
			
			mav.setViewName("Cs_NoticeDetail");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
}
