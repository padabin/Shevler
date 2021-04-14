/*========================
  IBoardDAO.java
========================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IBoardDAO
{
	// 게시판 유형 조회
	public ArrayList<BoardDTO> list() throws SQLException;
	
	// 게시판 유형 추가
	public int boardAdd(BoardDTO dto) throws SQLException;
	
	// 게시판 유형 수정
	public int boardModify(BoardDTO dto) throws SQLException;
	
	// 게시판 유형 삭제
	public int boardDelete(String boardCode) throws SQLException;
}
