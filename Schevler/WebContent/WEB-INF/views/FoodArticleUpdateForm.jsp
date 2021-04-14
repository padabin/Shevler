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
<title>게시글 수정</title>
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

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>


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
		
		// 수정 전 내용 가져오기
        $('#summernote').summernote('code', "${dto.articleContent}");
        
		/* summernote 적용 */
        $('#summernote').summernote({
 	    	value : '${dto.articleContent}'
 	    	, height : 450
 	    	, width : 1000
 	    	, minHeight: null
 	    	, maxHeight: null
 	    	, focus: false
 	    	, tabsize : 4
	        
	  	});
		
        
		
		/* 미입력 방지 */
		$("#submitBtn").click(function()
		{
			if( $("#title").val()=="" )
			{
				alert("제목을 입력하셔야 합니다.");
				$("#title").focus();
				return false;
			}
			
			if( $("#summernote").val()=="" )
			{
				alert("내용을 입력하셔야 합니다.");
				$("#summernote").summernote({focus : true});
				return false;
			}
		});
		
		// 페이지 이동
    	$("#listBtn").click(function()
		{
    		if( ${pageNum == null})
    			$(location).attr("href", "foodarticleopen.action");
    		else
    			$(location).attr("href", "foodarticleopen.action?pageNum=" + ${pageNum});
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
				  <li class="nav_text"><span><a href="#">커뮤니티</a></span></li>
				  <li class="nav_text"><span><a href="#">게시글 수정</a></span></li>
		      </ul>
	    </div><!-- end .ct_nav -->
	    <div class="ct_title">
	      	<h1></h1>
	    </div><!-- end .ct_title  -->
	    <div class="notice_main">
	      	<div class="notice_bottom">
	      		<div class="notice_write_title"> 맛집 글쓰기</div>
	      		
				<form method="post" action="foodupdate.action">
					<input type="hidden" name="articleCode" value="${articleCode }">
				
					<div class="notice_write_content">
					  	<div class="notice_cell1">
					  		<div class="xi-subdirectory"></div>
					  		제목
					  	</div><!-- end . notice_cell1 -->
					  	<div class="notice_cell2">
					  		<input type="text" id="title" name="title" value="${dto.articleTitle }">
					  	</div><!-- end. notice_cell2 -->
					</div><!-- end .notice_write_content -->
					<div class="notice_write_content">
						<div class="notice_cell1">
							<div class="xi-subdirectory"></div>
							내용
						</div><!-- end .notice_cell1 -->
						<div class="notice_cell2" >
							<textarea id="summernote" name="content" ></textarea>
						</div><!-- end .notice_cell2 -->
						
					</div><!-- end .notice_write_content -->
					<div class="notice_write_content">
					  	<div class="notice_cell1">
					  		<div class="xi-subdirectory"></div>
					  		첨부파일
					  	</div><!-- end .notice_cell1 -->
					  	<div class="file_add">
					  		<input type="file" readonly="readonly" name="file" value="파일추가">
					  		<input type="reset" readonly="readonly" value="파일 삭제">
					  	</div><!-- end .file_add -->
					</div><!-- end .notice_write_content -->
					<div class="notie_write_end">
						<button class="notice_write_submit" type="submit" id="submitBtn">수정하기</button>
						<button class="notice_write_cancel" type="button" id="listBtn">목록으로</button>
					</div><!-- end .notie_write_end -->
				</form><!-- end form -->
	     	</div><!-- end .noticebottom --> 
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