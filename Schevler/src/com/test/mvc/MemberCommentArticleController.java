/*===========================
  MemberArticleController.java
===========================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class MemberCommentArticleController implements Controller
{
	private IArticleDAO cdao;
	
	public void setCdao(IArticleDAO cdao)
	{
		this.cdao = cdao;
	}
	
	private IPaging pdao;
	
	public void setPdao(IPaging pdao)
	{
		this.pdao = pdao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<ArticleDTO> lists = new ArrayList<ArticleDTO>();
		String pageNum = request.getParameter("pageNum");
		String memberId = request.getParameter("memberId");
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("memberId", memberId);
		
		int currentPage = 1;
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = cdao.getMemberCommentDataCount(memberId);
		
		int numPerPage = 10;
		int totalPage = pdao.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		try
		{
			lists = cdao.memberCommentLists(start, end, memberId);
			
			mav.addObject("lists", lists);
			
			
			String listUrl = "membercommentlist.action?memberId=" + memberId;
			String pageIndexList = pdao.getIndexList(currentPage, totalPage, listUrl);
			
			mav.addObject("pageIndexList", pageIndexList);
			
			mav.setViewName("MemberCommentArticleList");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
