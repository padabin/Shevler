<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>쪽지 쓰기</title>
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/message.css">



<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{

		/* 메인페이지 외 상단바 */
		// $('.logo a, .right-menu').css('color','black');
		/* header 변수 */
		var header = $('#header').offset();

		/* header 상단바 scroll 시 고정 스크립트 */
		$(window).scroll(function()
		{
			if ($(document).scrollTop() > header.top)
			{
				$('#header').addClass('headerFixed');
			} else
			{
				$('#header').removeClass('headerFixed');
			}
		});
		
		
		// 쪽지 신고 버튼 클릭시
		$('#noteReportBtn').click(function()
		{
			$.ajax({
				type : "GET",
				url : "notereportdoublecheckajax.action",
				data : {sender: '${note.sender}', note_code : '${note.note_code }'},	
				dataType : "text",
				success : function (result)
				{
					if (result == 0)
					{
						window.open("notereportform.action?note_code=${note.note_code }&sender=${note.sender}",'', 'status=no, scrollbars=yes, height=340, width=500, left=600, top=250');
					}
					
					else
					{
						alert("이미 신고한 쪽지입니다.");
					}
				}
			});
			
		});
		

	});
</script>

</head>

<body>

	<div id="wrap">
		<div id="header">
			<nav class="sub_navbar">
				<b>쪽지 보내기</b>

				<!-- right-menu -->
				
				<!-- end right-menu -->
			</nav>
			<!-- end navbar -->
		</div>
		<!-- end header -->

		<div id="container">

			<div class="ct_left_menu">

				<a href="writenoteform.action">
					<button style="width: 50%; height: 40px;">쪽지 쓰기</button>
				</a>

				<hr>

				<ul>
					<li>
						<dl>
							<dd>
								<a href="mymessagereceive.action">- 받은 쪽지함</a>
							</dd>
							<dd>
								<a href="mymessagesend.action">- 보낸 쪽지함</a>
							</dd>
							<dd>
								<a href="mymessagebin.action">- 휴지통</a>
							</dd>
						</dl>
					</li>
				</ul>

			</div>
			<!-- ct_left_menu -->

			<!-- msgList -->
			<div id="msgList">

				<!-- list_top -->
				<div class="list_top">

					<div class="delCheck-btns">
						<br />
						<br />
						<br />
					</div>
				</div>

				<!-- end list_top -->

				<!-- realMsgList -->
				<div id="msgInsert">
					<form action="notewrite.action" name="msgInsertForm">
					
						<table class='table'>
							<tr>
								<th style="width: 100px;">보낸 사람  : </th>
								<td style="text-align: left;">
									${note.sender }
								</td>
								<td colspan="2" style="text-align: right;"><button id="noteReportBtn" type="button" style= "width:49%; height:24px; line-height: 24px; ">신고하기</button></td>

							</tr>
							
							<tr>
								<th style="width: 100px;">받는 사람  : </th>
								<td colspan="3" style="text-align: left;">
									${note.receiver }
								</td>

							</tr>
							<tr>
								<th style="width: 100px;">보낸 시간  : </th>
								<td colspan="3" style="text-align: left;">
									${note.note_sentdate }
								</td>

							</tr>
							
							<tr>
								<td colspan="4">
									<textarea name="content" cols="10" rows="17" style="resize: none; width:98%;" readonly="readonly" >${note.note_content }</textarea>
								</td>
							</tr>
							
							
						</table>
					</form>
		
				</div>
				<!-- end realMsgList -->


			</div>
			<!-- end msgList -->


		</div>
		<!-- end container-->



	</div>
	<!-- end wrap -->

</body>
</html>
