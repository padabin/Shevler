package com.test.mvc;

import java.sql.SQLException;

public interface IFindIdPwDAO
{
	public FindIdPwDTO getId(String member_info_name, String member_info_email) throws SQLException;
	public FindIdPwDTO getPw(String member_id, String member_info_name, String member_info_email) throws SQLException;
	
	//비밀번호 변경 메소드
	public int modifyPw (FindIdPwDTO dto);
	
}
