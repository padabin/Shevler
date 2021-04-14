/*=================================================
  IMemberDAO.java
  - 인터페이스
  - 로그인 처리를 위한 회원 테이블 DAO 인터페이스 
=================================================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMemberDAO
{
	// 회원 로그인(일반회원)
	public ArrayList<String> login(String memberId, String memberPw) throws SQLException;
	
	// 회원 로그인(관리자)
	public ArrayList<String> loginAdmin(String memberId, String memberPw) throws SQLException;
	
	// 아이디 찾기
	public String idSearch(String memberId) throws SQLException;
	
	// 회원 추가
	public int memberAdd(MemberDTO dto) throws SQLException;
	
	// 회원 아이디 변경
	public int memberIdModify(MemberDTO dto) throws SQLException;
	
	// 회원 이메일 변경
	public int memberEmailModify(MemberDTO dto) throws SQLException;
	
	// 회원 전화번호 수정
	public int memberTelModify(MemberDTO dto) throws SQLException;
	
	// 회원 삭제
	public int memberRemove(String memberCode) throws SQLException;

	//----------------------재완 추가-----------------------------------------------
	// 마이페이지 뷰 조회
	public MemberDTO myPageInfo(String memberCode) throws SQLException;
	
	// 아이디로 코드 찾는 함수
	public String codeSearchById(String memberId) throws SQLException;
	
	
	
}
