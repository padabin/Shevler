/*
 * IScheduleDAO.java
 * - 인터페이스
 * - 플래너 2차페이지 관련 액션처리
 */
package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IScheduleDAO
{
	public ArrayList<ScheduleDTO> searchByPlannerCode(String planner_code) throws SQLException ;	//플래너에 속한 스케쥴 출력 (select)
	public int add(ScheduleDTO ScheduleDTO) throws SQLException;								//추가(insert)
	public int remove(String planner_code) throws SQLException;								//삭제(delete)
	public int getMaxDay(String planner_code) throws SQLException; 			// 해당 플래너의 최대 日 수
	public int getDataCount(String planner_code) throws SQLException;							// 해당 플러너의 전체 상세 스케쥴 수
	
	
	public ArrayList<ScheduleDTO> searchByPlannerCode2(String planner_code);	//플래너에 속한 스케쥴 출력 (select)
	
}
