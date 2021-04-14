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
<title>게시글</title>
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> 
<script type="text/javascript">
	
      $( document ).ready( function() {
		  
		/* 메인페이지 외 상단바 */
		// $('.logo a, .right-menu').css('color','black');
		
		/* header 변수 */
        var header = $( '#header' ).offset();
		
		/* header 상단바 scroll 시 고정 스크립트 */
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > header.top ) {
            $( '#header' ).addClass( 'headerFixed' );
          }
          else {
            $( '#header' ).removeClass( 'headerFixed' );
          }
        });
        
      });

      $(function()
      {
    	// 댓글 사이트메뉴 토글
        $(".xi-ellipsis-v").click(function() 
        {
          	$(this).siblings('.coment_opt').toggle();
        });
        
    	// 회원 정보메뉴 토글
        $(".menu").click(function()
		{
			$(this).siblings('.user_opt').toggle();
		});
    	
    	// 페이지 이동
    	$("#listBtn").click(function()
		{
    		if( '${pageNum}' == "")
				$(location).attr("href", "tiparticleopen.action");
    		else
    			$(location).attr("href", "tiparticleopen.action?pageNum=" + '${pageNum}');
		});
    	
    	// 이전글 이동
    	$("#before").click(function()
		{
    		if(${beforeNum} != -1)
    			$(location).attr("href", "tipdetailopen.action?bno=" + ${beforeNum} + "&pageNum=" + '${pageNum}' + "&articleCode=" + '${beforeCode}');
    		else
    		{
    			alert("첫 게시글 입니다.");
    			$("#before").css("disabled", "disabled");
    			return;
    		}
		});
    	
    	// 다음글 이동
    	$("#next").click(function()
		{
    		if(${nextNum} != -1)
    			$(location).attr("href", "tipdetailopen.action?bno=" + ${nextNum} + "&pageNum=" + '${pageNum}' + "&articleCode=" + '${nextCode}');
    		else
    		{
    			alert("마지막 게시글 입니다.");
    			$("#next").css("disabled", "disabled");
    			return;
    		}
		});
    	
    	// 수정 삭제 버튼 클릭 이동
    	$("#updateBtn").click(function()
		{
			$(location).attr("href", "tipupdateopen.action?pageNum=" + ${pageNum} + "&articleCode=" + '${articleCode}' + "&bno=" + ${dto.bno});
		});
    	
    	$("#deleteBtn").click(function()
		{
    		if(confirm("정말로 삭제하시겠습니까?"))
    			$(location).attr("href", "tipdelete.action?articleCode=" + '${articleCode}');
    		else
    			return false;
			
		});
    	
    	// 쪽찌함 클릭 시 받은 쪽찌함 팝업
        $('#msgList').click(function()
        {
             var popupX = (document.body.offsetWidth / 2) - (1300 / 2); 
             var popupY= (window.screen.height / 2) - (800 / 2);
             // width, height 계산
             window.open("writenoteform.action?receiverId=" + '${dto.memberId}', '', 'status=no, scrollbars=yes height=800, width=1300,  left='+ popupX + ', top='+ popupY);
        });
    	
    	// 추천 버튼 클릭
        $("#like").click(function()
   		{
           	ajaxRequest();
           	
   		});
    	
        // 쪽찌함 클릭 시 받은 쪽찌함 팝업
        $('#msgList2').click(function()
        {
             var popupX = (document.body.offsetWidth / 2) - (1300 / 2); 
             var popupY= (window.screen.height / 2) - (800 / 2);
             // width, height 계산
             window.open("writenoteform.action?receiverId=" + $("#msgId").val(), '', 'status=no, scrollbars=yes height=800, width=1300,  left='+ popupX + ', top='+ popupY);
        });
        
     	// 댓글 등록 버튼 클릭
        $("#commentInsertBtn").click(function()
		{
			// 유효성 검사
			if( $("#commentTxt").val() == "" )
			{
				alert("댓글을 입력하셔야 합니다.");
				$("#commentTxt").focus();
				return false;
			}
			
		});
     	
        $("#updateText").css("display", "none");
        $("#commentUpdateBtn").css("display", "none");
        $("#cancelBtn").css("display", "none");
        $("#commentContent").css("display", "inline");
        $("#commentDate").css("display", "inline");
        
        // 댓글 수정 버튼 클릭
        $("#update").click(function()
		{
			$("#updateText").css("display", "inline");
			$("#commentUpdateBtn").css("display", "inline");
	        $("#cancelBtn").css("display", "inline");
	        $("#commentContent").css("display", "none");
	        $("#commentDate").css("display", "none");
	        $("#updateText").val($("#commentContentHidden").val());
	        $("#updateText").focus();
	        
		});
        
        $("#commentUpdateBtn").click(function()
		{
        	if($("#updateText").val() == "")
        	{
        		alert("댓글을 작성해야 합니다.");
        		$("#updateText").focus();
        		return false;
        	}
		});
        
        $("#cancelBtn").click(function()
		{
        	$("#updateText").css("display", "none");
            $("#commentUpdateBtn").css("display", "none");
            $("#cancelBtn").css("display", "none");
            $("#commentContent").css("display", "inline");
            $("#commentDate").css("display", "inline");
		});
        
     	// 댓글 삭제 버튼 클릭
        $("#delete").click(function()
		{
			if(confirm("선택하신 댓글을 정말로 삭제하시겠습니까?"))
			{
				$(location).attr("href", "tipcommentdelete.action?pageNum=" + '${pageNum}'
						+ "&articleCode=" + '${articleCode}' + "&bno=" + ${dto.bno}
						+ "&articleCommentCode=" + $("#articleCommentCode").val());
			}
		});
     	
    	// 신고버튼 클릭 시 받은 신고창 팝업
        $('#articleReport').click(function()
        {
        	reportAjax();
        });
    	
     	// 댓글 신고 버튼 클릭
     	$(".comment_reprot").click(function()
     	{
     		var code = $(this).data('code');
     		var id = $(this).data('id');
     		var reporter = $(this).data('reporter');
     		
     		if (reporter == "")
			{
     			alert("로그인 후 이용 가능합니다.");
     			location.href = "loginopen.action";

				return false;
			}
     		
     		
            var popupX = (document.body.offsetWidth / 2) - (600 / 2); 
            var popupY= (window.screen.height / 2) - (400 / 2);     		
     		
     		window.open("articlecommentreport.action?memberId="+ id + "&articleCommentCode=" + code +"&reporter=" + reporter +"", "", "status=no, scrollbars=yes height=400, width=600,  left="+ popupX + ", top="+ popupY); 

     	});     	
    	
      });
      
    function ajaxRequest()
  	{
    	$.post("likeajax.action", {articleCode : '${articleCode}', pageNum : '${pageNum}', bno : ${dto.bno}}, function(data)
    	{
    		if(data >= 1)
			{
				alert("이미 추천한 게시글 입니다.");
				return false;
			}
			else
				$(location).attr("href", "tiplike.action?articleCode=" + '${articleCode}' 
						+ "&pageNum=" + '${pageNum}' + "&bno=" + ${dto.bno});
    	});
  	}
    
    function reportAjax()
	{
		$.post("reportajax.action", {articleCode : '${articleCode}'}, function(data)
		{
			if(data >= 1)
			{
				alert("이미 신고한 게시글 입니다.");
				return false;
			}
			else
			{
				window.open("articlereportform.action?articleCode=" + '${articleCode}'
	           		 + "&articleTitle=" + '${dto.articleTitle}' + "&memberId=" + '${dto.memberId}'
	           		 , '', 'status=no, scrollbars=yes, height=300, width=500, left=600, top=250');
			}
		});
	}

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
	      	<div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
	      	<!-- right-menu -->
	      	<div class="right-menu">
		        <ul>
		            <li><a href="notice_list.action">공지사항</a></li>
            		<li><a href="plannerlist.action">플래너</a></li>
            		<li><a>매칭</a></li>
            		<li><a href="storyopen.action">커뮤니티</a></li>
		        </ul>
	      	</div><!-- end .right-menu --> 
	    </nav><!-- end .sub_navbar --> 
 	</div><!-- end .header -->
  
	<div id="container">
		<div class="ct_nav">
			<ul>
				<li><a href="main.action"><div class="xi-home"></div></a></li>
				<li class="nav_text"><span><a href="storyopen.action">커뮤니티</a></span></li>
				<li class="nav_text"><span><a href="#">게시글 내용</a></span></li>
			</ul>
	    </div><!-- end .ct_nav -->
	    <div class="ct_title">
			<h1></h1>
	    </div><!-- end .ct_title --> 
	    <div class="notice_main">
			<div class="notice_detail_content">
		        <div class="notice_detail_list">
					<div class="list_left">
						<c:choose>
							<c:when test="${sessionScope.memberId == null }">
								<button class="btn btn-success" style="display: none;">수정</button>
								<button class="btn btn-danger" style="display: none;">삭제</button>
							</c:when>
							<c:when test="${sessionScope.memberId != dto.memberId} ">
								<button class="btn btn-success" style="display: none;">수정</button>
								<button class="btn btn-danger" style="display: none;">삭제</button>
							</c:when>
							<c:when test="${sessionScope.memberId == dto.memberId }">
								<button class="btn btn-success" id="updateBtn">수정</button>
								<button class="btn btn-danger" id="deleteBtn">삭제</button>							
							</c:when>
						</c:choose>
					</div><!-- end .list_left -->
					<button class="btn btn-default" id="next"><div class="xi-angle-up"></div>다음글</button>
					<button class="btn btn-default" id="before"><div class="xi-angle-down"></div>이전글</button>
					<c:choose>
						<c:when test="${sessionScope.memberId == null }">
						<button class="btn btn-default" id="like" style="display: none;"><span class="glyphicon glyphicon-thumbs-up">추천</span></button>
						</c:when>
						<c:otherwise>
						<button class="btn btn-default" id="like"><span class="glyphicon glyphicon-thumbs-up">추천</span></button>
						</c:otherwise>				
					</c:choose>
					<button class="all_list btn btn-default" id="listBtn">목록</button>
					<c:choose>
						<c:when test="${sessionScope.memberId == null }">
						<button class="btn btn-default" id="articleReport" style="display: none;">신고</button>
						</c:when>
						<c:when test="${sessionScope.memberId == dto.memberId }">
						<button class="btn btn-default" id="articleReport" disabled="disabled">신고</button>
						</c:when>
						<c:otherwise>
						<button class="btn btn-default" id="articleReport">신고</button>
						</c:otherwise>				
					</c:choose>
				</div><!-- end .notice_detail_list -->
				<div class="notice_detail_contentBox">
					<div class="notice_detial_title">
						<h1>${dto.articleTitle }</h1>
					</div><!-- end .notice_detail_list -->
					<div class="notice_info" style="border-bottom: 0px red solid;">
						 
						<div class="user_coment2">
							<div class="user_click_option2">
								<span class="menu">
									<span class="userName" style="font-size: 20px; color: black !important;">${dto.memberId }</span>
								</span>
								<div class="user_opt" style="display: none; position: absolute; top: 8px; left: 55px;">
									<ul class="user_menu1">
										<li><a href="memberarticlelist.action?memberId=${dto.memberId }">게시글보기</a></li>
										<li id="msgList"><a href="#">쪽지보내기</a></li>
									</ul>
								</div>
								<br>
							  	<span>${dto.articleDate }</span>
							  	<span class="count">조회</span>&nbsp;<span>${dto.articleHit }</span>
							<div class="articletool">
								댓글 <span style="color: black; font-size: 15px;" id="commentCount">${commentCount }</span>
								추천 <span style="color: black; font-size: 15px; font-weight: bold;" id="likeCount">${likeCount }</span>
							</div><!-- end .articletool --> 
								
							</div>
						</div><!-- end .user_coment -->						
						 
					
						
					</div><!-- end .notice_info -->
					<div class="notice_detial_content" style= "text-align:left; line-height: 100%;">
						${dto.articleContent }			  
					</div><!-- end .notice_detial_content -->			
					<div class="articletoolbottom">
				        <div class="xi-message-o xi-x"></div> 댓글 <span>${commentCount }</span>
				        <div class="report">신고</div>
					</div><!-- end .articletoolbottom -->
		
					<div class="notice_detail_coment">
						<div>
							<span class="coment">댓글</span> <span class="comment_tab_button">등록순</span>
						</div>
					</div><!-- end .notice_detail_comment -->
					
					<c:forEach var="dao" items="${lists }">
					<div class="user_coment">
						<div class="user_click_option">
							<span class="menu">
								<span class="userName" style="font-size: 20px; color: black !important;">${dao.memberId }</span>
							</span>
							<div class="user_opt" style="display: none; position: absolute; top: 8px; left: 55px;">
								<ul class="user_menu1">
									<li><a href="memberarticlelist.action?memberId=${dao.memberId }">게시글보기</a></li>
									<li id="msgList2"><a href="#">쪽지보내기<input id="msgId" type="hidden" value="${dao.memberId }"></a></li>
								</ul>
							</div>
							<br>
							<div class="xi-ellipsis-v xi-x"></div>
					        <div class="coment_opt">
					          <ul>
					          	<c:choose>
					          		<c:when test="${sessionScope.memberId == dao.memberId }">
					          			<li id="update"><a href="#">수정</a></li>
					            		<li id="delete"><a href="#">삭제</a></li>
					          		</c:when>
					          		<c:when test="${sessionScope.memberId != dao.memberId }">
					          			<li><a data-reporter="${sessionScope.memberId }" data-code="${dao.articleCommentCode }" data-id="${dao.memberId }" data-content="${dao.articleCommentContent }" class="comment_reprot">신고</a></li>
					          		</c:when>
					          	</c:choose>
					          </ul>
					        </div><!-- end .coment_opt -->
							<form action="tipcommentupdate.action" method="post">
					        	<input type="hidden" name="pageNum" value="${pageNum }">
								<input type="hidden" name="articleCode" value="${articleCode }">
								<input type="hidden" name="bno" value="${dto.bno }">
								<input type="hidden" id="articleCommentCode" name="articleCommentCode" value="${dao.articleCommentCode }">
						        <textarea rows="2" cols="130" id="updateText" style="display: none;" name="updateCommentTxt"></textarea>
						        <button type="submit" class="btn btn-sm" id="commentUpdateBtn" style="display: none;">수정</button>
						        <button type="button" class="btn btn-sm" id="cancelBtn" style="display: none;">취소</button>
					        </form>
							<span id="commentContent">${dao.articleCommentContent }<input id="commentContentHidden" type="hidden" value="${dao.articleCommentContent }"></span><br>
							<span id="commentDate">${dao.articleCommentDate }</span><br>
						</div>
					</div><!-- end .user_coment -->	
					</c:forEach>
					
					<c:choose>
						<c:when test="${sessionScope.memberId != null }">
							<form action="tipwritecomment.action" method="post">
								<input type="hidden" name="pageNum" value="${pageNum }">
								<input type="hidden" name="articleCode" value="${articleCode }">
								<input type="hidden" name="bno" value="${dto.bno }">
								<div class="comment_textBox form-group input-group">
									<div class="input-group-addon">댓글입력</div>
									<textarea rows="5" cols="40" class="form-control" id="commentTxt" name="commentTxt"></textarea>
									<div class="input-group-addon">
										<button type="submit" class="btn btn-md" id="commentInsertBtn">등록</button>
									</div>
								</div>
							</form>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					
				</div><!-- end .notice_detail_contentBox -->
			</div><!-- end .notice_detail_content --> 
		</div><!-- end .notice_main--> 
	    
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
              <td scope="col"><div class="companyInfo">
                  <ul>
                    <li> <span class="dd">스케블러</span> <span class="dd"><b>대표.</b> 김종호</span> <span class="dd"><b>TEL.</b> 1577-1575</span> <span class="dd"><b>사업자등록번호.</b> <a href="#" class="btn">612-123-12345</a></span> </li>
                    <li> <span class="dd"> <b>주소.</b> 서울특별시 강남구 </span> </li>
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
                    <p>서울특별시 강남구 </p>
                  </div>
                </div></td>
              <td scope="col"><div class="footerinfo">
                  <div class="title">BANK INFO</div>
                  <div class="data -bank d1_fc_kor">
                    <p><span client="bank1a">신한은행</span> 123-4567-890-1</p>
                    <p><span client="bank2a">국민은행</span> 456-7890-123-4</p>
                    <p><span client="bank3a">우리은행</span> 789-0123-456-7</p>
                    <p client="account">예금주 : 김종호</p>
                    <div class="gobank">
                      <select>
                        <option value="">인터넷뱅킹바로가기</option>
                        <option value="">국민은행</option>
                        <option value="">농협</option>
                        <option value="">신한은행</option>
                        <option value="">기업은행</option>
                        <option value="">신협</option>
                        <option value="">우체국</option>
                        <option value="">새마을금고</option>
                        <option value="">한국시티은행</option>
                        <option value="">부산은행</option>
                      </select>
                    </div>
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
      <!-- end -frame --> 
    </div>
    <!-- end footerinfowrap --> 
  </footer>
  <!-- end footer --> 
  
</div>
<!-- end wrap -->

</body>
</html>