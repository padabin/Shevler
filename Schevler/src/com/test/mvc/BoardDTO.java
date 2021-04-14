/*=====================
  BoardDTO.java
  - 게시판 유형
=====================*/

package com.test.mvc;

public class BoardDTO
{
	// 주요 속성 구성
	private String boardTypeCode, boardTypeDetail;
	
	// getter / setter 구성
	public String getBoardTypeCode()
	{
		return boardTypeCode;
	}

	public void setBoardTypeCode(String boardTypeCode)
	{
		this.boardTypeCode = boardTypeCode;
	}

	public String getBoardTypeDetail()
	{
		return boardTypeDetail;
	}

	public void setBoardTypeDetail(String boardTypeDetail)
	{
		this.boardTypeDetail = boardTypeDetail;
	}
	
	
}
