/*==================================
  TipArticleWriteFormController.java
  - tiparticle 게시글 작성 폼 페이지 이동 
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TipArticleWriteFormController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session =  request.getSession();
		
		String membercode = (String)session.getAttribute("membercode");
		session.setAttribute("boardType", "BT2");
		
		if(membercode != null)
			mav.setViewName("ArticleWriteForm");
		else
			mav.setViewName("redirect:login.action");
		
		return mav;
	}

}
