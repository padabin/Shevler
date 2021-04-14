package com.test.mvc;

public class NoticeDTO
{
	/*
	- NOTICE 테이블(공지사항)
	이름               널?       유형             
	---------------- -------- -------------- 
	NOTICE_CODE      NOT NULL VARCHAR2(10)    -- PK
	MEMBER_CODE      NOT NULL VARCHAR2(10)    -- FK
	NOTICE_TYPE_CODE NOT NULL VARCHAR2(10)    -- FK
	NOTICE_TITLE     NOT NULL VARCHAR2(100)  
	NOTICE_CONTENT   NOT NULL VARCHAR2(4000) 
	NOTICE_DATE      NOT NULL DATE           
	NNO                       NUMBER          -- 게시판 번호      

	*/
	/*
	- NOTICE_TYPE 테이블(공지사항 유형)
	 
	이름                 널?       유형           
	------------------ -------- ------------ 
	NOTICE_TYPE_CODE   NOT NULL VARCHAR2(10) 
	NOTICE_TYPE_DETAIL NOT NULL VARCHAR2(20) 
	*/
	
	private int nno;												//게시판 번호
	private String notice_code;										//공지사항 코드
	private String notice_type_code,notice_type_detail;				//공지사항 카테고리 코드,공지사항 카테고리 상세설명														
	private String notice_title,notice_content,notice_date;			//공지사항 제목, 공지사항 내용, 공지사항 작성일자											
	private String member_code,member_id;							//회원코드,회원아이디
	
	//getter / setter 구성
	public String getNotice_code()
	{
		return notice_code;
	}
	public void setNotice_code(String notice_code)
	{
		this.notice_code = notice_code;
	}
	public String getNotice_type_code()
	{
		return notice_type_code;
	}
	public void setNotice_type_code(String notice_type_code)
	{
		this.notice_type_code = notice_type_code;
	}
	public String getNotice_type_detail()
	{
		return notice_type_detail;
	}
	public void setNotice_type_detail(String notice_type_detail)
	{
		this.notice_type_detail = notice_type_detail;
	}
	public String getNotice_title()
	{
		return notice_title;
	}
	public void setNotice_title(String notice_title)
	{
		this.notice_title = notice_title;
	}
	public String getNotice_content()
	{
		return notice_content;
	}
	public void setNotice_content(String notice_content)
	{
		this.notice_content = notice_content;
	}
	public String getNotice_date()
	{
		return notice_date;
	}
	public void setNotice_date(String notice_date)
	{
		this.notice_date = notice_date;
	}
	public void setNno(int nno)
	{
		this.nno = nno;
	}
	public int getNno()
	{
		return nno;
	}
	public String getMember_code()
	{
		return member_code;
	}
	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}
	public String getMember_id()
	{
		return member_id;
	}
	public void setMember_id(String member_id)
	{
		this.member_id = member_id;
	}
	
}
