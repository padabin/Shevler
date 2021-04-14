package com.test.mvc;

public class Notice_paging implements INotice_paging
{
	//■ 전체 페이지 수를 구하는 메소드
	// 한 페이지에 몇 개를 뿌리는지와 전체 게시물의 수가 필요함.
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물) 수 (한 페이지당 나오는 게시물 수)
	@Override
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}

	// 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크를 설정할 URL
	@Override
	public String getIndexList(int currentPage, int totalPage, String listUrl)
	{
		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		// 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여준다.
		int numPerBlock = 10;
		
		// 현재 페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문에...)
		int currentPageSetup;
		
		// 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		int page;
		
		// 얼마만큼 이동해야 하는지...
		int n;
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		if(currentPage == 0)
			return "";
		
		// 페이지 요청을 처리하는 과정에서 URL 경로의 패턴에 대한 처리
		if(listUrl.indexOf("?") != -1) // 링크를 설정할 URL 에 『?』가 들어있으면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		// currentPageSetup = 표시할 첫 페이지 - 1
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		// 1페이지
		if( (totalPage > numPerBlock) && (currentPageSetup > 0) )
			strList.append(" <a style='color:red; margin:0 5px;' href='" +  listUrl + "pageNum=1'>1</a>");
		
		
		// Prev 
		n = currentPage - numPerBlock;
		if ( (totalPage > numPerBlock) && (currentPageSetup > 0) )
			strList.append(" <a style='color:black; margin:0 5px;' href='" + listUrl + "pageNum=" + n +"'>Prev</a>");
		
		// 바로가기
		page = currentPageSetup + 1;
		
		while ( (page <= totalPage) && (page <= currentPageSetup + numPerBlock) )
		{
			if(page == currentPage) // 현재 페이지라면...
				strList.append("<span class='currentPage' style='color:blue; font-weight:bold; font-size:20pt; margin:0 5px;' >" + page + "</span>");
			else
				strList.append("<a style='color:black; margin:0 5px;' href='" + listUrl + "pageNum=" + page +"'>" + page + "</a>");
			
			page++;
		}
		
		// Next
		n = currentPage + numPerBlock;
		if( (totalPage - currentPageSetup) > numPerBlock )
			strList.append(" <a style='color:black; margin:0 5px;' href='" + listUrl + "pageNum=" + n + "'>Next</a>");
		
		// 마지막 페이지
		if( (totalPage > numPerBlock) && (currentPageSetup + numPerBlock) < totalPage )
			strList.append(" <a style='color:red; margin:0 5px;' href='" + listUrl + "pageNum=" + totalPage + "'>" + totalPage + "</a>");
		
		
		return strList.toString();
	}

}
