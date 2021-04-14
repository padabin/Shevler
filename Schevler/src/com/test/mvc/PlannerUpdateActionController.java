/*
 *  PlannerUpdateActionController.java
 * - 1차 페이지 수정 액션
 */

package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class PlannerUpdateActionController implements Controller
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
		
		// 세션에서 멤버코드 가져오기
		String member_code = (String)session.getAttribute("membercode");
		// 이전 페이지에서 update 처리를 위한 파라미터 가져오기
		String planner_code = request.getParameter("planner_code");
		String planner_title = request.getParameter("title");
		String matching_availability_code = request.getParameter("matchingavailability");
		String planner_start_date = request.getParameter("startdate");
		String planner_end_date = request.getParameter("enddate");
		String travel_type_code = request.getParameter("traveltype");
		String planner_budget = request.getParameter("budget");
		String transportation_code = request.getParameter("transportation");
		String planner_min = request.getParameter("min");
		String planner_max = request.getParameter("max");
		
		// dto 세팅
		PlannerDTO dto = new PlannerDTO();
		dto.setMember_code(member_code);
		dto.setPlanner_code(planner_code);
		dto.setPlanner_title(planner_title);
		dto.setMatching_availability_code(matching_availability_code);
		dto.setPlanner_start_date(planner_start_date);
		dto.setPlanner_end_date(planner_end_date);
		dto.setTravel_type_code(travel_type_code);
		dto.setPlanner_budget(planner_budget);
		dto.setTransportation_code(transportation_code);
		dto.setPlanner_max(planner_max);
		dto.setPlanner_min(planner_min);
		
		
		// dao로 업데이트 액션 처리
		IPlannerDAO plannerDAO = sqlSession.getMapper(IPlannerDAO.class);
		
		try 
		{
			
			
			plannerDAO.modify(dto);
	      
			mav.setViewName("redirect:plannerlist.action");		
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		
		return mav;
	}
	
	

}
