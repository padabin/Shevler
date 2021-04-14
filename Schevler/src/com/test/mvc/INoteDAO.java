/*=============================
  INoteDAO.java
=============================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface INoteDAO 
{
	// 받은 쪽지함 리스트 출력 
	public ArrayList<NoteDTO> receiveMsgList(@Param("memberCode")String memberCode, @Param("start")int start, @Param("end")int end) throws SQLException;
	
	// 보낸 쪽지함 리스트 출력 
	public ArrayList<NoteDTO> sendMsgList(@Param("memberCode")String memberCode, @Param("start")int start, @Param("end")int end) throws SQLException;
	
	// 휴지통 쪽지함 리스트 출력 
	public ArrayList<NoteDTO> binMsgList(@Param("memberCode")String memberCode, @Param("start")int start, @Param("end")int end) throws SQLException;
	
	// 메시지 보내기
	public int add(NoteDTO note) throws SQLException;
	
	// 받은 메세지 휴지통에 보내기					 note_receiever_delete 를 sysdate로 업데이트 메소드
	public int putIntoBin(String noteCode) throws SQLException;
	
	// 보낸 메세지 이력 삭제하기					 note_sender_delete 를 sysdate로 업데이트 메소드
	public int sentNotedelete(String noteCode) throws SQLException;
	
	// 휴지통 메세지 다시 받은 메세지함에 보내기	 note_receiever_delete 를 sysdate로 업데이트 메소드
	public int putBackIntoReceive(String noteCode) throws SQLException;
	
	// 휴지통 메세지 진짜로 지우기	 note_real_receiever_delete 를 sysdate로 업데이트 메소드
	public int realDeleteFromBin(String noteCode) throws SQLException;
	
	// 받은 전체 메세지 갯수 구하기
	public int getDataCountReceive(String memberCode) throws SQLException;
	// 보낸 전체 메세지 갯수 구하기
	public int getDataCountSend(String memberCode) throws SQLException;
	// 휴지통 전체 메세지 갯수 구하기
	public int getDataCountBin(String memberCode) throws SQLException;
	
	
	
	// 쪽지 상세보기
	public NoteDTO getDetailContent(@Param("noteCode")String noteCode) throws SQLException;
	
	
	
	
	// 받은 쪽지함 검색 
	public ArrayList<NoteDTO> noteSearchReceive(@Param("searchType")String searchType, @Param("searchValue")String searchValue,  @Param("memberCode")String memberCode, @Param("start")int start, @Param("end")int end) throws SQLException;
	// 받은 검색 메세지 갯수 구하기
	public int getDataCountReceiveSearch(@Param("searchType")String searchType, @Param("searchValue")String searchValue, @Param("memberCode")String memberCode) throws SQLException;
	
	
		
		
	// 보낸 쪽지함 검색 
	public ArrayList<NoteDTO> noteSearchSend(@Param("searchType")String searchType, @Param("searchValue")String searchValue, @Param("memberCode")String memberCode, @Param("start")int start, @Param("end")int end) throws SQLException;
	// 보낸 검색 메세지 갯수 구하기
	public int getDataCountSendSearch(@Param("searchType")String searchType, @Param("searchValue")String searchValue, @Param("memberCode")String memberCode) throws SQLException;
	
	
	
	
	
	// 휴지통 쪽지함 검색
	public ArrayList<NoteDTO> noteSearchBin(@Param("searchType")String searchType, @Param("searchValue")String searchValue, @Param("memberCode")String memberCode, @Param("start")int start, @Param("end")int end) throws SQLException;

	// 휴지통 검색 메세지 갯수 구하기
	public int getDataCountBinSearch(@Param("searchType")String searchType, @Param("searchValue")String searchValue, @Param("memberCode")String memberCode) throws SQLException;
}
