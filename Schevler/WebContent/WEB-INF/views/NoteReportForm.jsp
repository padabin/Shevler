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
<title>게시물 신고</title>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->  
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!--아이콘 링크 -->
<link rel="stylesheet" href="css/report.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		/* 메인페이지 외 상단바 */
		// $('.logo a, .right-menu').css('color','black');
		/* header 변수 */
		var header = $('.head_bar').offset();

		/* header 상단바 scroll 시 고정 스크립트 */
		$(window).scroll(function()
		{
			if ($(document).scrollTop() > header.top)
			{
				$('.head_bar').addClass('headerFixed');
			} else
			{
				$('.head_bar').removeClass('headerFixed');
			}
		});
		
		// 신고내용 유효성 검사
		$("#reportBtn").click(function()
		{
			if($("#reportDetail").val() == "" )
			{
				alert("신고 내용을 입력해야 합니다.");
				$("#reportDetail").focus();
				return false;
			}
			
			if(confirm("정말로 신고하시겠습니까?"))
			{
				$.ajax({
					type: "GET",
					url: "notereportaction.action",
					dataType: "text",
					data : {note_rep_in_content : $("#reportDetail").val() , rep_type_code: $("#reportReason option:selected").val(), note_code : "${note_code }" },
					success : function(result)
					{
						alert("신고가 완료되었습니다.");
						window.close();
					}
				});
			}
			
		});
		
		$("#cancelBtn").click(function()
		{
			closeWindow();	
		});
	});
	
	function closeWindow()
	{
		self.opener = self;
		window.close();
	}
	


</script>
</head>
<body>

	
	<div class="head_bar">
		<span>신고하기</span>
	</div>
	
	<div class="report_body">
		<div>
			<!-- 제목은 신고물의 제목 ex) 게시글이면 해당 게시글 제목 댓글이면 댓글 내용을 가져다 뿌려주면됨 -->
			<span>작성자</span> :&nbsp;&nbsp; ${sender }<br>
		</div>
		<hr>
			<input type="hidden" name="note_code" value="${note_code }">
			<div>
				<span>사유 선택</span>&nbsp;&nbsp;
				<select id="reportReason" name="reportReason">
					<option value="RT1">광고/홍보 게시글</option>
					<option value="RT2">욕설이 담긴 게시글</option>
					<option value="RT3">음란성 또는 부적절한 게시글</option>
					<option value="RT4">상습 도배 게시글</option>
					<option value="RT5">기타</option>
				</select>
			</div>
			<hr>
			<div>
				<span style="vertical-align: top;">신고 내용</span>&nbsp;&nbsp;
				<textarea rows="3" cols="35" id="reportDetail" name="reportDetail" maxlength="400" placeholder="신고내용은 200자 이내로 작성해주세요."></textarea>
			</div>
			
		
			
			<div class="report_bottom">
				<button type="button" class="btn btn-default" id="reportBtn">신고하기</button>
				<button type="button" class="btn btn-default" id="cancelBtn">취소</button>
			</div>
	
	
	</div>


</body>
</html>