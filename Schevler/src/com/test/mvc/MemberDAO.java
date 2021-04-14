/*=====================
  LoginDAO.java
=====================*/

package com.test.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO implements IMemberDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 재완 추가 ----------------------------------------------------------------------------------
	// 마이페이지 출력용 함수
	public MemberDTO myPageInfo(String memberCode) throws SQLException
	{
		MemberDTO result = new MemberDTO();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT MEMBERNAME, MEMBERID, MEMBEREMAIL, MEMBERTEL, SUBSTR(SSN, 0, 8) || '******' AS SSN"
				+ " FROM MEMBERVIEW"
				+ " WHERE MEMBERCODE = ?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberCode);
		
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setMemberName(rs.getString("MEMBERNAME"));
			result.setMemberId(rs.getString("MEMBERID"));
			result.setMemberEmail(rs.getString("MEMBEREMAIL"));
			result.setMemberTel(rs.getString("MEMBERTEL"));
			result.setMemberSsn(rs.getString("SSN"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 아이디로 코드 얻는 메소드
	@Override
	public String codeSearchById(String memberId) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT MEMBERCODE"
				+ " FROM MEMBERVIEW"
				+ " WHERE MEMBERID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getString("MEMBERCODE");
		}
		pstmt.close();
		conn.close();
		
		return result;
	}


	// ---------------------------------------------------------------------------------- 재완 추가
	
	@Override
	public ArrayList<String> login(String memberId, String memberPw) throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT MEMBERNAME, MEMBERCODE, MEMBERID"
				+ " FROM MEMBERVIEW"
				+ " WHERE MEMBERID = ?"
				+ " AND MEMBERPW = CRYPTPACK.ENCRYPT(?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setString(2, memberPw);
		pstmt.setString(3, memberPw);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.add(rs.getString("MEMBERNAME"));
			result.add(rs.getString("MEMBERCODE"));
			result.add(rs.getString("MEMBERID"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<String> loginAdmin(String memberId, String memberPw) throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT MEMBERNAME, MEMBERCODE, MEMBERID"
				+ " FROM MEMBERVIEW"
				+ " WHERE MEMBERID = ?"
				+ " AND MEMBERPW = CRYPTPACK.ENCRYPT(?, ?)"
				+ " AND MEMBERGRADE = 0";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setString(2, memberPw);
		pstmt.setString(3, memberPw);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.add(rs.getString("MEMBERNAME"));
			result.add(rs.getString("MEMBERCODE"));
			result.add(rs.getString("MEMBERID"));
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	@Override
	public String idSearch(String memberId) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT MEMBERNAME"
				+ " FROM MEMBERVIEW"
				+ " WHERE MEMBERID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getString("MEMBERNAME");
		}
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int memberAdd(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "call PRC_MEMBER_INSERT(?, ?, ?, ?, ?, ?)";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, dto.getMemberId());
		cstmt.setString(2, dto.getMemberName());
		cstmt.setString(3, dto.getMemberPw());
		cstmt.setString(4, dto.getMemberSsn());
		cstmt.setString(5, dto.getMemberEmail());
		cstmt.setString(6, dto.getMemberTel());
		
		result = cstmt.executeUpdate();
		cstmt.close();
		conn.close();
		
		return result;
	}
	
	

	@Override
	public int memberIdModify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE MEMBER "
				+ "SET MEMBER_ID = ?"
				+ " WHERE MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getMemberId());
		pstmt.setString(2, dto.getMemberCode());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int memberEmailModify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE MEMBER_INFO"
				+ " SET MEMBER_INFO_EMAIL = ?"
				+ " WHERE MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getMemberEmail());
		pstmt.setString(2, dto.getMemberCode());
		
		result = pstmt.executeUpdate();
		
		return result;
	}

	@Override
	public int memberTelModify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE MEMBER_INFO"
				+ " SET MEMBER_INFO_TEL = ?"
				+ " WHERE MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getMemberTel());
		pstmt.setString(2, dto.getMemberCode());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 회원 탈퇴
	@Override
	public int memberRemove(String memberCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "DELETE FROM MEMBER_INFO WHERE MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberCode);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
}
