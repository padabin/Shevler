package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleInsertActionController implements Controller
{
	
	private IArticleDAO fDao;		// 맛집 게시판
	private IArticleDAO tDao;		// 팁 게시판
	private IArticleDAO sDao;		// 여행 자랑 게시판

	public void setfDao(IArticleDAO fDao)
	{
		this.fDao = fDao;
	}
	public void settDao(IArticleDAO tDao)
	{
		this.tDao = tDao;
	}
	public void setsDao(IArticleDAO sDao)
	{
		this.sDao = sDao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String boardTypeCode =(String) session.getAttribute("boardType");
		String memberCode =(String) session.getAttribute("membercode");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		ArticleDTO artDto = new ArticleDTO();
		artDto.setBoardTypeCode(boardTypeCode);
		artDto.setMemberCode(memberCode);
		artDto.setArticleTitle(title);
		artDto.setArticleContent(content);
		
		
		try
		{
			if (boardTypeCode.equals("BT1")) 	  // 맛집이라면
			{
				fDao.articleAdd(artDto);
				mav.setViewName("redirect:foodarticleopen.action");
			}
			else if (boardTypeCode.equals("BT2")) // 여행 팁이라면
			{
				tDao.articleAdd(artDto);
				mav.setViewName("redirect:tiparticleopen.action");
			}
			else if (boardTypeCode.equals("BT3")) // 여행 자랑이라면
			{
				sDao.articleAdd(artDto);
				mav.setViewName("redirect:storyopen.action");
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		
		
		return mav;
	}








	
	
}
