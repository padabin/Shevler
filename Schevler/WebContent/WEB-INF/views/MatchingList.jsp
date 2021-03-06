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
<title>Match_List.html</title>
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
      } );
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
			<a href="#">
			<div class="xi-home-o">
			</div>
			Main
			</a>
		</div>
        <ul class="user_menu">
          <li><a href="#">로그인</a></li>
          <li><a href="#">마이페이지</a></li>
          <li><a href="#">고객센터</a></li>
        </ul>
      </div>
      <!-- end top-width --> 
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
            		<li><a href="matchinglist.action">매칭</a></li>
            		<li><a href="storyopen.action">커뮤니티</a></li>
          		</ul>
      </div>
      <!-- end right --> 
    </nav>
    <!-- end navbar --> 
  </div>
  <!-- end header -->
    <div id="container">
	  <div class="ct_nav">
		  <ul>
			  <li><div class="xi-home"></div></li>
		  	  <li class="nav_text"><span>매칭</span></li>
		  	  <li class="nav_text"><span>매칭리스트</span></li>
		  
		  </ul>
	  </div>
	  <div class="ct_title">
      	<h1>매칭</h1>
	  </div>
	  <div class="ct_left_menu">
		  <div class="my_top">
		  	<div class="xi-profile-o xi-3x"></div>
			  <br>
			  매칭
		  </div>
		  <ul>
		  	<li>
				<dl>
				<dt>매칭</dt>
					<dd><a href="#">- 플래너 목록</a></dd>
					<dd><a href="#">- 매칭 신청 목록</a></dd>
					<dd><a href="#">- 매칭 성사 목록</a></dd>
				</dl> 
			</li>
		  	<li>
				<dl>
				<dt>매칭 대화함</dt>
				<dd><a href="#">- 받은 쪽지함</a></dd>
					<dd><a href="#">- 보낸 쪽지함</a></dd>
				</dl>
			</li>			  
		  </ul>
	  </div>
  
  <div id="content">
    
    <div class="content_header">
    매칭 리스트
    <br>
    <span style="font-size: 15px;">- 선택한 플래너와 매칭된 리스트 입니다.</span>
    </div><!-- end content_header -->
    
    <div class="content_list">
		
		<button type="button" class="match_btn">당신의 일정과 겹쳐요!</button>
		<button type="button" class="match_btn">당신의 일정과 비슷해요!</button>
		
		<table>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>시작</th>
				<th>끝</th>
			</tr>
			<tr>
				<td>01</td>
				<td><a href="#">제주2박3일</a></td>
				<td>ysl</td>
				<td>2020-12-28</td>
				<td>2020-12-30</td>
			</tr>
			<tr>
				<td>02</td>
				<td><a href="#">부산2박3일</a></td>
				<td>pdb</td>
				<td>2021-01-13</td>
				<td>2021-01-15</td>
			</tr>
			<tr>
				<td>03</td>
				<td><a href="#">강릉4박5일</a></td>
				<td>jgl</td>
				<td>2021-01-21</td>
				<td>2021-01-25</td>
			</tr>
			<tr>
				<td>04</td>
				<td><a href="#">포항3박4일</a></td>
				<td>jhk</td>
				<td>2021-02-01</td>
				<td>2021-02-04</td>
			</tr>
			<tr>
				<td>05</td>
				<td><a href="#">제주5박6일</a></td>
				<td>jwj</td>
				<td>2021-03-16</td>
				<td>2021-03-21</td>
			</tr>
			<tr>
				<td>06</td>
				<td><a href="#">경주2박3일</a></td>
				<td>hra</td>
				<td>2021-03-23</td>
				<td>2021-03-25</td>
			</tr>
			<tr>
				<td>07</td>
				<td><a href="#">여주3박4일</a></td>
				<td>alice</td>
				<td>2021-04-03</td>
				<td>2021-04-06</td>
			</tr>
			<tr>
				<td>08</td>
				<td><a href="#">거제1박2일</a></td>
				<td>jino</td>
				<td>2021-04-11</td>
				<td>2021-04-12</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
   	</div><!-- end content_plannerList -->
   
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
              <td scope="col"><div class="footerinfo">
                  <div class="title">BANK INFO</div>
                  <div class="data -bank d1_fc_kor">
                    <p><span client="bank1a">신한은행</span><span> 123-4567-890-1</span></p>
                    <p><span client="bank2a">국민은행</span><span> 456-7890-123-4</span></p>
                    <p><span client="bank3a">우리은행</span><span> 789-0123-456-7</span></p>
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
    </div>
	  
  </footer>
  <!-- end footer -->
	
</div>
<!-- end wrap -->

</body>
</html>