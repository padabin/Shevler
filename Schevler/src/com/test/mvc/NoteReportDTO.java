/*
 * NoteReportDTO.java
 */

package com.test.mvc;

public class NoteReportDTO
{
	// 신고 들어올 때
	private String note_rep_in_code, rep_type_code, rep_type_detail, note_code, note_rep_in_content;
	private String note_content, reporter_code, reporter_id, note_rep_in_date, sender_id; //신고자 코드, 신고자 아이디

	// 신고 나갈 때
	private String note_rep_out_code, note_rep_out_detail, note_rep_out_date, note_rep_out_process;

	
	
	public String getNote_rep_in_content()
	{
		return note_rep_in_content;
	}

	public void setNote_rep_in_content(String note_rep_in_content)
	{
		this.note_rep_in_content = note_rep_in_content;
	}

	public String getSender_id()
	{
		return sender_id;
	}

	public void setSender_id(String sender_id)
	{
		this.sender_id = sender_id;
	}

	public String getNote_rep_out_process()
	{
		return note_rep_out_process;
	}

	public void setNote_rep_out_process(String note_rep_out_process)
	{
		this.note_rep_out_process = note_rep_out_process;
	}

	public String getNote_rep_in_code()
	{
		return note_rep_in_code;
	}

	public void setNote_rep_in_code(String note_rep_in_code)
	{
		this.note_rep_in_code = note_rep_in_code;
	}

	public String getRep_type_code()
	{
		return rep_type_code;
	}

	public void setRep_type_code(String rep_type_code)
	{
		this.rep_type_code = rep_type_code;
	}

	public String getRep_type_detail()
	{
		return rep_type_detail;
	}

	public void setRep_type_detail(String rep_type_detail)
	{
		this.rep_type_detail = rep_type_detail;
	}

	public String getNote_code()
	{
		return note_code;
	}

	public void setNote_code(String note_code)
	{
		this.note_code = note_code;
	}

	public String getNote_content()
	{
		return note_content;
	}

	public void setNote_content(String note_content)
	{
		this.note_content = note_content;
	}

	
	public String getReporter_code()
	{
		return reporter_code;
	}

	public void setReporter_code(String reporter_code)
	{
		this.reporter_code = reporter_code;
	}

	public String getReporter_id()
	{
		return reporter_id;
	}

	public void setReporter_id(String reporter_id)
	{
		this.reporter_id = reporter_id;
	}

	public String getNote_rep_in_date()
	{
		return note_rep_in_date;
	}

	public void setNote_rep_in_date(String note_rep_in_date)
	{
		this.note_rep_in_date = note_rep_in_date;
	}

	public String getNote_rep_out_code()
	{
		return note_rep_out_code;
	}

	public void setNote_rep_out_code(String note_rep_out_code)
	{
		this.note_rep_out_code = note_rep_out_code;
	}

	public String getNote_rep_out_detail()
	{
		return note_rep_out_detail;
	}

	public void setNote_rep_out_detail(String note_rep_out_detail)
	{
		this.note_rep_out_detail = note_rep_out_detail;
	}

	public String getNote_rep_out_date()
	{
		return note_rep_out_date;
	}

	public void setNote_rep_out_date(String note_rep_out_date)
	{
		this.note_rep_out_date = note_rep_out_date;
	}
	
	
	

}
