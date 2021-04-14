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

	});
</script>

</head>

<body>

	<div id="wrap">
		<div id="header">
			<nav class="sub_navbar">
				<b>쪽지 보내기</b>

				<!-- right-menu -->
				<div class="right-menu">
					<!-- <form action="">
						<select name="searchType" style="height: 28px;">
							<option value="writer">작성자</option>
							<option value="content">내용</option>
						</select> <input type="text" name="searchValue" />
						<button id="submitBtn">검색</button>
					</form> -->
				</div>
				<!-- end right-menu -->
			</nav>
			<!-- end navbar -->
		</div>
		<!-- end header -->

		<div id="container">

			<div class="ct_left_menu">

				<button style="width: 50%; height: 40px;">쪽지 쓰기</button>

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
				<div id="msgInsert" >
				<table class='table' style="border:1px solid white;">
					<tr style="border: 0px;">
						<th style="border: 0px;">
							메세지 보내기 실패
						</th>
					</tr>
					<tr style="border: 0px;">
						<th style="border: 0px;">
							${failId }는 존재하지 않는 유저 입니다<br />
						</th>
					</tr>
					<tr style="border: 0px;">
						<td style="border: 0px;">
							<a href="writenoteform.action">
								<button>다시 작성하기</button>
							</a>
						</td>
					</tr>
				</table>
				
					
		
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
