/*
 * ScheduleDTO.java
 * - 플래너 2차페이지 상세 일정 DTO
 */
package com.test.mvc;

public class ScheduleDTO
{
	private String schedule_value; // 각 플래너의 몇번째 장소인지
	private String schedule_is_first; // 각 일자의 첫번째 장소인지   0 - 첫번째 장소가 아님  1 - 첫번째 장소임
	private String schedule_code, schedule_ref_code, planner_code, schedule_place;
	private String schedule_x, schedule_y, schedule_start_time, schedule_end_time;
	private String schedule_content, schedule_day; // 메모
	private String schedule_img_src;	// 이미지 경로
	
	private String planner_title,planner_start_date,planner_end_date;
	
	
	
	
	
	
	public String getSchedule_img_src()
	{
		return schedule_img_src;
	}
	public void setSchedule_img_src(String schedule_img_src)
	{
		this.schedule_img_src = schedule_img_src;
	}
	public String getPlanner_title()
	{
		return planner_title;
	}
	public void setPlanner_title(String planner_title)
	{
		this.planner_title = planner_title;
	}
	public String getPlanner_start_date()
	{
		return planner_start_date;
	}
	public void setPlanner_start_date(String planner_start_date)
	{
		this.planner_start_date = planner_start_date;
	}
	public String getPlanner_end_date()
	{
		return planner_end_date;
	}
	public void setPlanner_end_date(String planner_end_date)
	{
		this.planner_end_date = planner_end_date;
	}
	public String getSchedule_is_first()
	{
		return schedule_is_first;
	}
	public void setSchedule_is_first(String schedule_is_first)
	{
		this.schedule_is_first = schedule_is_first;
	}
	
	
	public String getSchedule_value()
	{
		return schedule_value;
	}
	public void setSchedule_value(String schedule_value)
	{
		this.schedule_value = schedule_value;
	}
	public String getSchedule_day()
	{
		return schedule_day;
	}
	public void setSchedule_day(String schedule_day)
	{
		this.schedule_day = schedule_day;
	}
	public String getSchedule_code()
	{
		return schedule_code;
	}
	public void setSchedule_code(String schedule_code)
	{
		this.schedule_code = schedule_code;
	}
	public String getSchedule_ref_code()
	{
		return schedule_ref_code;
	}
	public void setSchedule_ref_code(String schedule_ref_code)
	{
		this.schedule_ref_code = schedule_ref_code;
	}
	public String getPlanner_code()
	{
		return planner_code;
	}
	public void setPlanner_code(String planner_code)
	{
		this.planner_code = planner_code;
	}
	public String getSchedule_place()
	{
		return schedule_place;
	}
	public void setSchedule_place(String schedule_place)
	{
		this.schedule_place = schedule_place;
	}
	public String getSchedule_x()
	{
		return schedule_x;
	}
	public void setSchedule_x(String schedule_x)
	{
		this.schedule_x = schedule_x;
	}
	public String getSchedule_y()
	{
		return schedule_y;
	}
	public void setSchedule_y(String schedule_y)
	{
		this.schedule_y = schedule_y;
	}
	public String getSchedule_start_time()
	{
		return schedule_start_time;
	}
	public void setSchedule_start_time(String schedule_start_time)
	{
		this.schedule_start_time = schedule_start_time;
	}
	public String getSchedule_end_time()
	{
		return schedule_end_time;
	}
	public void setSchedule_end_time(String schedule_end_time)
	{
		this.schedule_end_time = schedule_end_time;
	}
	public String getSchedule_content()
	{
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content)
	{
		this.schedule_content = schedule_content;
	}
	
	
	
}
