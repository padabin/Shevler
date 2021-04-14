/*=================================
   FoodUpdateOpenController.java
==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class FoodUpdateOpenController implements Controller
{
	private IArticleDAO cdao;
	
	public void setCdao(IArticleDAO cdao)
	{
		this.cdao = cdao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 이전 페이지(FoodArticleDetail.jsp) 로 부터 데이터 수신
		String pageNumStr = request.getParameter("pageNum");
		String articleCode = request.getParameter("articleCode");
		String bnoStr = request.getParameter("bno");
		
		int pageNum = Integer.parseInt(pageNumStr);
		int bno = Integer.parseInt(bnoStr);
		
		try
		{
			// 수정 할 게시물 상세 내용 가져오기
			ArticleDTO dto = cdao.getReadDate(bno);
			
			mav.addObject("pageNum", pageNum);
			mav.addObject("articleCode", articleCode);
			mav.addObject("bno", bno);
			mav.addObject("dto", dto);
			
			mav.setViewName("FoodArticleUpdateForm");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
}
