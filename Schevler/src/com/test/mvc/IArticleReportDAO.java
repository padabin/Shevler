/*
 * INoteReportDAO.java
 * 쪽지 신고 처리 인터페이스
 */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IArticleReportDAO
{
	// 들어온 신고 리스트 조회
	public ArrayList<ArticleReportDTO> lists() throws SQLException;
	
	// 신고 처리 메소드
	public int reportProcess(@Param("article_rep_in_code")String article_rep_in_code, @Param("memberCode")String memberCode, @Param("article_rep_out_process")String article_rep_out_process) throws SQLException;

	// 특정 유저가 신고 당한 횟수
	public int totalReportedById(@Param("id")String id) throws SQLException;

}
