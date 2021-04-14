/*===================
  ArticleDTO.java
===================*/

/*
ARTICLE_CODE     VARCHAR2(10)   
BOARD_TYPE_CODE  VARCHAR2(10)   
MEMBER_CODE      VARCHAR2(10)   
ARTICLE_TITLE    VARCHAR2(100)  
ARTICLE_DATE     DATE           
ARTICLE_LIKE     NUMBER         
ARTICLE_CONTENT  VARCHAR2(4000) 
ARTICLE_HIT      NUMBER         
ARTICLE_NOTICE   VARCHAR2(1)    
*/

package com.test.mvc;

public class ArticleDTO
{
	// 주요 속성 구성
	private String articleCode, articleTitle, articleDate, articleContent, articleNotice;
	private int bno;
	private String boardTypeCode, boardTypeDetail, memberCode, memberId, memberName;
	private int articleLike, articleHit;
	private String articleCommentCode, commentMemberCode, articleCommentContent, articleCommentDate;
	private String article_rep_in_code, rep_type_code, article_rep_in_content, article_rep_in_date;
	private String rep_type_detail;
	
	// getter / setter 구성
	
	
	public String getArticleCode()
	{
		return articleCode;
	}
	public String getRep_type_detail()
	{
		return rep_type_detail;
	}
	public void setRep_type_detail(String rep_type_detail)
	{
		this.rep_type_detail = rep_type_detail;
	}
	public void setArticleCode(String articleCode)
	{
		this.articleCode = articleCode;
	}
	public String getArticleTitle()
	{
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle)
	{
		this.articleTitle = articleTitle;
	}
	public String getArticleDate()
	{
		return articleDate;
	}
	public void setArticleDate(String articleDate)
	{
		this.articleDate = articleDate;
	}
	public String getArticleContent()
	{
		return articleContent;
	}
	public void setArticleContent(String articleContent)
	{
		this.articleContent = articleContent;
	}
	public String getArticleNotice()
	{
		return articleNotice;
	}
	public void setArticleNotice(String articleNotice)
	{
		this.articleNotice = articleNotice;
	}
	public String getBoardTypeCode()
	{
		return boardTypeCode;
	}
	public void setBoardTypeCode(String boardTypeCode)
	{
		this.boardTypeCode = boardTypeCode;
	}
	public String getMemberCode()
	{
		return memberCode;
	}
	public void setMemberCode(String memberCode)
	{
		this.memberCode = memberCode;
	}
	public int getArticleLike()
	{
		return articleLike;
	}
	public void setArticleLike(int articleLike)
	{
		this.articleLike = articleLike;
	}
	public int getArticleHit()
	{
		return articleHit;
	}
	public void setArticleHit(int articleHit)
	{
		this.articleHit = articleHit;
	}
	public String getMemberId()
	{
		return memberId;
	}
	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}
	public String getMemberName()
	{
		return memberName;
	}
	public void setMemberName(String memberName)
	{
		this.memberName = memberName;
	}
	public int getBno()
	{
		return bno;
	}
	public void setBno(int bno)
	{
		this.bno = bno;
	}
	public String getArticleCommentCode()
	{
		return articleCommentCode;
	}
	public void setArticleCommentCode(String articleCommentCode)
	{
		this.articleCommentCode = articleCommentCode;
	}
	public String getCommentMemberCode()
	{
		return commentMemberCode;
	}
	public void setCommentMemberCode(String commentMemberCode)
	{
		this.commentMemberCode = commentMemberCode;
	}
	public String getArticleCommentContent()
	{
		return articleCommentContent;
	}
	public void setArticleCommentContent(String articleCommentContent)
	{
		this.articleCommentContent = articleCommentContent;
	}
	public String getArticleCommentDate()
	{
		return articleCommentDate;
	}
	public void setArticleCommentDate(String articleCommentDate)
	{
		this.articleCommentDate = articleCommentDate;
	}
	public String getBoardTypeDetail()
	{
		return boardTypeDetail;
	}
	public void setBoardTypeDetail(String boardTypeDetail)
	{
		this.boardTypeDetail = boardTypeDetail;
	}
	public String getArticle_rep_in_code()
	{
		return article_rep_in_code;
	}
	public void setArticle_rep_in_code(String article_rep_in_code)
	{
		this.article_rep_in_code = article_rep_in_code;
	}
	public String getRep_type_code()
	{
		return rep_type_code;
	}
	public void setRep_type_code(String rep_type_code)
	{
		this.rep_type_code = rep_type_code;
	}
	public String getArticle_rep_in_content()
	{
		return article_rep_in_content;
	}
	public void setArticle_rep_in_content(String article_rep_in_content)
	{
		this.article_rep_in_content = article_rep_in_content;
	}
	public String getArticle_rep_in_date()
	{
		return article_rep_in_date;
	}
	public void setArticle_rep_in_date(String article_rep_in_date)
	{
		this.article_rep_in_date = article_rep_in_date;
	}
	
	
	
	
}
