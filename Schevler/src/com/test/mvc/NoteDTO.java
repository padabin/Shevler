/*
 * NoteDTO.java
 * - 쪽찌 DTO
 */
package com.test.mvc;

public class NoteDTO
{
	private String note_code, rnum, note_sender_code, sender, receiver, note_receiver_code, note_content;
	
	private String note_sentdate, note_real_receiver_delete, note_sender_delete, note_receiver_delete;
	
	
	public String getNote_real_receiver_delete()
	{
		return note_real_receiver_delete;
	}
	public void setNote_real_receiver_delete(String note_real_receiver_delete)
	{
		this.note_real_receiver_delete = note_real_receiver_delete;
	}
	public String getRnum()
	{
		return rnum;
	}
	public void setRnum(String rnum)
	{
		this.rnum = rnum;
	}
	public String getNote_code()
	{
		return note_code;
	}
	public void setNote_code(String note_code)
	{
		this.note_code = note_code;
	}
	public String getNote_sender_code()
	{
		return note_sender_code;
	}
	public void setNote_sender_code(String note_sender_code)
	{
		this.note_sender_code = note_sender_code;
	}
	public String getSender()
	{
		return sender;
	}
	public void setSender(String sender)
	{
		this.sender = sender;
	}
	public String getReceiver()
	{
		return receiver;
	}
	public void setReceiver(String receiver)
	{
		this.receiver = receiver;
	}
	public String getNote_receiver_code()
	{
		return note_receiver_code;
	}
	public void setNote_receiver_code(String note_receiver_code)
	{
		this.note_receiver_code = note_receiver_code;
	}
	public String getNote_content()
	{
		return note_content;
	}
	public void setNote_content(String note_content)
	{
		this.note_content = note_content;
	}
	public String getNote_sentdate()
	{
		return note_sentdate;
	}
	public void setNote_sentdate(String note_sentdate)
	{
		this.note_sentdate = note_sentdate;
	}
	
	public String getNote_sender_delete()
	{
		return note_sender_delete;
	}
	public void setNote_sender_delete(String note_sender_delete)
	{
		this.note_sender_delete = note_sender_delete;
	}
	public String getNote_receiver_delete()
	{
		return note_receiver_delete;
	}
	public void setNote_receiver_delete(String note_receiver_delete)
	{
		this.note_receiver_delete = note_receiver_delete;
	}

	
	
}