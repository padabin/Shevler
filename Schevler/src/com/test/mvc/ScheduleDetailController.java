/*================================
   SampleController.java
   - 사용자 정의 컨트롤러 클래스
 =================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』인터페이스를 구현함으로써
//사용자 정의 컨트롤러 클래스를 구성한다.

public class ScheduleDetailController implements Controller
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
		IScheduleDAO dao = sqlSession.getMapper(IScheduleDAO.class);
		IPlannerDAO pdao = sqlSession.getMapper(IPlannerDAO.class);
		String planner_code = request.getParameter("planner_code");
		ArrayList<ScheduleDTO> lists = new ArrayList<ScheduleDTO>();
		PlannerDTO sublist = new PlannerDTO();
		int maxDay = 0;

		try
		{
			lists = dao.searchByPlannerCode(planner_code);
			sublist = pdao.searchByCode(planner_code);
			maxDay = dao.getMaxDay(planner_code);
			mav.addObject("lists", lists);
			mav.addObject("sublist", sublist);
			mav.addObject("planner_code", planner_code);
			mav.addObject("maxDay", maxDay);
			
			mav.setViewName("ScheduleDetail");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
}
