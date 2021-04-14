package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class QnaDAO implements IQnaDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	// 1:1문의 등록
	@Override
	public int qnaAdd(QnaDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO QNA_QUESTION(QNA_QUESTION_CODE, QNA_TYPE_CODE, MEMBER_CODE"
				   + ", QNA_QUESTION_TITLE, QNA_QUESTION_CONTENT, QNA_QUESTION_DATE)"
				   + " VALUES('QQ' || QNA_QUESTION_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getQnatypeCode());
		pstmt.setString(2, dto.getMemberCode());
		pstmt.setString(3, dto.getQnaquestionTitle());
		pstmt.setString(4, dto.getQnaquestionContent());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 1:1문의 내역(각 회원별)
	@Override
	public ArrayList<QnaDTO> list(String membercode) throws SQLException
	{
		ArrayList<QnaDTO> result = new ArrayList<QnaDTO>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT QNA_QUESTION_CODE, QNA_TYPE_CODE, QNA_TYPE_DETAIL,"
			 	   + " QNA_QUESTION_TITLE, QNA_QUESTION_CONTENT, QNA_QUESTION_DATE, COMMENT_STATUS"
			 	   + " FROM VIEW_QUESTION"
			 	   + " WHERE MEMBER_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, membercode);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			QnaDTO qna = new QnaDTO();
			
			qna.setQnaquestionCode(rs.getString("QNA_QUESTION_CODE"));
			qna.setQnatypeCode(rs.getString("QNA_TYPE_CODE"));
			qna.setQnatypeDetail(rs.getString("QNA_TYPE_DETAIL"));
			qna.setQnaquestionTitle(rs.getString("QNA_QUESTION_TITLE"));
			qna.setQnaquestionContent(rs.getString("QNA_QUESTION_CONTENT"));
			qna.setQnaquestionDate(rs.getString("QNA_QUESTION_DATE"));
			qna.setCommentStatus(rs.getString("COMMENT_STATUS"));
			
			result.add(qna);
		}
		
		rs.close();
		pstmt.close();
		conn.close();

		
		return result;
	}

	@Override
	public ArrayList<QnaDTO> commentList(String qnaquestionCode) throws SQLException
	{
		ArrayList<QnaDTO> result = new ArrayList<QnaDTO>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT QNA_ANSWER_CODE, QNA_QUESTION_CODE,"
				+ " MEMBER_ID, QNA_ANSWER_TITLE, QNA_ANSWER_CONTENT, QNA_ANSWER_DATE"
				+ " FROM VIEW_QUESTION_COMMENT"
				+ " WHERE QNA_QUESTION_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, qnaquestionCode);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			QnaDTO dto = new QnaDTO();
			
			dto.setQnaanswerCode(rs.getString("QNA_ANSWER_CODE"));
			dto.setQnaquestionCode(rs.getString("QNA_QUESTION_CODE"));
			dto.setMemberId(rs.getString("MEMBER_ID"));
			dto.setQnaanswerTitle(rs.getString("QNA_ANSWER_TITLE"));
			dto.setQnaanswerContent(rs.getString("QNA_ANSWER_CONTENT"));
			dto.setQnaanswerDate(rs.getString("QNA_ANSWER_DATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
	}
	
	
}
