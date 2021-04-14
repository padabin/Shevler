<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArticleCommentReportForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>  
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	$(document).ready(function()
	{
		$('#submit').click(function()
		{
			if($('#repnote').val() =="")
			{
				alert("신고내용을 입력해주세요");
				$('#repnote').focus();
				return false;
			}				
		});
		
		$('#button').click(function()
		{
			window.close();
		});
	});
</script>
</head>
<body>
<c:if test="${resultCount == 0}">
	<form action="articlecommentreportin.action">
	내 용 : ${dto.articleCommentContent }
	<br>
	작성자 : ${dto.memberId }
	<br>
	<hr>
	
	신고자 : ${reporter }
	<input type="hidden" name="articleCommentCode" value="${dto.articleCommentCode }">
	<input type="hidden" name="WriterCode" value="${dto.memberCode }">
	<input type="hidden" name="reporter" value="${reporter }">
	<br>
	신고 유형 : 
	<select name="reptype"> 
	<c:forEach items="${repdto }" var="type">
		<option value="${type.rep_type_code }">${type.rep_type_detail }</option>
	</c:forEach>
	</select>
	<br>
	신고 내용 : <input type="text" id="repnote" name="repnote">
	<button type="button" id="submit">신고하기</button>
	</form>
</c:if>
<c:if test="${resultCount != 0 }">
	<h4>이미 신고한 댓글입니다.</h4>
	<button type="button" id="button">확인</button>
</c:if>
</body>
</html>