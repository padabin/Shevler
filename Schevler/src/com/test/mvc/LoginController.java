/*=====================================================
   LoginController.java
   - 사용자 정의 컨트롤러 클래스
   - 로그인 액션 처리 전용 클래스.
   - 로그인 액션 처리 이후
     『main.action』 / 『mainadmin.action』을
     요청할 수 있도록 처리.
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
     → 인터페이스 자료형 구성, setter 메소드 정의
====================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LoginController implements Controller
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
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String admin = request.getParameter("admin");
		
		// 로그인 반환값
		String name = null;
		
		try
		{	
			// 관리자가 아니면...
			if(admin==null)
			{
				// 일반회원 로그인
				name = dao.login(id, pw).get(0);
			}
			// 관리자면...
			else
			{
				// 관리자로 로그인
				name = dao.loginAdmin(id, pw).get(0);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 로그인 실패시...
		if(name==null)
		{
			mav.setViewName("redirect:loginopen.action");
		}
		// 로그인 성공시...
		else
		{
			// 세션값 저장...
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("membercode", dao.login(id, pw).get(1));
			session.setAttribute("memberId", dao.login(id, pw).get(2));
			session.setAttribute("id", id);
			// 일반회원의 경우...
			if(admin==null)
			{
				mav.setViewName("redirect:main.action");
			}
			else
			{
				// 관리자 로그인 성공 경우...
				session.setAttribute("admin", "admin");
				session.setAttribute("name", name);
				session.setAttribute("membercode", dao.login(id, pw).get(1));
				session.setAttribute("memberId", dao.login(id, pw).get(2));
				mav.setViewName("redirect:main.action");
			}
		}
		return mav;
	}
	
}




















