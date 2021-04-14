package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IQnaDAO
{
	// 1:1 문의 작성
	public int qnaAdd(QnaDTO dto) throws SQLException;
	
	// 1:1 문의 내역(회원)
	public ArrayList<QnaDTO> list(String membercode) throws SQLException;
	
	// 1:1 문의 답글(회원)
	public ArrayList<QnaDTO> commentList(String qnaquestionCode) throws SQLException;
}
