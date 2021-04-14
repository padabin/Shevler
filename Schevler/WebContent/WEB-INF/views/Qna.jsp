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
  <title>Basic</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>  
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/helpdesk.css">
<script type="text/javascript">

  $(document).ready(function () {

    /* 메인페이지 외 상단바 */
    // $('.logo a, .right-menu').css('color','black');

    /* header 변수 */
    var header = $('#header').offset();

    /* header 상단바 scroll 시 고정 스크립트 */
    $(window).scroll(function () {
      if ($(document).scrollTop() > header.top) {
        $('#header').addClass('headerFixed');
      }
      else {
        $('#header').removeClass('headerFixed');
      }
    });


    $('#submit').click(function() {

      if ($('#qnaaddress').val() == "") {
        alert("이메일을 입력해주세요.");
        return false;
      }

      if ($('#qnacontent').val() == "") {
        alert("문의 내용을 입력해주세요.");
        return false;
      }

      if ($('#qnasubmitconfirm').is(":checked") == false) {
        alert("위 약관에 동의해주세요.");
        $('#qnasubmitconfirm').focus();
        return false;
      }

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
            		<li><a href="#" id="myPage">마이페이지</a></li>
            		<li><a href="qnainsertform.action" id="QnA">고객센터</a></li>
          		</ul>
        </div>
        <!-- end top-width -->
      </div>
      <!-- end top -->

      <nav class="sub_navbar">
        <div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
        <!-- end logo -->

        <!-- right-menu -->
        <div class="right-menu">
          <ul>
            	<li><a href="plannerlist.action">플래너</a></li>
            	<li><a>매칭</a></li>
            	<li><a href="communityopen.action">커뮤니티</a></li>
          </ul>
        </div>
        <!-- end right-menu -->
      </nav>
      <!-- end navbar -->
    </div>
    <!-- end header -->

    <div id="container">
      <div class="ct_nav">
        <ul>
          <li>
            <div class="xi-home"></div>
          </li>
          <li class="nav_text"><span>고객센터</span></li>
        </ul>
      </div>
      <div class="ct_title">
        <h1>고객센터</h1>
      </div>
      <div class="ct_left_menu">
        <div class="my_top">
          <div class="xi-profile-o xi-3x"></div>
          <br>
          CS Center<br>
        </div>
        <ul>
          <li>
            <dl>
              <dt>고객센터</dt>
              <dd><a href="qnainsert.action">- 1:1 문의</a></dd>
              <dd><a href="HelpDesk_call.html">- 공지사항</a></dd>
            </dl>
          </li>
        </ul>
      </div>
      <!-- ct_left_menu -->

      <div class="content">
		<div class="main_subject">문의하기</div>
		<p>서비스에 이용에 관한 1:1문의사항을 보내주세요.</p>
        <hr>		      
        <form name="qnainsert" id="qnainsert" action="qnainsert.action" method="post">
        <table class="ct_table">
          <tr>
            <td colspan="2" class="space">&nbsp;</td>
          </tr>
          <tr>
            <th>문의제목:</th>
            <td>
              <input type="text" name="qnatitle" id="qnatitle"/>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="space">&nbsp;</td>
          </tr>
          <tr class="qnatype">
            <th>문의유형:</th>
            <td>
              <select id="qnatype" name="qnatype">
                <option value="QT1">매칭</option>
                <option value="QT2">플래너</option>
                <option value="QT3">회원</option>
                <option value="QT4">기타</option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="space">&nbsp;</td>
          </tr>
          <tr>
            <th>문의내용:</th>
            <td>
              <textarea rows="5" cols="50"  id="qnacontent" name="qnacontent"></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="content_desc">
              <!--상담하시고자 하는 내용을 보내주세요. 빠른시일내에 담당자가 연락드리겠습니다.-->상담하시고자 하는 내용을 보내주세요. 빠른시일내에 담당자가 연락드리겠습니다.<br><br>
              <span style="line-height:20px;font-size:12px;">
                수집 항목 : 회원 아이디<br>
                수집 목적 : 광고/제휴에 대한 처리 및 결과 회신<br>
                보유 및 이용기간 : 수집된 이메일 주소는 관련 법령에 달리 명시되어 있지 않는 한, 문의처리 후 1년간 보관<br>
                그 밖에 사항은 개인정보 처리방침에 대하여 동의하셔야 합니다.<br>
                * 고객님은 동의를 거부하실 수 있으며, 거부 시 문의 등록을 하실 수 없습니다.<br><br>
              </span>
              <input type="checkbox" id="qnasubmitconfirm" name="qnasubmitconfirm"
                style="width:auto;height:auto;cursor:pointer;"><label for="qnasubmitconfirm" style="cursor:pointer;">개인정보
                수집·이용에 대하여 동의합니다.</label>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="space">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">
              <input type="submit" value="보내기" id="submit">
            </td>
          </tr>
        </table>
      </form>
      </div>
    </div>
    <!-- end container-->

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

  </div>
  <!-- end wrap -->

</body>

</html>