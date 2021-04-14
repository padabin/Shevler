/*======================================
  MemberDTO.java
  - 로그인을 위한 회원 테이블 DTO
======================================*/

/*
MEMBER_CODE  		NOT NULL VARCHAR2(10) 
MEMBER_ID    		NOT NULL VARCHAR2(20) 
MEMBER_DATE  		NOT NULL DATE         
MEMBER_GRADE 		NOT NULL VARCHAR2(1)  
MEMBER_INFO_CODE  	NOT NULL VARCHAR2(10) 
MEMBER_CODE       	NOT NULL VARCHAR2(10) 
MEMBER_INFO_NAME  	NOT NULL VARCHAR2(10) 
MEMBER_INFO_PW    	NOT NULL VARCHAR2(20) 
MEMBER_INFO_EMAIL 	NOT NULL VARCHAR2(30) 
MEMBER_INFO_TEL   	NOT NULL VARCHAR2(15) 
MEMBER_INFO_SSN  	NOT NULL VARCHAR2(14)  
*/

package com.test.mvc;

public class MemberDTO
{
	// 주요 속성 구성
	private String memberCode, memberId, memberDate, memberGrade
				 , memberInfoCode, memberName, memberPw, memberEmail, memberTel, memberSsn;

	// getter / setter 구성
	public String getMemberCode()
	{
		return memberCode;
	}

	public void setMemberCode(String memberCode)
	{
		this.memberCode = memberCode;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getMemberDate()
	{
		return memberDate;
	}

	public void setMemberDate(String memberDate)
	{
		this.memberDate = memberDate;
	}

	public String getMemberGrade()
	{
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade)
	{
		this.memberGrade = memberGrade;
	}

	public String getMemberInfoCode()
	{
		return memberInfoCode;
	}

	public void setMemberInfoCode(String memberInfoCode)
	{
		this.memberInfoCode = memberInfoCode;
	}

	public String getMemberName()
	{
		return memberName;
	}

	public void setMemberName(String memberName)
	{
		this.memberName = memberName;
	}

	public String getMemberPw()
	{
		return memberPw;
	}

	public void setMemberPw(String memberPw)
	{
		this.memberPw = memberPw;
	}

	public String getMemberEmail()
	{
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail)
	{
		this.memberEmail = memberEmail;
	}

	public String getMemberTel()
	{
		return memberTel;
	}

	public void setMemberTel(String memberTel)
	{
		this.memberTel = memberTel;
	}

	public String getMemberSsn()
	{
		return memberSsn;
	}

	public void setMemberSsn(String memberSsn)
	{
		this.memberSsn = memberSsn;
	}
	
	
	
}
