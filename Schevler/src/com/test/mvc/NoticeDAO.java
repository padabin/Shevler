package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class NoticeDAO implements INoticeDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	//게시물 번호의 최대값 얻어내기
	@Override
	public int getMaxNum() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NVL(MAX(NNO),0) AS MAX "
				+ " FROM NOTICEVIEW";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getInt("MAX");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//게시물 작성 -> 데이터 입력
	@Override
	public int insertData(NoticeDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO NOTICE(NOTICE_CODE, MEMBER_CODE, NOTICE_TYPE_CODE ,NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE,NNO ) "
				+ " VALUES('N' || NOTICE_SEQ.NEXTVAL, ?, ?, ? || NNO_SEQ.NEXTVAL, ? || NNO_SEQ.NEXTVAL, SYSDATE,NNO_SEQ.NEXTVAL )";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getMember_code());
		pstmt.setString(2, dto.getNotice_type_code());
		pstmt.setString(3, dto.getNotice_title());
		pstmt.setString(4, dto.getNotice_content());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result ;
	}

	//전체 게시물 수 를 가져오는 메소드 
	@Override
	public int getDataCount() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT" 
				+ " FROM NOTICEVIEW";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result ;
	}

	// 특정 영역의(시작번호 ~ 끝 번호) 게시물의 목록을 읽어오는 메소드
	@Override
	public ArrayList<NoticeDTO> Lists(int start, int end) throws SQLException
	{
		ArrayList<NoticeDTO> result = new ArrayList<NoticeDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NNO, NOTICE_CODE , NOTICE_TYPE_CODE,NOTICE_TYPE_DETAIL "
				+ " , MEMBER_CODE, MEMBER_ID "
				+ " , NOTICE_TITLE,NOTICE_CONTENT, NOTICE_DATE "
				+ " FROM ( "
				+ " SELECT ROWNUM RNUM,DATA.* "
				+ " FROM ( "
				+ " SELECT NNO,NOTICE_CODE "
				+ " ,NOTICE_TYPE_CODE,NOTICE_TYPE_DETAIL"
				+ " ,NOTICE_TITLE,NOTICE_CONTENT,TO_CHAR(NOTICE_DATE,'YYYY-MM-DD') AS NOTICE_DATE "
				+ " ,MEMBER_CODE,MEMBER_ID"
				+ " FROM NOTICEVIEW"
				+ " ORDER BY NNO DESC "
				+ ") DATA "
				+ " ) "
				+ " WHERE RNUM >=? AND RNUM <=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			NoticeDTO dto = new NoticeDTO();
			
			dto.setNno(rs.getInt("NNO"));
			dto.setNotice_code(rs.getString("NOTICE_CODE"));
			dto.setNotice_type_code(rs.getString("NOTICE_TYPE_CODE"));
			dto.setNotice_type_detail(rs.getString("NOTICE_TYPE_DETAIL"));
			dto.setMember_code(rs.getString("MEMBER_CODE"));
			dto.setMember_id(rs.getString("MEMBER_ID"));
			dto.setNotice_title(rs.getString("NOTICE_TITLE"));
			dto.setNotice_content(rs.getString("NOTICE_CONTENT"));
			dto.setNotice_date(rs.getString("NOTICE_DATE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 특정 게시물의 내용을 읽어오는 메소드
	@Override
	public NoticeDTO getReadData(int nno) throws SQLException
	{
		NoticeDTO result = new NoticeDTO();
		
		Connection conn = dataSource.getConnection();
		
		
		String sql = "SELECT NNO , NOTICE_CODE"
				+ " , NOTICE_TYPE_CODE, NOTICE_TYPE_DETAIL"
				+ " , NOTICE_TITLE,NOTICE_CONTENT,NOTICE_DATE"
				+ " , MEMBER_ID "
				+ " FROM NOTICEVIEW"
				+ " WHERE NNO = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setNno(rs.getInt("NNO"));
			result.setNotice_code(rs.getString("NOTICE_CODE"));
			result.setNotice_type_code(rs.getString("NOTICE_TYPE_CODE"));
			result.setNotice_type_detail(rs.getString("NOTICE_TYPE_DETAIL"));
			result.setNotice_title(rs.getString("NOTICE_TITLE"));
			result.setNotice_content(rs.getString("NOTICE_CONTENT"));
			result.setNotice_date(rs.getString("NOTICE_DATE"));
			result.setMember_id(rs.getString("MEMBER_ID"));
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//특정 게시물의 내용을 수정하는 메소드
	@Override
	public int updateData(NoticeDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE NOTICE "
				+ " SET NOTICE_TYPE_CODE = ?"
				+ " , NOTICE_TITLE = ? , NOTICE_CONTENT = ?"
				+ " WHERE NOTICE_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getNotice_type_code());
		pstmt.setString(2, dto.getNotice_title());
		pstmt.setString(3, dto.getNotice_content());
		pstmt.setString(4, dto.getNotice_code());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}

	//특정 게시물을 삭제하는 기능의 메소드
	@Override
	public int deleteData(String notice_code) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE "
				+ " FROM NOTICE "
				+ " WHERE NOTICE_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice_code);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result ;
	}

	//다음 게시물 번호를 얻어오는 메소드 정의
	@Override
	public int getNextNum(int num) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
			
		String sql = "SELECT NVL(MIN(NNO),-1) AS NEXTNUM"
				+ " FROM NOTICEVIEW"
				+ " WHERE NNO > ?";
	
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("NEXTNUM");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//이전 게시물 번호를 얻어오는 메소드
	@Override
	public int getBeforeNum(int num) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NVL(MAX(NNO),-1) AS BEFORENUM"
				+ " FROM NOTICEVIEW"
				+ " WHERE NNO < ?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getInt("BEFORENUM");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 수정할 경우 이전에 입력한 공지사항 카테고리 출력하는 메소드
	@Override
	public ArrayList<NoticeDTO> noticeTypeList() throws SQLException
	{
		ArrayList<NoticeDTO> result = new ArrayList<NoticeDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NOTICE_TYPE_CODE,NOTICE_TYPE_DETAIL"
				+ " FROM NOTICE_TYPE"
				+ " ORDER BY NOTICE_TYPE_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			NoticeDTO dto = new NoticeDTO();
			
			dto.setNotice_type_code(rs.getString("NOTICE_TYPE_CODE"));
			dto.setNotice_type_detail(rs.getString("NOTICE_TYPE_DETAIL"));
			
			result.add(dto);
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//=========================검색기능 추가 =================================
	// 검색을 통해 특정 영역의 (시작번호 ~ 끝 번호)게시물의 목록을 읽어오는 메소드
	
	@Override
	public ArrayList<NoticeDTO> searchList(int start, int end, String searchKey, String searchValue) throws SQLException
	{
		ArrayList<NoticeDTO> result = new ArrayList<NoticeDTO>();
		
		Connection conn = dataSource.getConnection();
		
		searchValue = "%" + searchValue + "%";
		
		String sql = " SELECT  NNO, NOTICE_CODE" 
				+ " , NOTICE_TYPE_CODE,NOTICE_TYPE_DETAIL" 
				+ " , MEMBER_CODE, MEMBER_ID" 
				+ " , NOTICE_TITLE,NOTICE_CONTENT, NOTICE_DATE"
				+ " FROM" 
				+ "(" 
				+ " SELECT ROWNUM RNUM,DATA.*"
				+ " FROM"
				+ " ("
				+ " SELECT NNO,NOTICE_CODE" 
				+ " , NOTICE_TYPE_CODE,NOTICE_TYPE_DETAIL" 
				+ " , NOTICE_TITLE,NOTICE_CONTENT,TO_CHAR(NOTICE_DATE,'YYYY-MM-DD') AS NOTICE_DATE"
				+ " ,MEMBER_CODE,MEMBER_ID" 
				+ " FROM NOTICEVIEW" 
				+ " WHERE " + searchKey + " LIKE ?" 
				+ " ORDER BY NNO DESC" 
				+ " ) DATA" 
				+ " )" 
				+ " WHERE RNUM >= ? AND RNUM <= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			NoticeDTO dto = new NoticeDTO();
			
			dto.setNno(rs.getInt("NNO"));
			dto.setNotice_code(rs.getString("NOTICE_CODE"));
			dto.setNotice_type_code(rs.getString("NOTICE_TYPE_CODE"));
			dto.setNotice_type_detail(rs.getString("NOTICE_TYPE_DETAIL"));
			dto.setMember_code(rs.getString("MEMBER_CODE"));
			dto.setMember_id(rs.getString("MEMBER_ID"));
			dto.setNotice_title(rs.getString("NOTICE_TITLE"));
			dto.setNotice_content(rs.getString("NOTICE_CONTENT"));
			dto.setNotice_date(rs.getString("NOTICE_DATE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	//=========================검색기능 추가 =================================
	//검색한 데이터의 갯수 구하기
	
	@Override
	public int getSearchDataCount(String searchKey, String searchValue) throws SQLException
	{
		int result = 0;
		
		searchValue = "%" + searchValue + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT" 
				+ " FROM NOTICEVIEW" 
				+ " WHERE " + searchKey + " LIKE ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result ;
	}
}
