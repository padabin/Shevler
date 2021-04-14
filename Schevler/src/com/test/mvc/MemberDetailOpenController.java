/*====================================
    MemberDetailOpenController.java
====================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MemberDetailOpenController implements Controller
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
		
		// 이전 페이지(MemberArticleList.jsp)로부터 데이터 수신
		String strBno = request.getParameter("bno");
		int bno = Integer.parseInt(strBno);
		String articleCode = request.getParameter("articleCode");
		String pageNum = request.getParameter("pageNum");
		String memberId = request.getParameter("memberId");
		
		int likeCount = 0;
		
		ArrayList<ArticleDTO> lists = new ArrayList<ArticleDTO>();
		
		try
		{
			// 해당 게시물의 조회수 증가
			cdao.updateHitCount(articleCode);
			
			// 해당 게시물의 추천수 가져오기
			likeCount = cdao.getLikeCount(articleCode);
			
			// 해당 게시물 상세 내용 가져오기
			ArticleDTO dto = cdao.getMemberReadDate(articleCode);
			
			// 해당 게시물 댓글 수 가져오기
			int commentCount = cdao.getCommentCount(articleCode);
			
			// 해당 게시물의 댓글 가져오기
			lists = cdao.commentLists(articleCode);
			
			// 해당 게시물의 이전글, 다음글 게시물 번호 확인
			int beforeNum = cdao.getBeforeNum(bno);
			int nextNum = cdao.getNextNum(bno);
			
			ArticleDTO dtoBefore = null;
			ArticleDTO dtoNext = null;
			
			if(beforeNum != -1)
				dtoBefore = cdao.getReadDate(beforeNum);
			if(nextNum != -1)
				dtoNext = cdao.getReadDate(nextNum);
			
			mav.addObject("dto", dto);
			mav.addObject("articleCode", articleCode);
			mav.addObject("likeCount", likeCount);
			mav.addObject("beforeNum", beforeNum);
			mav.addObject("pageNum", pageNum);
			mav.addObject("nextNum", nextNum);
			mav.addObject("dtoBefore", dtoBefore);
			mav.addObject("dtoNext", dtoNext);
			mav.addObject("lists", lists);
			mav.addObject("commentCount", commentCount);
			mav.addObject("memberId", memberId);
			
			mav.setViewName("MemberArticleDetail");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
