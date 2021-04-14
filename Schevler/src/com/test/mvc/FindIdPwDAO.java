package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class FindIdPwDAO implements IFindIdPwDAO
{
	//인터페이스 자료형 기반 속성 구성
	private DataSource dataSource;
	
	//setter 메소드 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 아이디 찾는 메소드
	@Override
	public FindIdPwDTO getId(String member_info_name, String member_info_email)
	{
		FindIdPwDTO result = new FindIdPwDTO();
		
		try
		{
			Connection conn = dataSource.getConnection();
			
			String sql = "SELECT MEMBER_ID" 
				+ " FROM  MEMBER_FINDID_VIEW" 
				+ "	WHERE MEMBER_INFO_NAME = ?" 
				+ "	AND MEMBER_INFO_EMAIL = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_info_name);
			pstmt.setString(2, member_info_email);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{						
				result.setMember_id(rs.getString("MEMBER_ID"));
			}

			rs.close();
			pstmt.close();
			conn.close();
	
		} catch (SQLException e)
		{
			System.out.println(e.toString());
			return null;
		}	
		
		return result;
	}

	// 비밀번호 찾을 때 입력 정보 있는지 메소드
	@Override
	public FindIdPwDTO getPw(String member_id, String member_info_name, String member_info_email)
	{
		
		FindIdPwDTO result = new FindIdPwDTO();
		
		try
		{
			Connection conn = dataSource.getConnection();
			
			String sql = "SELECT MEMBER_ID, MEMBER_INFO_NAME, MEMBER_INFO_EMAIL" 
						+ " FROM  MEMBER_FINDID_VIEW" 
						+ " WHERE MEMBER_ID = ?" 
						+ " AND MEMBER_INFO_NAME = ?" 
						+ " AND MEMBER_INFO_EMAIL = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_info_name);
			pstmt.setString(3, member_info_email);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				result.setMember_id(rs.getString("MEMBER_ID"));
				result.setMember_info_name(rs.getString("MEMBER_INFO_NAME"));
				result.setMember_info_email(rs.getString("MEMBER_INFO_EMAIL"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
	
		} catch (SQLException e)
		{
			System.out.println(e.toString());
			return null;
			
		}	
		return result;	
	}
	
	//해당 ID 비밀번호 변경 메소드
	@Override
	public int modifyPw(FindIdPwDTO dto)
	{
		int result = 0;
		
		try
		{
			Connection conn = dataSource.getConnection();

			String sql ="UPDATE MEMBER_INFO" 
					+ " SET MEMBER_INFO_PW = CRYPTPACK.ENCRYPT(?, ?)" 
					+ " WHERE MEMBER_INFO_CODE =" 
					+ "("
					+ " SELECT MEMBER_INFO_CODE"
					+ " FROM  MEMBER_FINDID_VIEW" 
					+ " WHERE MEMBER_ID = ?" 
					+ "  AND MEMBER_INFO_NAME = ?" 
					+ "  AND MEMBER_INFO_EMAIL = ?" 
					+ ")";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_pw());
			pstmt.setString(2, dto.getMember_pw());
			pstmt.setString(3, dto.getMember_id());
			pstmt.setString(4, dto.getMember_info_name());
			pstmt.setString(5, dto.getMember_info_email());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		
		} catch (SQLException e)
		{
			System.out.println(e.toString());
			
		}
		
		return result;
	}
}
