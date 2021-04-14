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
<title>MyPage_Quit</title>
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
<link rel="stylesheet" type="text/css" href="css/mainMatch.css">
<link rel="stylesheet" type="text/css" href="css/mypageMatch.css">
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
        
        // 탈퇴 버튼 클릭 시
        $('#quitBtn').click(function()
		{
			if ($('#quitCheck').is(":checked"))
			{
				location.href="quit.action";
			}
			else
			{
				alert("약관 동의해주세요");
			}
		});
        
     	// 쪽찌함 클릭 시 받은 쪽찌함 팝업
        $('#msgList').click(function()
    	{
        	 var popupX = (document.body.offsetWidth / 2) - (1300 / 2); 
             var popupY= (window.screen.height / 2) - (800 / 2);
             // width, height 계산
    		window.open("mymessagereceive.action", '', 'status=no, scrollbars=yes height=800, width=1300,  left='+ popupX + ', top='+ popupY);
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
						<dd><a href="mypagequit.action" style="font-weight: bold;">- 회원탈퇴</a></dd>
		            </dl>
				</li>
				<li>
					<dl>
						<dt>플래너 & 매칭</dt>
						<dd><a href="myplannerlist.action" >- 플래너 목록</a></dd>
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
        		회원 탈퇴
        	</div>
        	
       		<div class="quit_info">
       			탈퇴 안내
       		</div>
       		
       		<div class="quit-form">
       			<span style="font-size: 18px;">회원 탈퇴를 하기 전에 아래 안내 사항을 읽어주십시오.</span>
       			<br><br>
       			<span class="glyphicon glyphicon-ok" style="font-size: 17px;"></span> 사용하고 계신 아이디(${member.memberId })는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
       			<span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.<br>
       			<br>
       			
       			<span class="glyphicon glyphicon-ok" style="font-size: 17px;"></span> 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br>
       			&nbsp;&nbsp;&nbsp;&nbsp;커뮤니티에 올린 게시글 및 댓글, 매칭 후기, 플래너 등은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;삭제를 원하는 게시글이 있다면 <span style="color: red;">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span><br>
				&nbsp;&nbsp;&nbsp;&nbsp;탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
				
				<div class="quit-form-table">
					<table class="table quit_table"">
						<tbody>
							<tr>
								<th style="padding-left: 10px; padding-top: 10px;">커뮤니티</th>
								<td style="padding-left: 10px; padding-top: 10px;">각 게시판에 올린 게시물 및 댓글</td>
							</tr>
							<tr>
								<th style="padding-left: 10px; padding-top: 10px;">매칭 후기</th>
								<td style="padding-left: 10px; padding-top: 10px;">매칭 후기, 사진 및 댓글</td>
							</tr>
							<tr>
								<th style="padding-left: 10px; padding-top: 10px;">플래너</th>
								<td style="padding-left: 10px; padding-top: 10px;">플래너, 사진 및 가계부</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				
				<div class="quit_form_below">
					<div style="padding-top: 20px;">
						탈퇴 후에는 아이디 ${member.memberId } 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
						게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
					</div>
					<br>
					<input type="checkbox" id="quitCheck">
					<label for="quitCheck" style="color: black;">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
				</div>
				
				<div class="quit_btn">
					<input type="button" id="quitBtn" class="btn btn-default btn-lg" value="탈퇴하기">
				</div>
       		</div><!-- end .quit-form  -->
       		
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
			                      		<li><a href="mypage.action">마이페이지</a></li>
			                      		<li><a href="">공지사항</a></li>
			                      		<li><a href="">고객센터</a></li>
			                      		<li><a href="storyopen.action">커뮤니티</a></li>
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

</div><!-- end .wrap -->

</body>
</html>