<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<items>
	<c:forEach var="answer" items="${answer }">
		<memid>${answer.memberId }</memid>
		<content>${answer.qnaanswerContent }</content>
		<date>${answer.qnaanswerDate }</date>
	</c:forEach>
</item>