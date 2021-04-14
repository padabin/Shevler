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
<title>스케블러 : 로그인</title>
  <!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function () 
	{
	    var jbOffset = $('#header').offset();
	    $(window).scroll(function () 
	    {
			if ($(document).scrollTop() > jbOffset.top) 
			{
		        $('#header').addClass('headerFixed');
		        $('.logo a, .right-menu').css('color', 'black');
			}
			else 
			{
		        $('#header').removeClass('headerFixed');
		        $('.logo a, .right-menu').css('color', 'black');
			}
	    });
    
    /* 유효성검사 */
    $("#submitBtn").click(function()
	{
    	$("#err1").css("display", "none");
    	$("#err2").css("display", "none");
    	
		if( $("#id").val()=="" )
		{
			$("#err1").css("display", "inline");
			$("#id").focus();
			return false;
		}

		if( $("#password").val()=="" )
		{
			$("#err2").css("display", "inline");
			$("#password").focus();
			return false;
		}
	});
    
    
  });
</script>

</head>

<body>

<!-- wrap -->
<div id="wrap">

	<!-- header -->
    <div id="header">

		<!-- top -->
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
      <!-- navbar -->
      <nav class="sub_navbar">

        <!-- logo -->
        <div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
        <!-- end logo -->

        <!-- right -->
        <div class="right-menu">
          <ul>
            <li><a href="notice_list.action">공지사항</a></li>
            		<li><a href="plannerlist.action">플래너</a></li>
            		<li><a>매칭</a></li>
            		<li><a href="storyopen.action">커뮤니티</a></li>
          </ul>
        </div><!-- end .right -->
      </nav><!-- end .navbar -->
    </div><!-- end .header -->

    <div id="login_content" style="height: 700px;">
      <div class="login-form">
        <form action="login.action">
          <input type="text" name="id" id="id" class="text-field" placeholder="아이디">
          <span id="err1" class="errMsg">아이디를 입력하여 주세요.</span>
          <input type="password" name="password" id="password" class="text-field" placeholder="비밀번호">
          <span id="err2" class="errMsg">비밀번호를 입력하여 주세요.</span>
          <input type="submit" value="로그인" class="submit-btn" id="submitBtn">
          <span id="err3" class="errMsg">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</span>
          <input type="checkbox" name="admin" id="admin" value="0"><label for="admin" style="padding-left: 4px; font-weight: normal;"> 관리자</label>
        </form>

        <div class="links">
          <a href="tosagreeopen.action">회원가입</a>
          <br>
          <a href="login_findid.action">아이디를 잊어버리셨나요?</a>
          <br>
          <a href="login_findpw.action">비밀번호를 잊어버리셨나요?</a>
        </div>
      </div>
    </div>
    <!-- end .content -->
    
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
			                      <li> <span class="dd">스케블러</span>
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
			                      <li><a href="loginopen.action">로그인</a> </li>
			                      <li><a href="tosagreeopen.action">회원가입</a> </li>
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

	</footer><!-- end footer -->

</div><!-- end wrap -->

</body>

</html>