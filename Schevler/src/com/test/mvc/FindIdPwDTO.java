package com.test.mvc;

public class FindIdPwDTO
{
	/*
	   -- MEMBER_FINDID_VIEW 뷰
	   
		이름                널?       유형           
		----------------- -------- ------------ 
		MEMBER_INFO_CODE  NOT NULL VARCHAR2(10) 
		MEMBER_CODE       NOT NULL VARCHAR2(10) 
		MEMBER_ID         NOT NULL VARCHAR2(20) 
		MEMBER_PW         NOT NULL VARCHAR2(20) 
		MEMBER_INFO_NAME  NOT NULL VARCHAR2(10) 
		MEMBER_INFO_EMAIL NOT NULL VARCHAR2(30) 
	 */


	private String member_id,member_pw;
	private String member_info_name,member_info_email;	// 조회할 회원 정보 조건(이름,이메일,id,pw)
	//private String user_pw;
	
	// setter / getter 구성
	public String getMember_id()
	{
		return member_id;
	}
	
	public void setMember_id(String member_id)
	{
		this.member_id = member_id;
	}
	public String getMember_info_name()
	{
		return member_info_name;
	}
	public void setMember_info_name(String member_info_name)
	{
		this.member_info_name = member_info_name;
	}
	public String getMember_info_email()
	{
		return member_info_email;
	}
	public void setMember_info_email(String member_info_email)
	{
		this.member_info_email = member_info_email;
	}

	public String getMember_pw()
	{
		return member_pw;
	}

	public void setMember_pw(String member_pw)
	{
		this.member_pw = member_pw;
	}

	/*
	public String getUser_pw()
	{
		return user_pw;
	}

	public void setUser_pw(String user_pw)
	{
		this.user_pw = user_pw;
	}
	*/

}
