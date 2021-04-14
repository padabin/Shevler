package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QnaInsertController implements Controller
{
	
	private IQnaDAO qdao;
	
	public void setQdao(IQnaDAO qdao)
	{
		this.qdao = qdao;
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
		
		
		// 세션에서 회원코드 데이터 수신
		String membercode = (String)session.getAttribute("membercode");
		
		// 이전 페이지로부터(Join.jsp) 데이터 수신
		String qnatitle = request.getParameter("qnatitle");
		String qnatype = request.getParameter("qnatype");
		String qnacontent = request.getParameter("qnacontent");	
		
		
		
		try
		{
			QnaDTO dto = new QnaDTO();
			
			dto.setMemberCode(membercode);
			dto.setQnaquestionTitle(qnatitle);
			dto.setQnatypeCode(qnatype);
			dto.setQnaquestionContent(qnacontent);
			
			
			
			qdao.qnaAdd(dto);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.setViewName("redirect:main.action");
		
		
		return mav;
	}

}
