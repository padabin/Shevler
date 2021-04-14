<%@page import="com.test.mvc.FindIdPwDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp =request.getContextPath();
%>

<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>Login_FindPwUpdateResult.jsp</title>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<!-- css 추가  -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/login_findidresult.css">

<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!--아이콘 링크 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
  .subject 
  {
    font-size: 60px;
  }

  .member_info 
  {
    font-size: 40px;
  }
</style>

<script type="text/javascript">

  $(document).ready(function () {
    var jbOffset = $('#header').offset();
    $(window).scroll(function () {
      if ($(document).scrollTop() > jbOffset.top) {
        $('#header').addClass('headerFixed');
        $('.logo a, .right-menu').css('color', 'black');
      }
      else {
        $('#header').removeClass('headerFixed');
        $('.logo a, .right-menu').css('color', 'black');
      }
    });
    
    //--1.아이디 찾은 경우--
    
    //"확인"  - 메인화면으로
    $('#result_submit').click(function()
	 {
		location.href="main.action";
	 });
    
    //"로그인 화면으로 이동" 
    $('#result_cancel').click(function()
	 {
		location.href="login.action";				
	 });
    
    //--2.아이디가 없는 경우--
    
    //"메인화면으로 이동" 
    $('#login_main').click(function()
	 {
		location.href="main.action";
	 });
	    
    //
    $('#login_cancel').click(function()
	 {
		location.href="login_findpw.action";
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
      </div>
      <!-- end top -->
      <!-- navbar -->
      <nav class="sub_navbar">

        <!-- logo -->
        <div class="logo"> <a href="#"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
        <!-- end logo -->

        <!-- right -->
        <div class="right-menu">
          <ul>
            <li><a href="notice_list.action">공지사항</a></li>
            		<li><a href="plannerlist.action">플래너</a></li>
            		<li><a>매칭</a></li>
            		<li><a href="storyopen.action">커뮤니티</a></li>
          </ul>
        </div>
        <!-- end right -->
      </nav>
      <!-- end navbar -->
    </div>
    <!-- end header -->
    <div id="content" class="content">
      <form action="login.action" method="post">
        <div class="member">
          <h3 class="member_sub">비밀번호 찾기</h3>
          <hr>
          <div class="member-form">
	            <span>비밀번호가 변경되었습니다.</span>
	            <br><br>
	            <input type="submit" value="확인" class="member-btn" id="result_submit">
	            <input type="button" value="로그인화면으로 이동" class="member-btn" id="result_cancel">
          </div>
        </div>
      </form>
    </div>
    <!-- end content -->

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
            </div>
            <!-- end snswrap -->
          </div>
          <!-- end footerbottom-->
        </div>
      </div>

    </footer><!-- end footer -->

  </div>
  <!-- end wrap -->

</body>

</html>