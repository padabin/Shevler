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
<title>MyPage</title>
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

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

  $(document).ready(function () {

    /* 메인페이지 외 상단바 */
    // $('.logo a, .right-menu').css('color','black');

    /* header 변수 */
    var header = $('#header').offset();
    
    var leftBar = $("#ct_left_menu").offset();

    /* header 상단바 scroll 시 고정 스크립트 */
    $(window).scroll(function () {
      if ($(document).scrollTop() > header.top) {
        $('#header').addClass('headerFixed');
      }
      else {
        $('#header').removeClass('headerFixed');
      }

    });
    
    $("#idChangeBtn").click(function()
	{
    	if( $(".idChange").css("display") == "none" )
    		$(".idChange").css("display", "flex");
    	else
    		$(".idChange").hide();
	});
    
    /* 전화번호 변경 버튼 클릭 시 */
    $("#telChangeToggle").click(function()
	{
    	if( $(".telChange").css("display") == "none" )
    		$(".telChange").css("display", "flex");
    	else
    		$(".telChange").hide();
		
	});
    
    /* 이메일 변경 버튼 클릭 시 */
    $("#emailChangeToggle").click(function()
	{
    	if( $(".emailChange").css("display") == "none" )
    		$(".emailChange").css("display", "flex");
    	else
    		$(".emailChange").hide();
		
	});
    
    $("#emailSelect").change(function()
	{
		var emailVal = $("#emailSelect option:selected").val();
		
		if($("#emailSelect option:selected").val()=="직접입력")
		{
			$("#emailChangeText2").val("");
		}
    
		$("#emailChangeText2").val(emailVal);
	});
    
 	// 쪽찌함 클릭 시 받은 쪽찌함 팝업
    $('#msgList').click(function()
	{
    	 var popupX = (document.body.offsetWidth / 2) - (1300 / 2); 
         var popupY= (window.screen.height / 2) - (800 / 2);
         // width, height 계산
		window.open("mymessagereceive.action", '', 'status=no, scrollbars=yes height=800, width=1300,  left='+ popupX + ', top='+ popupY);
	});

  });
</script>

</head>

<body>

