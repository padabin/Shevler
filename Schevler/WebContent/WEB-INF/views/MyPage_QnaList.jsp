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
<title>MyPage_QnaList.jsp</title>
<!--아이콘 링크 -->  
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">  

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    



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
    /* 
    //아이디 변경 버튼 클릭 시 
    if ($("#idChangeBtn").val()=="아이디 변경")
    {
    	$("#idChangeBtn").click(function()
		{
			$("#idChangeText").css("display", "inline");
			$("#idChangeBtn2").css("display", "inline");
			$("#idCheckBtn").css("display", "inline");
			
			
			$("#idChangeBtn").val("아이디 변경 취소");
			
			if( $("#idChangeBtn").val()=="아이디 변경 취소")
	    	{
	    		$("#idChangeBtn").click(function()
	    		{
	    			$("#idChangeText").css("display", "none");
	    			$("#idChangeBtn2").css("display", "none");
	    			$("#idCheckBtn").css("display", "none");
	    			$("#idChangeBtn").val("아이디 변경");
	    		});
	    	}
			
		});
    }
     */
    $("#idChangeBtn").click(function()
	{
    	if( $(".idChange").css("display") == "none" )
    		$(".idChange").css("display", "flex");
    	else
    		$(".idChange").hide();
	});
    
    /* 전화번호 변경 버튼 클릭 시 */
    $("#telChangeBtn").click(function()
	{
    	if( $(".telChange").css("display") == "none" )
    		$(".telChange").css("display", "flex");
    	else
    		$(".telChange").hide();
		
	});
    
    /* 이메일 변경 버튼 클릭 시 */
    $("#emailChangeBtn").click(function()
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
    


		$('.my-question').on('click',function(e){
			var $this = $(this),
					$wrap = $this.parents('tr'),
					$cont = $wrap.next('.my-faq'),
					$answer = $cont.next('.my-faq');
			
				    var qnacode = $(this).parents('tr').data('qnacode');
				    // alert(qnacode);
				    
				    var params ="qnacode=" + $(this).parents('tr').data('qnacode');
				    

				    $.ajax({

						type:"post",
						url:"qnaanswerajax.action",
						data:params,
						dataType:"text",
						success:function(args){

							var ansId = $(args).find("memid").html();
							var ansContent =  $(args).find("content").html();
							var ansDate = $(args).find("date").html();		

							$('#ans_id').text(ansId);
							$('#ans_content').text(ansContent);
							$('#ans_date').text(ansDate);
							
							if (ansId == undefined)
							{
								return false;
							}
							if($cont.hasClass('is-active')){
								$cont.removeClass('is-active');
								if($answer.length) $answer.removeClass('is-active');
							}else{						
								$cont.addClass('is-active');
								if($answer.length) $answer.addClass('is-active');
							}
							e.preventDefault();

						},

						//showRequest : 사용자 정의 함수
						error:function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					      }

				    });
						
			/* 
			if($cont.hasClass('is-active')){
				$cont.removeClass('is-active');
				if($answer.length) $answer.removeClass('is-active');
			}else{						
				$cont.addClass('is-active');
				if($answer.length) $answer.addClass('is-active');
			}
			e.preventDefault();
			 */
		});
    
   
    
    
  });
</script>

</head>

<body>

<div id="wrap">
	<div id="header">
		<div class="top">
	        <div class="top-width">
				<div class="btn_main">
		            <a href="main.action">
						<div class="xi-home-o">
						</div>
						Main
		            </a>
				</div><!-- end .btn_main -->
          		<ul class="user_menu">
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
	        <div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
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
						<dd><a href="mypage.action" >- 회원정보 수정</a></dd>
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
						<dd><a href="qnalist.action" style="font-weight: bold;">- 1:1 문의내역</a></dd>
		            </dl>
				</li>
				
	        </ul>
		</div><!-- end .ct_left_menu -->
		<div class="my_main">
        	<div class="main_subject">
        		1:1 문의내역
        	</div>
        	
       		<div class="basic_info">
       			문의 내역
       		</div>
       		
			<table class="n-table table-col">
				<colgroup>
					<col style="width:12.6%">
					<col style="width:12.6%">
					<col style="width:*">
					<col style="width:12.6%">
					<col style="width:12.6%">
				</colgroup>
				<thead>
				<tr>
					<th scope="col">문의 유형</th>
					<th scope="col">문의 제목</th>
					<th scope="col">문의 내용</th>
					<th scope="col">작성일</th>
					<th scope="col">처리 상태</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="qna" items="${qnaList }">
						<!-- 문의 영역 -->
						<tr data-qnaCode="${qna.qnaquestionCode }">
							<td>${qna.qnatypeDetail }</td>
							<td>${qna.qnaquestionTitle }</td>
							<td class="my-question left">${qna.qnaquestionContent }</td>
							<td>${qna.qnaquestionDate }</td>
							<td>
							
		          			<c:choose>
		          				<c:when test="${qna.commentStatus == '1' }">
		          					<span class="state txt-info">답변완료</span>
		          				</c:when>
		          				<c:otherwise>
		          					<span class="state txt-info">답변대기</span>
		          				</c:otherwise>
		          			</c:choose>							
							</td>
						</tr>

						<tr class="my-faq answer">
							<td id="ans_id"></td>
							<td colspan="3" id="ans_content"></td>
							<td id="ans_date"></td>
						</tr>

					</c:forEach>					
				</tbody>
			</table>
			<div class="n-paging">
			1 2 3 4 5
			</div>
			<div class="n-btn-group">
				<a href="qnainsertform.action" class="n-btn btn-accent">1:1 문의하기</a>
			</div>

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

	</footer><!-- end footer -->

</div><!-- end .wrap -->

</body>

</html>