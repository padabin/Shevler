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
	<title>보낸 쪽지함</title>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {

			/* 메인페이지 외 상단바 */
			// $('.logo a, .right-menu').css('color','black');
			/* header 변수 */
			var header = $('#header').offset();

			/* header 상단바 scroll 시 고정 스크립트 */
			$(window).scroll(function () {
				if ($(document).scrollTop() > header.top) {
					$('#header').addClass('headerFixed');
				} else {
					$('#header').removeClass('headerFixed');
				}
			});

			// 전체 체크박스 컨트롤
			$("#msgSelectAll").change(function () {
				if ($("#msgSelectAll").is(":checked")) {
					//alert("check안되어있음");

					$("[name='noteCodes']").each(function (index) {
						$(this).prop("checked", true);
					});
				} else {
					//alert("check되어있음");
					$("[name='noteCodes']").each(function (index) {
						$(this).prop("checked", false);
					});
				}
			})
			
			// 전체 체크 박스 옆 삭제 버튼			
			$('#deleteBtn').click(function()
			{
				if (confirm("보낸 쪽지 이력은 삭제 시 복원 불가능 합니다.\n삭제하시겠습니까?"))
				{
					$('#deleteForm').submit();
				}
				
				
			});

		});
	</script>

</head>

<body>

	<div id="wrap">
		<div id="header">
			<nav class="sub_navbar">
				<b>보낸 쪽지함</b>

				<!-- right-menu -->
				<div class="right-menu">
					<form action="notesendsearch.action">
						<select name="searchType" style="height: 28px;">
							<option value="receiver">아이디</option>
							<option value="note_content">내용</option>
						</select> <input type="text" name="searchValue" />
						<button id="submitBtn">검색</button>
					</form>
				</div>
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
								<a href="mymessagereceive.action" >- 받은 쪽지함</a>
							</dd>
							<dd>
								<a href="mymessagesend.action" style="font-weight: bold;">- 보낸 쪽지함</a>
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
						<input type="checkbox" id="msgSelectAll" />
						<button id="deleteBtn">삭제</button>
					</div>
				</div>

				<!-- end list_top -->

				<!-- realMsgList -->
				<div id="realMsgList">
				<form action="notesendmultipledelete.action" id="deleteForm" method="post">
					<table class='table'>
						<!-- jsp로 유동적 출력 -->
						<tr>
							<th></th>
							<th>No.</th>
							<th>받는 유저 아이디</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
						<c:forEach var="note" items="${lists }">
							<tr>
								<td><input type="checkbox" name="noteCodes" value="${note.note_code }"/></td>
								<td>${note.rnum }</td>
								<td>${note.receiver }</td>
								<td><a href="notedetail.action?noteCode=${note.note_code }">${note.note_content }</a></td>
								<td>${note.note_sentdate }</td>
							</tr>
						</c:forEach>
					</table>
					</form>
					
					
					<div class="paging" style="text-align: left;">
							<c:if test="${dataCount != 0 }">
								<span style="color: black; margin: 0 420px;" >${pageIndexList }</span>
							</c:if>
					</div><!-- end .paging -->


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