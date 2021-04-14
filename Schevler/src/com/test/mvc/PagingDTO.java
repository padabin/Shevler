/*====================
   PagingDTO.java
====================*/

package com.test.mvc;

public class PagingDTO
{
	// 현재페이지, 시작페이지, 게시글총갯수, 페이지당 글 게수, 마지막페이지, DB에 쓸 start, end
	private int nowPage, startPage, endPage, totalCount, cntPerPage, lastPage, start, end; 
	
	private int cntPage = 10;

	public PagingDTO()
	{
	}
	
	
	public PagingDTO(int totalCount, int nowPage, int cntPerPage)
	{
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotalCount(totalCount);
		calcLastPage(getTotalCount(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int totalCount, int cntPerPage)
	{
		setLastPage( (int)Math.ceil((double)totalCount / (double)cntPerPage) );
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage)
	{
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage )) * cntPage);
		if(getLastPage() < getEndPage())
			setEndPage(getLastPage());
		
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1)
			setStartPage(1);
	}
	
	// DB 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage, int cntPerPage)
	{
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	// getter / setter 구성
	public int getNowPage()
	{
		return nowPage;
	}

	public void setNowPage(int nowPage)
	{
		this.nowPage = nowPage;
	}

	public int getStartPage()
	{
		return startPage;
	}

	public void setStartPage(int startPage)
	{
		this.startPage = startPage;
	}

	public int getEndPage()
	{
		return endPage;
	}

	public void setEndPage(int endPage)
	{
		this.endPage = endPage;
	}

	public int getTotalCount()
	{
		return totalCount;
	}

	public void setTotalCount(int totalCount)
	{
		this.totalCount = totalCount;
	}

	public int getCntPerPage()
	{
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage)
	{
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage()
	{
		return lastPage;
	}

	public void setLastPage(int lastPage)
	{
		this.lastPage = lastPage;
	}

	public int getStart()
	{
		return start;
	}

	public void setStart(int start)
	{
		this.start = start;
	}

	public int getEnd()
	{
		return end;
	}

	public void setEnd(int end)
	{
		this.end = end;
	}

	public int getCntPage()
	{
		return cntPage;
	}

	public void setCntPage(int cntPage)
	{
		this.cntPage = cntPage;
	}
	
	
	
	
	
	
	
}
