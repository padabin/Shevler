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
<title>회원가입</title>
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
<link rel="stylesheet" type="text/css" href="css/join.css">
  
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

      
      	//버튼클릭 시
      	$("#jo_submit").click(function()
	  	{
    	  	if($("#id").val() == "")
    	  	{
    		  	alert("id를 입력해주세요");
    		  	$("#id").focus();
    		  	return false;
    	  	}
    	  	if($("#name").val() =="") 
    	  	{
    		  	alert("이름을 입력해주세요");
    		  	$("#name").focus();
    		  	return false;
    	  	}
    	  	if($("#pw").val() =="") 
    	  	{
    		  	alert("비밀번호를 입력해주세요");
    		  	$("#pw").focus();
    		  	return false;
    	  	}
    	  	if($("#pw2").val() =="") 
    	  	{
    		  alert("비밀번호확인을 입력해주세요");
    		  $("#pw").focus();
    		  return false;
    	  	}
    	  	if($("#rrn").val() =="") 
    	  	{
    		  	alert("주민번호 앞자리를 입력해주세요");
    		  	$("#rrn").focus();
    		  	return false;
    	  	}
    	  	if($("#rrn2").val()=="") 
    	  	{
    		  	alert("주민번호 뒷자리를 입력해주세요");
    		  	$("rrn2").focus();
    		  	return false;
    	  	}
    	  	if($("#email").val() =="") 
    	  	{
    		  	alert("이메일을 입력해주세요");
    		  	$("#email").focus();
    		  	return false;
    	  	}
    	  	if($("#email2").val() =="") 
    	  	{
    		  	alert("이메일주소를 입력해주세요");
    		  	$("#email2").focus();
    		  	return false;
    	  	}
    	  	if($("#tel").val()=="") 
    	  	{
    		  	alert("휴대폰을 입력해주세요.");
    		  	$("#tel").focus();
    		  	return false;
    	  	}
    	  
			//정규식
	    	var idReg = new RegExp(/^[a-z]+[a-z0-9]{5,20}$/g);										//아이디
	    	var pwReg = new RegExp(/^(?=,*[a-zA-Z](?=,*[!@#$%^*+=-])(?=,*[0-9]),{8,16}$/);			//비밀번호
	    	var telReg = new RegExp(/^[0-9]+/g);													//전화번호,주민번호
	    	var mailReg = new RegExp(/^[A-Za-z0-9_\.\+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);			//이메일
	    	var nameReg = new RegExp(/^[가-힣]+$/);													//이름
	    	var buf = new Array(13);																//주민등록번호 배열
	    	  
	    	  
			//유효성 검사...미완성(id,pw,tel,mail,name..)
	    	$("#pw").keyup(function()
			{
	    		alert("gkd");
	 			if(pwReg.test($('$pw').val())) 
	 			{
	 				alert("gkdl");
	 			}			
			});
	    	  
	    	  
	    	//비밀번호 확인
	    	if($("#pw").val() != $("#pw2").val()) 
	    	{
	    		alert("비밀번호가 일치하지않습니다. 다시확인해주세요");
	    		$("#pw").val("");
	    		$("#pw2").val("");
	    		$("#pw2").focus();
	    		return false;
	    	}  
	    	// $("#member_Form").submit();
    	  
	  	}); // end jo_submit - (가입완료버튼 누를경우)
	  
	  	// id 중복검사 Ajax
	  	$("#id_btn").click(function()
		{
			//alert("sdfkjhs");
			if($("#id").val()=="")
			{
				alert("아이디를 입력해야합니다.");
				$("#id").focus();
				return;
			}
	  		ajaxRequest();
		});
	  
	  	//이전 버튼 클릭시 이전페이지로
	  	$("#jo_back").click(function()
	  	{
			location.href = "SignIn_TOSAgree.html";
			
	  	});  //end 이전페이지
    });  
      	
    function ajaxRequest()
	{
		$.post("idajax.action", {id : $("#id").val()}, function(data)
		{
			$("#errMsg").html(data);
			$("#errMsg").css("display", "inline");
		})
	}
</script>

</head>

<body>

<!-- wrap -->
<div id="wrap">
    <!-- header -->
    <div id="header">
      	<!-- top -->
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
      	<!-- navbar -->
      	<nav class="sub_navbar">
	        <!-- logo -->
	        <div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div><!-- end logo -->

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
    
    <div id="content memberContent">
    	<form action="join.action" id="member_Form" name="member_Form" method="post">
      		<div class="wrap wd668">
        		<div class="container memberContainer">
          			<div class="form_txtInput">
            			<h2 class="sub_tit_txt" align="left">회원가입</h2>
            			<p class="exTxt" align="left">회원가입시 필수정보(*)를 반드시 입력해주셔야 합니다.</p>
            			<div class="join_form">
              				<table class="table">
                				<colgroup>
                  					<col width="30%" />
                  					<col width="auto" />
                				</colgroup>
                				<tbody>
                  					<tr>
                    					<th><span>아이디</span></th>
                    					<td>
                    						<input type="text" id="id" placeholder="ID 를 입력하세요." name="id" 
                    						style="width: 300px;">
                    						<button type="button" id="id_btn" class="btn btn-default btn-md">중복확인</button><br><br>
                    						<span id="errMsg" style="font-size: 9pt; color: blue; display: none;"></span><br>
                    						<span id="id_check">아이디는 5~20자의 영문 소문자와 숫자만 사용 가능합니다.</span>
                    					</td>
                  					</tr>
                  					<tr>
                    					<th><span>이름</span></th>
                    					<td>
                    						<input type="text" id="name" placeholder="name을 입력하세요." 
                    						name="name" style="width: 300px;">
											<span id="err" style="color: red; font-weight: bold; display: none;" ></span>
                    					</td>
                  					</tr>
                  					<tr>
                    					<th><span>비밀번호</span></th>
                    					<td>
					                    	<input type="text" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
					                    	<p>비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>
					                    	<!-- 에러메세지 안내.. -->
											<span id="err" style="color: red; font-weight: bold; display: none;"></span>
                    					</td>
                  					</tr>
                  					<tr>
					                    <th><span>비밀번호 확인</span></th>
					                    <td><input type="text" id="pw2" placeholder="비밀번호를 확인하세요">
					                    	<!-- 에러메세지 안내.. -->
											<span id="err" style="color: red; font-weight: bold; display: none;"></span>
										</td>
                  					</tr>
                  					<tr>
					                    <th><span>주민등록번호</span></th>
					                    <td>
					                      	<input type="text" class="rrn" name="rrn" id="rrn" placeholder="">
					                      	<span class="mar10">-</span>
					                      	<input type="text" class="rrn2" name="rrn2" id="rrn2" placeholder="">
					                      	<!-- 에러메세지 안내.. -->
											<span id="err" style="color: red; font-weight: bold; display: none;"></span>
                    					</td>
                  					</tr>
                  					<tr class="email">
                    					<th><span>이메일</span></th>
                    					<td>
					                      	<input type="text" class="email" name="email" id="email" placeholder=""><span class="mar10">@</span>
					                      	<input type="text" class="email email2" name="email2" id="email2" placeholder="">
					                      	<!-- 에러메세지 안내.. -->
											<span id="err" style="color: red; font-weight: bold; display: none;"></span>
                    					</td>
                  					</tr>
                  					<tr>
                    					<th><span>휴대폰 번호</span></th>
                    					<td>
					                    	<input type="text" id="tel" name="tel" placeholder="'-'포함하여 입력해주세요">
					                    	<!-- 에러메세지 안내.. -->
											<span id="err" style="color: red; font-weight: bold; display: none;"></span>
										</td>
                  					</tr>
                				</tbody>
              				</table>
            			</div><!-- join_form E  -->  
            			<div>
	            			<div class="btn_wrap">
	            				<button type="submit" class="jo_btn btn btn-default btn-lg" id="jo_submit">가입완료</button>
		    					<button type="button" class="jo_btn btn btn-default btn-lg" id="jo_back">이전</button>
	           				</div>
          				</div> <!-- form_txtInput E -->
        			</div><!-- container E-->
      			</div><!-- end .container memberContainer --> 
      		</div>
      	</form>
    </div><!-- content E -->
    
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
		            </div><!-- end .snswrap -->
          		</div><!-- end .footerbottom-->
			</div><!-- end .-frame -->
		</div><!-- end .footerinfowrap -->

	</footer><!-- end footer -->

  </div>
  <!-- end wrap -->

</body>

</html>