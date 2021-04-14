/*
 * IPlannerDAO.java
 * - 인터페이스
 * - 플래너 1차페이지 관련 액션처리
 */
package com.test.mvc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface IPlannerDAO
{
	// list 메소드 매개변수 수정!! 예슬
	public ArrayList<PlannerDTO> list(@Param("memberCode")String memberCode, @Param("start")int start,@Param("end")int end);	//플래너 리스트 출력(select)
	public PlannerDTO searchByCode(String planner_code);			//플래너 1개 정보 출력(id)로 (select)
	public int add(PlannerDTO plannerDTO);						//추가(insert)
	public int modify(PlannerDTO plannerDTO);					//수정(update)
	// remove 메소드 매개변수 수정!! 예슬
	public int remove(String planner_code);					//삭제(delete)
	
	// 추가!!! 예슬
	public int dataCount(String memberCode);

	

	
}