<div id="wrap">
	<div id="header">
		<div class="top">
	        <!-- top-width -->
        <div class="top-width">
          		<div class="btn_main">
            		<a href="main.action">
              			<div class="xi-home-o">
              			</div>
              			Main
            		</a>
          		</div>
          		<ul class="user_menu">
          			<c:choose>
          				<c:when test="${sessionScope.admin != null }">
          					<li id="adminPage"><a href="adminmain.action"">관리자 페이지</a></li>
          				</c:when>
          			</c:choose>
          			<c:choose>
          				<c:when test="${sessionScope.name == null }">
          					<li id="loginBtn"><a href="loginopen.action">로그인</a></li>
          				</c:when>
          				<c:otherwise>
          					<li id="logoutBtn"><a href="logout.action">로그아웃</a></li>
          				</c:otherwise>
          			</c:choose>
          			<c:choose>
          				<c:when test="${sessionScope.name == null }">
          					<li id="#"><a href="tosagreeopen.action">회원가입</a></li>
          				</c:when>
          				<c:otherwise>
          					<li id="#"><a href="#"></a></li>
          				</c:otherwise>
          			</c:choose>
            		<li><a href="mypage.action" id="myPage">마이페이지</a></li>
            		<li><a href="qnainsertform.action" id="QnA">고객센터</a></li>
          		</ul>
        	</div><!-- end .top-width -->
		</div><!-- end .top -->

		<nav class="sub_navbar">
	        <div class="logo"> <a href="#"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
	        <!-- end logo -->
	
	        <!-- right-menu -->
	        <div class="right-menu">
				<ul>
		            <li><a href="notice_list.action">공지사항</a></li>
            		<li><a href="plannerlist.action">플래너</a></li>
            		<li><a>매칭</a></li>
            		<li><a href="storyopen.action">커뮤니티</a></li>
				</ul>
	        </div><!-- end .right-menu -->
		</nav><!-- end navbar -->
	</div><!-- end .header -->

    <div id="container">
		<div class="ct_nav">
	        <ul>
				<li>
	            	<div class="xi-home"></div>
				</li>
				<li class="nav_text"><span>마이페이지</span></li>
	        </ul>
		</div><!-- end .ct_nav -->
		<div class="ct_title">
        	<h1>마이페이지</h1>
      	</div><!-- end .ct_title -->
      	<div class="ct_left_menu">
	        <div class="my_top">
	          	<div class="xi-profile-o xi-3x"></div>
	          	<br>
	          	MY PAGE
	          	<br>
	        </div><!-- end .my_top -->
	        <ul>
	        	<li>
		            <dl>
						<dt>회원정보</dt>
						<dd><a href="mypage.action" style="font-weight: bold;">- 회원정보 수정</a></dd>
						<dd><a href="mypagequit.action">- 회원탈퇴</a></dd>
		            </dl>
				</li>
				<li>
					<dl>
						<dt>플래너 & 매칭</dt>
						<dd><a href="myplannerlist.action">- 플래너 목록</a></dd>
						<dd><a href="#">- 플래너 가계부</a></dd>
						<dd><a href="#">- 매칭 성사 목록</a></dd>
		            </dl>
				</li>
				<li>
		            <dl>
						<dt>나의 활동</dt>
						<dd><a href="#" id="msgList">- 쪽지함</a></dd>
						<dd><a href="memberlikearticlelist.action?memberId=${id }">- 내가 추천한 글</a></dd>
						<dd><a href="memberarticlelist.action?memberId=${id }">- 내가 쓴 글</a></dd>
						<dd><a href="membercommentlist.action?memberId=${id }">- 내가 쓴 댓글</a></dd>
		            </dl>
				</li>
				<li>
		            <dl>
						<dt>1:1문의</dt>
						<dd><a href="qnalist.action">- 1:1 문의내역</a></dd>
		            </dl>
				</li>
				
	        </ul>
		</div><!-- end .ct_left_menu -->
		<div class="my_main">
        	<div class="main_subject">
        		내 회원정보 수정
        	</div>
        	
       		<div class="basic_info">
       			기본 정보
       		</div>
       		<table class="table basic_info_table">
   				<tbody>
   					<tr style="border-top: 2px;">
   						<th style="padding: 20px; font-size: 18px;">아이디</th>
   						<td style="padding: 20px; font-size: 18px;">
   							${member.memberId } 
   						</td>
   					</tr>
   					<tr>
   						<th style="padding: 20px; font-size: 18px;">이름</th>
   						<td style="padding: 20px; font-size: 18px;">
   							<span>${member.memberName }</span>
   						</td>
   					</tr>
   					<tr>
   						<th style="padding: 20px; font-size: 18px;">전화번호</th>
   						<td style="padding: 20px; font-size: 18px;">
   							${member.memberTel } &nbsp;&nbsp;
   							<input type="button" class="btn btn-default btn-lg" id="telChangeToggle" value="번호 변경"><br>
   							<form action="mypagetelchange.action">
	   							<div class="telChange" style="display: none; padding-top: 10px;">
		   							<input type="tel" class="form-control" name="tel" id="telChangeText" style="width: 150px; height: 30px;">
		   							<input type="submit" class="btn btn-default btn-md" id="telChangeBtn" value="번호 수정">
		   						</div>
	   						</form>
   						</td>
   					</tr>
   					<tr>
   						<th style="padding: 20px; font-size: 18px;">이메일</th>
   						<td style="padding: 20px; font-size: 18px;">
   							${member.memberEmail } &nbsp;&nbsp;
   							<input type="button" class="btn btn-default btn-lg" id="emailChangeToggle" value="이메일 변경"><br>
   							<div class="emailChange" style="display: none; padding-top: 10px;">
	   							<form action="mypageemailchange.action">
		   							<input type="text" name="email1" id="emailChangeText1" style="width: 150px; height: 30px;"> 
		   							<span id="at" style="padding-top: 7px;">@</span>
		   							<input type="text" name="email2" id="emailChangeText2"  style="width: 150px; height: 30px;">
		   							<select id="emailSelect" style="width: 150px; height: 30px;">
		   								<option id="self">직접입력</option>
		   								<option id="naver">naver.com</option>
		   								<option id="daum">hanmail.net</option>
		   								<option id="google">gmail.com</option>
		   								<option id="outlook">hotmail.com</option>
		   								<option id="yahoo">yahoo.com</option>
		   							</select>&nbsp;&nbsp;
		   							<input type="submit" class="btn btn-default btn-md" id="emailChangeBtn" value="이메일 수정">
	   							</form>
   							</div>
   						</td>
   					</tr>
   					<tr>
   						<th style="padding: 20px; font-size: 18px; border-bottom: 1px solid #ddd;">주민등록번호</th>
   						<td style="padding: 20px; font-size: 18px; border-bottom: 1px solid #ddd;">
   							<input type="text" class="form-control" value="${member.memberSsn }" readonly="readonly"
   							style="width: 200px; font-size: 15px;">
   						</td>
   					</tr>
   				</tbody>
       		</table>
		</div><!-- end .my_main -->
    </div><!-- end .container-->

    <footer id="-footer" class="-footer">
		<div class="footerinfowrap">
	        <div class="-frame">
	          	<table border="0" summary="" cellspacing="0" cellpadding="0">
		            <colgroup>
		              	<col style="width:auto;">
		              	<col style="width:14%;">
		              	<col style="width:23%;">
		              	<col style="width:23%;">
		            </colgroup>
		            <tbody>
		              	<tr>
			            	<td scope="col">
			                  	<div class="companyInfo">
				                    <ul>
				                      	<li>
				                      		<span class="dd">스케블러</span>
				                        	<span class="dd"><b>대표.</b> 김종호</span>
				                        	<span class="dd"><b>TEL.</b> 1577-1575</span>
				                        	<span class="dd"><b>사업자등록번호.</b>
				                          		<a href="#" class="btn">612-123-12345</a></span>
				                      	</li>
				                      	<li>
				                        	<span class="dd">
				                          	<b>주소.</b> 서울특별시 강남구
				                        	</span>
				                      	</li>
				                    </ul>
			                  	</div>
			                  	<div class="copyright">Copyright © <b>스케블러</b> all rights reserved.</div>
			                </td>
			                <td scope="col">
			                  	<div class="footerinfo">
			                    	<div class="title">QUICK</div>
			                    	<ul>
			                      		<li><a href="/member/login.html">로그인</a> </li>
			                      		<li><a href="/member/join.html">회원가입</a> </li>
			                      		<li><a href="">마이페이지</a></li>
			                      		<li><a href="">공지사항</a></li>
			                      		<li><a href="">고객센터</a></li>
			                      		<li><a href="">커뮤니티</a></li>
			                    	</ul>
			                  	</div>
			                </td>
			                <td scope="col">
			                  	<div class="footerinfo">
			                    	<div class="title">CALL CENTER</div>
			                    	<div class="data d1_fc_kor">
			                      		<p class="call"><span client="callnumber">1234-5678</span></p>
			                      		<p><span client="openinfo1">평일 오전 10:00 - 오후 6:00</span></p>
			                      		<p><span client="openinfo2">점심시간 오후 12:00 - 오후 1:00</span></p>
			                      		<p><span client="openinfo3">토.일.공휴일 휴무</span></p>
			                    	</div>
			                  	</div>
			                  	<div class="footerinfo">
			                    	<div class="title">RETURN / EXCHANGE</div>
			                    	<div class="data d1_fc_kor">
			                      		<p><span>서울특별시 강남구 </span></p>
			                    	</div>
			                  	</div>
			                </td>
		              	</tr>
		            </tbody>
	          	</table>
	          	<div class="footerbottom">
		            <div class="snswrap">
						<ul>
						  	<li class="-sns_blog"><a href="#none" target="_blank"><i class="xi-blogger"></i></a></li>
						  	<li class="-sns_facebook"><a href="#none" target="_blank"><i class="xi-facebook"></i></a></li>
						  	<li class="-sns_instagram"><a href="#none" target="_blank"><i class="xi-instagram"></i></a></li>
						  	<li class="-sns_katalk"><a href="#none" target="_blank"><i class="xi-kakaotalk"></i></a></li>
						  	<li class="-sns_kastory"><a href="#none" target="_blank"><i class="xi-kakaostory"></i></a></li>
						</ul>
		            </div><!-- end .snswrap -->
          		</div><!-- end .footerbottom-->
			</div><!-- end .-frame -->
		</div><!-- end .footerinfowrap -->

	</footer><!-- end footer -->>

</div><!-- end .wrap -->

</body>

</html>