/*
 * PlannerDTO.java
 * - 1차 페이지 정보
 */
package com.test.mvc;

public class PlannerDTO
{
	private int planner_seq;
	private String rnum, planner_code, planner_ref_code, member_code, member_name, planner_title;
	private String planner_start_date, planner_end_date, travel_type_code, travel_type_name;
	private String planner_budget, planner_min, planner_max;	// Integer
	private String transportation_code, transportation_detail, matching_availability_code, matching_availability_detail;
	private String planner_date, planner_update_date;
	
	
	
	public String getRnum()
	{
		return rnum;
	}
	public void setRnum(String rnum)
	{
		this.rnum = rnum;
	}
	public int getPlanner_seq()
	{
		return planner_seq;
	}
	public void setPlanner_seq(int planner_seq)
	{
		this.planner_seq = planner_seq;
	}
	public String getPlanner_code()
	{
		return planner_code;
	}
	public void setPlanner_code(String planner_code)
	{
		this.planner_code = planner_code;
	}
	public String getPlanner_ref_code()
	{
		return planner_ref_code;
	}
	public void setPlanner_ref_code(String planner_ref_code)
	{
		this.planner_ref_code = planner_ref_code;
	}
	public String getMember_code()
	{
		return member_code;
	}
	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}
	public String getMember_name()
	{
		return member_name;
	}
	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
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
	public String getTravel_type_code()
	{
		return travel_type_code;
	}
	public void setTravel_type_code(String travel_type_code)
	{
		this.travel_type_code = travel_type_code;
	}
	public String getTravel_type_name()
	{
		return travel_type_name;
	}
	public void setTravel_type_name(String travel_type_name)
	{
		this.travel_type_name = travel_type_name;
	}
	public String getPlanner_budget()
	{
		return planner_budget;
	}
	public void setPlanner_budget(String planner_budget)
	{
		this.planner_budget = planner_budget;
	}
	public String getPlanner_min()
	{
		return planner_min;
	}
	public void setPlanner_min(String planner_min)
	{
		this.planner_min = planner_min;
	}
	public String getPlanner_max()
	{
		return planner_max;
	}
	public void setPlanner_max(String planner_max)
	{
		this.planner_max = planner_max;
	}
	public String getTransportation_code()
	{
		return transportation_code;
	}
	public void setTransportation_code(String transportation_code)
	{
		this.transportation_code = transportation_code;
	}
	public String getTransportation_detail()
	{
		return transportation_detail;
	}
	public void setTransportation_detail(String transportation_detail)
	{
		this.transportation_detail = transportation_detail;
	}
	public String getMatching_availability_code()
	{
		return matching_availability_code;
	}
	public void setMatching_availability_code(String matching_availability_code)
	{
		this.matching_availability_code = matching_availability_code;
	}
	public String getMatching_availability_detail()
	{
		return matching_availability_detail;
	}
	public void setMatching_availability_detail(String matching_availability_detail)
	{
		this.matching_availability_detail = matching_availability_detail;
	}
	public String getPlanner_date()
	{
		return planner_date;
	}
	public void setPlanner_date(String planner_date)
	{
		this.planner_date = planner_date;
	}
	public String getPlanner_update_date()
	{
		return planner_update_date;
	}
	public void setPlanner_update_date(String planner_update_date)
	{
		this.planner_update_date = planner_update_date;
	}
	
	
	
}
