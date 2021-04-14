/*=============================
  ICommunityDAO.java
=============================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;


public interface IArticleDAO 
{
	// 게시글 번호 최대값 얻어내기
	public int getArticleMaxNum() throws SQLException;
	
	// 게시글 작성 → 게시글 입력
	public int articleAdd(ArticleDTO dto) throws SQLException;
	
	// DB 레코드의 갯수(총 게시물 수)를 가져오는 메소드 정의
	public int getDataCount() throws SQLException;
	
	// 특정 영역의(시작번호 ~ 끝 번호) 게시물의 목록을 읽어오는 메소드 정의
	public ArrayList<ArticleDTO> Lists(int start, int end) throws SQLException;
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(String articleCode) throws SQLException;
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public ArticleDTO getReadDate(int bno) throws SQLException;
	
	// 특정 게시물을 삭제하는 기능의 메소드 정의
	public int deleteData(String articleCode) throws SQLException;
	
	// 특정 게시물의 내용을 수정하는 메소드 정의
	public int updateData(ArticleDTO dto) throws SQLException;
	
	// 다음 게시물 번호를 얻어오는 메소드 정의
	public int getNextNum(int num) throws SQLException;
	
	// 이전 게시물 번호를 얻어오는 메소드 정의
	public int getBeforeNum(int num) throws SQLException;
	
	// 다음 게시물 코드를 얻어오는 메소드 정의
	public String getNextArticleCode(String articleCode) throws SQLException;
	
	// 이전 게시물 코드를 얻어오는 메소드 정의
	public String getBeforeArticleCode(String articleCode) throws SQLException;
	
	// **********검색 기능 추가
	// 검색을 통해 특정 영역의(시작번호 ~ 끝 번호) 게시물의 목록을 읽어오는 메소드 정의
	public ArrayList<ArticleDTO> searchList(int start, int end, String searchKey, String searchValue) throws SQLException;
	
	// 검색한 DB 레코드의 갯수(총 게시물 수)를 가져오는 메소드 정의
	public int getSearchDataCount(String searchKey, String searchValue) throws SQLException; 
	
	// **********추천수 증가 기능 추가
	// 추천수 증가 + 추천한 테이블에 데이터 입력
	public int updateAddLikeCount(String articleCode, String memberCode) throws SQLException;
	
	// 추천수 조회
	public int getLikeCount(String articleCode) throws SQLException;
	
	// 해당 게시글을 추천한 적이 있는지 CHECK하는 메소드
	public int getLikedBeforeCount(String articleCode, String memberCode) throws SQLException;
	
	// ***********게시글 댓글 조회
	public ArrayList<ArticleDTO> commentLists(String articleCode) throws SQLException;
	
	// 특정 게시글의 댓글 수 조회
	public int getCommentCount(String articleCode) throws SQLException;
	
	// 특정 게시글의 댓글 달기
	public int writeComment(ArticleDTO dto) throws SQLException;
	
	// 특정 게시글의 댓글 수정
	public int updateComment(ArticleDTO dto) throws SQLException;
	
	// 특정 게시글의 댓글 삭제
	public int deleteComment(String articleCommentCode) throws SQLException;
	
	// ************특정 멤버의 게시글 조회시
	
	// 특정 멤버의 게시글 조회
	public ArrayList<ArticleDTO> memberArticleLists(int start, int end, String memberId) throws SQLException;
	
	// 특정 멤버의 게시글 수 조회
	public int getMemberDataCount(String memberId) throws SQLException;
	
	// 특정 멤버의 특정 게시물의 내용을 읽어오는 메소드 정의
	public ArticleDTO getMemberReadDate(String articleCode) throws SQLException;
	
	// ********************** 추천 여부 확인 쿼리문
	public int getMemberLikeCount(String articleCode, String memberCode) throws SQLException;
	
	// ********************** 신고 접수
	public int reportArticle(ArticleDTO dto) throws SQLException;
	
	// 특정 회원이 특정 게시글에 신고했는지 여부 확인
	public int getMemberReportCount(String articleCode, String memberCode) throws SQLException;
	
	
	
	// 신고 버튼 클릭 시 해당하는 댓글 내용과 작성자 조회
	public ArticleDTO getCommentData(String articleCommentCode) throws SQLException;
	
	// 신고 유형 목록 조회
	public ArrayList<ArticleDTO> repTypeList() throws SQLException;
	
	// 해당 댓글 신고 작성자, 내용 조회
	public int inArticleCommentReport(ArticleDTO dto) throws SQLException; 
	

	// memberId가 작성한 댓글 리스트
	public ArrayList<ArticleDTO> memberCommentLists(int start, int end, String memberId) throws SQLException;
	
	// memberId가 작성한 댓글 갯수
	public int getMemberCommentDataCount(String memberId) throws SQLException;
	
	// memberId가 추천한 글 리스트
	public ArrayList<ArticleDTO> memberLikeLists(int start, int end, String memberId) throws SQLException;

	// memberId가 추천한 글 갯수
	public int getMemberLikeDataCount(String memberId) throws SQLException;	
	
	
	//*****************************추가*********************************************************
	
	// 특정 회원이 특정 댓글에 신고했는지 여부 확인
	public int getMemberCommentCount(String articleCommentCode, String memberCode) throws SQLException;
	
	
}
