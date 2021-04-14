/*===========================
   BoardDAO.java
===========================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BoardDAO implements IBoardDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<BoardDTO> list() throws SQLException
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT BOARD_TYPE_CODE AS BOARDTYPECODE"
				+ ", BOARD_TYPE_DETAIL AS BOARDTYPEDETAIL"
				+ " FROM BOARD_TYPE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			BoardDTO dto = new BoardDTO();
			
			dto.setBoardTypeCode(rs.getString("BOARDTYPECODE"));
			dto.setBoardTypeDetail(rs.getString("BOARDTYPEDETAIL"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int boardAdd(BoardDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO BOARD_TYPE(BOARD_TYPE_CODE, BOARD_TYPE_DETAIL)"
				+ " VALUES( 'BT' || BOARD_TYPE_SEQ.NEXTVAL, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getBoardTypeDetail());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int boardModify(BoardDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE BOARD_TYPE"
				+ " SET BOARD_TYPE_DETAIL = ?"
				+ " WHERE BOARD_TYPE_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getBoardTypeDetail());
		pstmt.setString(2, dto.getBoardTypeCode());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int boardDelete(String boardCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "DELETE"
				+ " FROM BOARD_TYPE"
				+ " WHERE BOARD_TYPE_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boardCode);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}
	

}
