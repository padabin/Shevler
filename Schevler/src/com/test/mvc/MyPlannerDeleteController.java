/*================================
    MyPlannerDeleteController.java
================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyPlannerDeleteController implements Controller
{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String planner_code = request.getParameter("planner_code");
		String pageNum = request.getParameter("pageNum");
		HttpSession session = request.getSession();
		String memberCode = (String)session.getAttribute("membercode");
		
		IPlannerDAO dao = sqlSession.getMapper(IPlannerDAO.class);
		
		try
		{
			dao.remove(planner_code);
			
			mav.setViewName("redirect:myplannerlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
