/*
 *  PlannerUpdateFormController.java
 * - 1차 페이지 수정
 */

package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class PlannerUpdateFormController implements Controller
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
		
		HttpSession session = request.getSession();
		IPlannerDAO plannerDAO = sqlSession.getMapper(IPlannerDAO.class);
		// 플래너 코드 가져오기
		String planner_code = request.getParameter("planner_code");
		try 
		{
			
			
			// 해당 플래너 상세내용 가져오기
			PlannerDTO dto = plannerDAO.searchByCode(planner_code);
		
			
			// 플래너 1차페이지 내용 넘기기
			mav.addObject("dto", dto);
			mav.addObject("planner_code", planner_code);
	      
			mav.setViewName("Planner_First_Update");		
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		
		return mav;
	}
	
	

}
