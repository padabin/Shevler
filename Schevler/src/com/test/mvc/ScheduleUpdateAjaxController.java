/*
 *  PlannerCreateAjaxController.java
 * - 일정 생성 버튼 클릭시 ajax 처리 (1차 페이지 Planner  2차 페이지 Schedule DB에 삽입)
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class ScheduleUpdateAjaxController implements Controller
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
		String member_code = (String) session.getAttribute("membercode");
		String planner_code = request.getParameter("planner_code");
		
		/*
		 * // 1차 페이지 목록 (Planner 테이블) String planner_title = (String)
		 * session.getAttribute("title"); String matching_availability_code =
		 * (String)session.getAttribute("matching_availability"); String
		 * planner_start_date = (String)session.getAttribute("startdate"); String
		 * planner_end_date= (String)session.getAttribute("enddate"); String
		 * travel_type_code = (String)session.getAttribute("traveltype"); String budget
		 * = (String)session.getAttribute("budget"); String min =
		 * (String)session.getAttribute("min"); String max =
		 * (String)session.getAttribute("max"); String transportation_code =
		 * (String)session.getAttribute("transportation");
		 * 
		 * PlannerDTO plannerDTO = new PlannerDTO();
		 * plannerDTO.setMember_code(member_code);
		 * plannerDTO.setPlanner_title(planner_title);
		 * plannerDTO.setMatching_availability_code(matching_availability_code);
		 * plannerDTO.setPlanner_start_date(planner_start_date);
		 * plannerDTO.setPlanner_end_date(planner_end_date);
		 * plannerDTO.setTravel_type_code(travel_type_code);
		 * plannerDTO.setPlanner_budget(budget); plannerDTO.setPlanner_min(min);
		 * plannerDTO.setPlanner_max(max);
		 * plannerDTO.setTransportation_code(transportation_code);
		 * 
		 * // 세션값 지우기 session.removeAttribute("title");
		 * session.removeAttribute("matching_availability");
		 * session.removeAttribute("startdate"); session.removeAttribute("enddate");
		 * session.removeAttribute("traveltype"); session.removeAttribute("budget");
		 * session.removeAttribute("min"); session.removeAttribute("max");
		 * session.removeAttribute("transportation");
		 */
		
		
		try 
		{
			/*
			 * // 1차 페이지 insert IPlannerDAO plannerDAO =
			 * sqlSession.getMapper(IPlannerDAO.class); plannerDAO.add(plannerDTO); int seq
			 * = plannerDTO.getPlanner_seq();
			 * 
			 * System.out.println(seq);
			 * 
			 * String planner_code = "PL" + seq;
			 */
			
			
			// 스케쥴 목록 (Schedule 테이블)
		    String schedules = request.getParameter("schedules");
		    
		    IScheduleDAO scheduleDAO = sqlSession.getMapper(IScheduleDAO.class);
		    scheduleDAO.remove(planner_code);
		    
		    JSONParser jsonParser = new JSONParser(); 
		    
	        JSONArray scheduleArray = (JSONArray) jsonParser.parse(schedules);
	        
	        // 모든 스케쥴 dto
	        ArrayList<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();
	        
	        for (int i = 0; i < scheduleArray.size(); i++)
			{
	        	JSONObject scheduleObject = (JSONObject) scheduleArray.get(i);
	        	
	        	
	        	
	        	
	        	ScheduleDTO scheduleDTO = new ScheduleDTO();
	        	
				scheduleDTO.setPlanner_code(planner_code);
				
				scheduleDTO.setSchedule_img_src((String) scheduleObject.get("imgSrc"));
				scheduleDTO.setSchedule_value((String) scheduleObject.get("num"));
				scheduleDTO.setSchedule_is_first((String) scheduleObject.get("isFirst"));
				
			    scheduleDTO.setSchedule_place((String) scheduleObject.get("name"));
			    scheduleDTO.setSchedule_content((String) scheduleObject.get("memo"));    
			    scheduleDTO.setSchedule_x((String) scheduleObject.get("x"));
			    scheduleDTO.setSchedule_y((String) scheduleObject.get("y"));
			    
			    
			    scheduleDTO.setSchedule_start_time((String) scheduleObject.get("startTime"));
			    scheduleDTO.setSchedule_end_time((String) scheduleObject.get("endTime"));
			    scheduleDTO.setSchedule_day((String)scheduleObject.get("day"));
				 
			    scheduleList.add(scheduleDTO);
			}
			
	        
	        for (ScheduleDTO scheduleDTO : scheduleList)
			{
				scheduleDAO.add(scheduleDTO);
			}
	  
				
			mav.addObject("check", "check");
			mav.setViewName("PlannerAjax");		
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		
		return mav;
	}
	
	

}
