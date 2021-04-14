/*==========================
  IPaging.java
  - 게시판 페이징 처리
==========================*/

package com.test.mvc;

public interface IPaging
{
	// 전체 페이지 수를 구하는 메소드
	// 한페이지에 몇개를 뿌리는지와 전체 게시물의 수가 필요
	// numPerPage : 한 페이지에 표시할 게시물의 수
	// dataCount : 전체 게시물 수
	public int getPageCount(int numPerPage, int dataCount);
	
	// 페이징 처리 기능의 메소드
	public String getIndexList(int currentPage, int totalPage, String listUrl);
	
	

}
