package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyPageEmailChangeController implements Controller
{
	private IMemberDAO dao; 
	
	
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		
		
ModelAndView mav = new ModelAndView();
		
		// 세션에서 멤버코드가져오기
		HttpSession session = request.getSession();
		String membercode = (String) session.getAttribute("membercode");
		// Mypage.jsp에서 이메일 값 가져오기
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		String email = email1 + "@" + email2;
		
		// dto에 멤버코드, 이메일 set
		MemberDTO dto = new MemberDTO();
		dto.setMemberCode(membercode);
		dto.setMemberEmail(email);
		
		// 수정 액션
		dao.memberEmailModify(dto);
		
		
		
		
		// 수정된 결과를 보여주도록 mypage.aciton으로 리다이렉트
		mav.setViewName("redirect:mypage.action");
		
		return mav;
	}
	
}
