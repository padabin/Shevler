/*
 * INoteReportDAO.java
 * 쪽지 신고 처리 인터페이스
 */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface INoteReportDAO
{
	// 들어온 신고 리스트 조회
	public ArrayList<NoteReportDTO> lists() throws SQLException;
	
	// 신고 처리 메소드
	public int reportProcess(@Param("note_rep_in_code")String note_rep_in_code, @Param("memberCode")String memberCode, @Param("note_rep_out_process")String note_rep_out_process) throws SQLException;

	// 특정 유저 신고 당한 횟수
	public int totalReportedById(@Param("id")String id) throws SQLException;
	
	// 중복 체크 검사 
	public int doubleCheck(@Param("note_code")String note_code, @Param("member_code")String member_code) throws SQLException;

	// 신고 넣는 insert 액션
	public int reportAction(@Param("note_code")String note_code, @Param("member_code")String member_code, @Param("rep_type_code")String rep_type_code, @Param("note_rep_in_content")String note_rep_in_content ) throws SQLException;
	
}
