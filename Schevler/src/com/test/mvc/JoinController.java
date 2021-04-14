/*======================================== 
   JoinController.java
   - 회원가입페이지에서 데이터 수신하여
   - DB에 저장 및 액션 처리
========================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class JoinController implements Controller
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
		
		// 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가) ----------------------------------------
		HttpSession session = request.getSession();
		
		if(session.getAttribute("name")!=null)
		{
			// 만약 로그인되어있는 상황인데 회원가입 페이지로 들어올 경우
			mav.setViewName("redirect:main.action");
		}
		//  ---------------------------------------- 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가)
		
		// 이전 페이지로부터(Join.jsp) 데이터 수신
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String rrn = request.getParameter("rrn");
		String rrn2 = request.getParameter("rrn2");
		String email = request.getParameter("email");
		String email2 = request.getParameter("email2");
		String tel = request.getParameter("tel");
		
		String emailFull = email + "@" + email2;
		String rrnFull = rrn + "-" + rrn2;
		
		try
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setMemberId(id);
			dto.setMemberName(name);
			dto.setMemberPw(pw);
			dto.setMemberSsn(rrnFull);
			dto.setMemberEmail(emailFull);
			dto.setMemberTel(tel);
			
			dao.memberAdd(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.setViewName("redirect:loginopen.action");
		
		return mav;
	}

}
