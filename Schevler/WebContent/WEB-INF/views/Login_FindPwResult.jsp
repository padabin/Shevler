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
<title>Login_FindPwResult.jsp</title>

<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
 
   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- css 추가  -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/login_findpwresult.css">

<!-- js 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/util.js"></script>

<style type="text/css">
    .subject {
      font-size: 60px;
    }

    .member_info {
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
      
      //1.등록된 아이디가 있는 경우
      //확인 버튼 클릭한 경우 - 비밀번호 정규식 검사
      $('#result_submit').click(function()
	  {
    	  
    	  f = document.myForm;
    	  
    	  pw = f.login_pw.value;
    	  pw = pw.trim();
    	  pw2 = f.login_pw2.value;
    	  pw2 = pw2.trim();
    	  
    	 // alert(pw);
    	 // alert(isValidPassword(pw));
  	  	
    	  if(!pw)
    	  {
    		  alert("새 비밀번호를 입력해주세요");
    		  f.login_pw.focus();
    		  return false;
    	  }
    	  else if(!isValidPassword(pw))
    	  {
    		  alert("정상적인 비밀번호 형식을 입력하세요~!!\n비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.\n입력한 비밀번호:"+pw);
			  f.login_pw.focus();
			  return false;
    	  }
    	  
    	  if(!pw2)
    	  {
    		  alert("새 비밀번호를 입력해주세요");
    		  f.login_pw.focus();
    		  return false;
    	  }
    	  else if(!isValidPassword(pw2))
    	  {
    		  alert("정상적인 비밀번호 형식을 입력하세요~!!\n비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.\n입력한 비밀번호확인:"+pw2);
			  f.login_pw2.focus();
			  return false;
    	  }
    	  
    	  if(pw != pw2)
    	  {
    		  alert("새 비밀번호와 맞지 않습니다. 다시 입력해주세요")
    		  f.login_pw2.focus();
    		  return false;
    	  }	 
    	  
    	  f.submit();
 
	  });
      
      //취소 버튼 클릭한 경우
      $('#result_cancel').click(function()
	  {
			location.href="login.action";
	  });
      
      //2. 등록된 아이디가 없는 경우
      //이전 버튼 클릭한 경우
      $('#cancel_submit').click(function()
	  {
			location.href="login_findpw.action";
	  });
      
     //취소 버튼 클릭한 경우
      $('#cancel_main').click(function()
	  {
			location.href="login.action";
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
      <form action="login_findpwupdateresult.action" method="post" id="updateresult_form" name="myForm">
        <div class="member">
          <h3 class="member_sub">비밀번호 찾기</h3>
          <hr>
          <div class="member-form">
          	<c:if test="${!empty result.member_id && !empty result.member_info_name && !empty result.member_info_email}">
				<h3>회원 인증이 되었습니다.</h3>
				<h4>비밀번호를 재설정하시겠습니까?</h4>
				
				<!-- 다 완성되면 input type="password"로 변경 -->
				<input type="hidden" id="login_id" name="login_id"  value="${result.member_id }">
            	<input type="hidden" id="login_name" name="login_name" value="${result.member_info_name }">
            	<input type="hidden" id="login_email" name="login_email" value="${result.member_info_email }">
        		<input type="password" id="login_pw" name="login_pw" class="text-field" placeholder="새 비밀번호">
            	<input type="password" id="login_pw2" name="login_pw2" class="text-field" placeholder="새 비밀번호 확인">
 				
	            <input type="button" value="확인" class="member-btn" id="result_submit">
	            <input type="button" value="취소" class="member-btn" id="result_cancel">
            </c:if>
          	<c:if test="${empty result.member_id || empty result.member_info_name || empty result.member_info_email}">
				<h3>회원 정보가 맞지 않습니다. 다시 입력해주세요.</h3>
	            <input type="button" value="이전" class="member-btn" id="cancel_submit">
	            <input type="button" value="취소" class="member-btn" id="cancel_main">
            </c:if>
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