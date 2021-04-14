package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface INoticeDAO
{
	//게시물 번호의 최대값 얻어내기
	public int getMaxNum() throws SQLException;
	
	//게시물 작성 -> 데이터 입력
	public int insertData(NoticeDTO dto) throws SQLException;
	
	//게시물 수 를 가져오는 메소드 
	//-> 검색기능 추가할 경우 수정해야 함.
	// DB 레코드의 갯수(총 게시물 수)를 가져오는 메소드
	public int getDataCount() throws SQLException;
	
	// 특정 영역의(시작번호 ~ 끝 번호) 게시물의 목록을 읽어오는 메소드
	public ArrayList<NoticeDTO> Lists(int start, int end) throws SQLException;
	
	// 특정 게시물의 내용을 읽어오는 메소드
	public NoticeDTO getReadData(int nno) throws SQLException;
	
	//특정 게시물의 내용을 수정하는 메소드
	public int updateData(NoticeDTO dto) throws SQLException;
	
	//특정 게시물을 삭제하는 기능의 메소드
	public int deleteData(String notice_code) throws SQLException;
	
	//다음 게시물 번호를 얻어오는 메소드 정의
	public int getNextNum(int num) throws SQLException;
	
	//이전 게시물 번호를 얻어오는 메소드
	public int getBeforeNum(int num) throws SQLException;
	
	//공지사항 카테고리 출력하는 메소드
	public ArrayList<NoticeDTO> noticeTypeList() throws SQLException;
	
	
	//============검색 기능 추가===================================
	
	// 검색을 통해 특정 영역의 (시작번호 ~ 끝 번호)게시물의 목록을 읽어오는 메소드
	public ArrayList<NoticeDTO> searchList(int start, int end, String searchKey, String searchValue) throws SQLException;
	
	// 검색한 DB 레코드의 갯수(총 게시물 수)를 가져오는 메소드
	public int getSearchDataCount(String searchKey, String searchValue) throws SQLException;
}















