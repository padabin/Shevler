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
<title>내 플래너 리스트</title>
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/mypageMatch.css">
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
      $( document ).ready( function() {
        var jbOffset = $( '#header' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '#header' ).addClass( 'headerFixed' );
			$('.logo a, .right-menu').css('color','black');
          }
          else {
            $( '#header' ).removeClass( 'headerFixed' );
			  $('.logo a, .right-menu').css('color','black');
          }
        });
      } );
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
						<dd><a href="mypage.action">- 회원정보 수정</a></dd>
						<dd><a href="mypagequit.action">- 회원탈퇴</a></dd>
		            </dl>
				</li>
				<li>
					<dl>
						<dt>플래너 & 매칭</dt>
						<dd><a href="myplannerlist.action" style="font-weight: bold;">- 플래너 목록</a></dd>
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
  
		<div id="container">
			<div class="main_subject">
        		내 플래너 리스트
        	</div>
		
		<div>
			<a href="plannercreateform1.action"><button class="btn btn-default btn-lg"
			style="position: absolute; top: 25%; right: 21%; font-weight: bold;">플래너 생성하기</button></a>
		</div>
		
		<div class="my_main">
       		<div class="notice_content" style="position: absolute; width: 1200px; left: 22%; top: 30%">
				<table>
					<tbody>
						<tr class="notice_table_tr">
							<th>No.</th>
							<th>플래너 제목</th>
							<th>여행시작</th>
							<th>여행종료</th>
							<th>여행타입</th>
							<th>매칭희망여부</th>
							<th>플래너 정보 수정</th>
						</tr>
						<c:forEach var="dao" items="${list }">
						<tr>
							<td>${dao.rnum }</td>
							<td><a style="color: black;" href="scheduledetail.action?pageNum=${pageNum eq null ? 1 : pageNum }&planner_code=${dao.planner_code}">${dao.planner_title }</a></td>
							<td>${dao.planner_start_date }</td>
							<td>${dao.planner_end_date }</td>
							<c:if test="${dao.travel_type_code eq 'TT1'}">
							<td>관광</td>
							</c:if>
							<c:if test="${dao.travel_type_code eq 'TT2'}">
							<td>맛집 탐방</td>
							</c:if>
							<c:if test="${dao.travel_type_code eq 'TT4'}">
							<td>축제 탐방</td>
							</c:if>
							<c:if test="${dao.travel_type_code eq 'TT6'}">
							<td>액티비티</td>
							</c:if>
							<c:if test="${dao.travel_type_code eq 'TT7'}">
							<td>힐링</td>
							</c:if>
							<c:if test="${dao.matching_availability_code eq 'MA1'}">
							<td>희망</td>
							</c:if>
							<c:if test="${dao.matching_availability_code eq 'MA2'}">
							<td>비희망</td>
							</c:if>
							<td> 
								<a href="plannerupdateform.action?planner_code=${dao.planner_code }"><input class="btn btn-primary" type="button"  value="수정"/></a>							
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table><!-- end .table -->
				<div class="paging" style="text-align: left;">
					<c:if test="${dataCount != 0 }">
						<span style="color: black; margin: 0 420px;" >${pageIndexList }</span>
					</c:if>
				</div><!-- end .paging -->
			</div>
		</div><!-- end .my_main -->
    </div><!-- end .container-->
   
  </div><!-- end content -->
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
                <div class="copyright">Copyright © <b>스케블러</b> all rights reserved.</div></td>
              <td scope="col"><div class="footerinfo">
                  <div class="title">QUICK</div>
                  <ul>
                    <li><a href="/member/login.html">로그인</a> </li>
                    <li><a href="/member/join.html">회원가입</a> </li>
                    <li><a href="">마이페이지</a></li>
                    <li><a href="">공지사항</a></li>
                    <li><a href="">고객센터</a></li>
                    <li><a href="">커뮤니티</a></li>
					  <li><a href="">게시판</a></li>
                  </ul>
                </div></td>
              <td scope="col"><div class="footerinfo">
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
                </div></td>
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
	  
  </footer>
  <!-- end footer -->
	
</div>
<!-- end wrap -->

</body>
</html>