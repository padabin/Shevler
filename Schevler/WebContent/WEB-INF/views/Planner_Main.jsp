
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>

<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basic</title>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<!--아이콘 링크 -->
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/planner.css">

<style type="text/css">

  .trans-real-detail {border: 1px solid black;}
  
</style>

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
				<div class="logo">
					<a href="#"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획
					</a>
				</div>
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

		<div id="planner_content">
			<div class="sheveler_maps">
				<!-- 지도 생성 위치 -->
				<div id="map" style="width: 100%; height: 100%;"></div>


				<!-- end Naver 지도 기능 -->
			</div>
			<div class="sheveler_leftsidebar">
				<div class="write_schedule">
					<h4>일정 작성</h4>
					<span><%=request.getParameter("title") %> : <b>1</b>일
					
					</span>
					<div class="schedule_calendar"><%=request.getParameter("startdate") %> ~ <%=request.getParameter("enddate") %></div>
				</div>

				<div class="once_time">
					<ul id="once_time_ul">
					<c:forEach var="calDateDays" begin="1" end="${calDateDays }">
						<li data-day="${calDateDays }">${calDateDays }일차</li>					
					</c:forEach>
					</ul>
				</div>

				<div class="mask"></div>
				<div class="create_planner">일정 생성</div>
				
				<c:forEach var="calDateDays" begin="1" end="${calDateDays }">
					<div class="write_schedule_detail" data-daylist="${calDateDays }">
						<h4>장소 선택 목록</h4>
	
						<div class="sortable" data-sortlist="${calDateDays }"></div>
					</div>
				</c:forEach>
				
				
				
			</div>

			<div class="planner_hidebar">
				<div class="xi-angle-left"></div>
			</div>

			<div class="sheveler_area" style="overflow: auto">
				<div class="search_cat_bar">
					<select class="search_select" id="search_select_type">
						<option value="">타입 분류</option>
						<option value="12">관광지</option>
						<option value="14">문화 시설</option>
						<option value="15">축제 / 공연 / 행사</option>
						<option value="25">여행 코스</option>
						<option value="28">레포츠</option>
						<option value="32">숙박</option>
						<option value="38">쇼핑</option>
						<option value="39">음식</option>
					</select> <select class="search_select" id="search_select_area">
						<option value="">지역 선택</option>
						<option value="1">서울</option>
						<option value="2">인천</option>
						<option value="3">대전</option>
						<option value="4">대구</option>
						<option value="5">광주</option>
						<option value="6">부산</option>
						<option value="7">울산</option>
						<option value="8">세종특별자치시</option>
						<option value="31">경기도</option>
						<option value="32">강원도</option>
						<option value="33">충청북도</option>
						<option value="34">충청남도</option>
						<option value="35">경상북도</option>
						<option value="36">경상남도</option>
						<option value="37">전라북도</option>
						<option value="38">전라남도</option>
						<option value="39">제주도</option>

					</select>
				</div>
				<div class="search_bar">
					<input type="text" id="areasearchkeyword" name="areasearchkeyword"
						placeholder="검색어를 입력해주세요." onfocus="this.placeholder=''"
						onblur="this.placeholder='검색어를 입력해주세요.'">
					<div class="xi-search xi-x area_search"></div>
				</div>
				<!-- end search_bar -->

			</div>
			<!-- end sheveler_area -->
		</div>
		<!-- end content -->
	</div>
	<!-- end wrap -->


	<!-- 제이쿼리 -->
	<script type="text/javascript"
		src="http://code.jquery.com/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 제이쿼리 UI -->
	<script type="text/javascript"
		src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!-- Naver 지도 기능 -->
	<!-- Naver Developers에서 발급받은 네이버지도 Application Key 입력  -->
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=f8bi3bf0q2"></script>
	<script type="text/javascript">
      let polyArray = new Array();      // 상세 길찾기 버튼 클릭, 일정 삭제 시 마다 폴리라인 초기화 해주기 위해서 전역변수 + let으로 초기화
        let markerArray = new Array();      // 일정 삭제 시 해당 일정의 마커도 삭제 하기 위해 전역변수 + let으로 초기화
      var mapOptions = {
          center: new naver.maps.LatLng(37.3595704, 127.105399),
          zoom: 10
        };

        var map = new naver.maps.Map('map', mapOptions);

      /*
        var sx = 126.9216765685;  //시작xvar mapOptions = {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 10
      };

      var map = new naver.maps.Map('map', mapOptions);
        var sy = 37.5535075202;   //시작y      // 서울 홍대 러브 뮤지엄
        var ex = 126.6958112268;   //끝x
        var ey = 37.6467926425;   //끝y      // 김포 아트 빌리지
      */



        // Tour API 호출
        // searchDestinationsAJAX();
        // searchStayAJAX();
        
        sortable();

        // 페이지 최초 요청 시 상세일정 객체화 후 액션 처리
        //selectAllDest();

        
        
        
        
        
        
        
        
        
        
        
        //JQuery 파트---------------------------------------------------------------------------
        
        
        
		 // Planner_First 에서 건너온 데이터로 일차 별로 구성하는 부분

        $(document).ready(function () {
        	
        	$('#search_select_type').attr('disabled', true);
        	$('#search_select_type').val("32").prop("selected", true);
        	
        	$('#search_select_area').val("").prop("selected", true);
        	$('#areasearchkeyword').val("");
        	
         
        // 메모 저장, 삭제시 생신
		$(document).on("click", ".save_btn, .delete_btn" , function()
		{
			
			getJSONArray();
		});
  		  	  
		//시간 설정 버튼 클릭 시 일정 별 시간 계산 해주는 기능
		$(document).on("click", ".btn-danger, .hr, .min, .stay-hr, .stay-min", function () {
			
			
			// 클릭 이전의 값 담기
			var selector = this;
			var previous = this.value;
			
			// 현재의 일차
			var day = $('.write_schedule span b').html();
			var length = $(".hr[data-day=" + day + "]").length;
			
	
			
			updateTime(selector ,previous);
    		getJSONArray();

		});// end 시간 설정 업데이트 함수
          


          // header 고정 스크롤 제어
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

          // 왼쪽 사이드바 숨기기 / 보이기
          $('.planner_hidebar').click(function () { // ID가 toggleButton인 요소를 클릭하면
            var state = $('.sheveler_leftsidebar').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'

            if (state == 'block') { // state가 none 상태일경우 
              $('.sheveler_leftsidebar').css('display', 'none');
              $('.planner_hidebar').css('left', '0px');
              $('.xi-angle-left').attr('class', 'xi-angle-right');
            } else { // 그 외에는
              $('.sheveler_leftsidebar').css('display', 'block');
              $('.planner_hidebar').css('left', '20%');
              $('.xi-angle-right').attr('class', 'xi-angle-left');
            }
          });



          // 추가한 장소(2번째 부터) 삭제 기능
          $(document).on("click",".xi-close-min",function(){
        	// 이미 그러진 폴리라인이 있다면 지운다
  			erasePolyLine();
              
              // 마커 지우는 기능
              var num = $(this).closest(".destination").attr("value");		// num 번째 일정
              //console.log(num);
              
              
              var desX = $(this).closest(".destination").children('.x')[0].value;
              var desY = $(this).closest(".destination").children('.y')[0].value;
              //console.log(desX);
              //console.log(desY);
              
              
              for (var i = 0; i < markerArray.length; i++)
  			{
              	if (markerArray[i].position.x == desX && markerArray[i].position.y == desY) // 삭제 버튼 누른 일정의 x,y좌표와  markerArray에 있는 마커의 x,y 좌표가 같다면
  				{
              		console.log(desX);
              		console.log(markerArray[i].position.x);
              		console.log(desY);
              		console.log(markerArray[i].position.y);
              		
  					markerArray[i].setMap(null);
  				}
  				
  			}
              
             
              
              // 실질적 삭제
              $(this).closest(".draggable").remove();
              
              // 최종 삭제 후 재정렬
              reorder();
              // 다시 갱신
              selectAllDest();
          });


          // x일차 선택 레이어 팝업
          $(".once_time").hide();

          $(".write_schedule span").click(function () {
            $(".once_time").show();
            $(".mask").show();
          });

          
          $(".mask").click(function () {
            $(".once_time").hide();
            $(".detail_road_find").hide();
            $(".mask").hide();
            
          });



          
          // 메모 레이어 팝업
          $(document).on("click",".comment",function(){
        	  $(this).siblings(".memo").show();
          });
          
       	   // 메모 레이어 팝업 닫기
          $(document).on("click",".memo i",function(e){  
              
                e.stopPropagation();
                $(this).parent(".memo").hide();
          
          });
          



            // 여행지 상세 정보 팝업창 
        
          $(document).on("click",".info-detail",function(){  
             var contentid = $(this).data('contentid');
              var contenttypeid = $(this).data('contenttypeid');



              var popupX = (document.body.offsetWidth / 2) - (1300 / 2); 
              var popupY= (window.screen.height / 2) - (800 / 2);
              // width, height 계산

              window.open('plannerinfodetail.action?contentid=' + contentid + '&contenttypeid=' + contenttypeid, '', 'status=no, scrollbars=yes height=800, width=1300,  left='+ popupX + ', top='+ popupY);
          });
            
       	  // x일차 선택 기능
          $(".write_schedule_detail").hide();
          $(".write_schedule_detail[data-daylist='1']").show();
          
          
          $(".once_time li").click(function () {
        	
        	// 다른 일차 클릭 시 검색 카테고리 활성화, 지역 초기화, 입력 내용 초기화
          	$('#search_select_type').attr('disabled', false);
        	$("#search_select_type").val("").prop("selected", true);
        	$('#areasearchkeyword').val("");
        	
            // alert("확인");
            var day = $(this).data('day');
            // alert(day);
            //var dd = $('.write_schedule span b').html();

            $('.write_schedule span b').html(day);

            var daylist = $(".write_schedule_detail[data-daylist=" + day + "]").data('daylist');
            
            $(".write_schedule_detail").hide();
            $(".write_schedule_detail[data-daylist=" + day + "]").show();
            
            
            var day = $(".write_schedule_detail[data-daylist=" + day + "] .destination").data('day');
            
            if (day == undefined) {
            	// 검색 리스트 초기화
            	$(".area_card").remove();
            	
            	alert("해당일에  숙박을 선택해주세요");
            	
            	// 다른 일차 클릭 시 검색 카테고리 비활성화, 기본값 지역 서울, 입력 내용 초기화
            	$('#search_select_type').attr('disabled', true);
            	$('#search_select_type').val("32").prop("selected", true);
            	
            	$('#search_select_area').val("1").prop("selected", true);
            	$('#areasearchkeyword').val("");
            	
            	// searchStayAJAX();
			}
            else{
            	// 검색 리스트 초기화
            	$(".area_card").remove();
            }
            


            $(".once_time").hide();
            $(".mask").hide();
          });
          
          
          // 일정 정보 검색 기능
          $(".area_search").click(function() {
        	  $(".area_card").remove();
        	  searchDestinationsAJAX();
		  });
          
         // 일정 정보 검색 엔터 키 기능
		  $("input[name=areasearchkeyword]").keydown(function(key) {
				
			  $(".area_card").remove();
			  if (key.keyCode == 13) {
				  $(".area_card").remove();
				  searchDestinationsAJAX();
			  }

			  
			  });

         

		// 상세 일정 버튼 클릭시 길찾기 API 호출함
		  $(document).on("click", '.detail-trans' ,function()
		  {	  //                             write_schedule_detail
			  // 각 일자의 처음 value						 ↑
			  
			  $('.mask').show();
			  
			  var num = $(this).parent().parent().parent().parent().children('.destination').attr("value");
			  //alert(num);
			  var selector = $(this).next();
			  
			  if (selector.css("display")== "none")
			  {
				  selector.show();
			  }
			  else
			  {
				  selector.hide()
			  }
			  
			  
			  if (parseInt(num) === parseInt($(this).parent().parent().attr("value")) - 1)	
				  	// destination2의 value가   각 일자의 첫번째 일정 value 보다 1클때
			  		// → destination2가 각 일자의 두번째 일정 일 때(각 일자의 첫번째 일정이 ㅎ포함되어있을 때)
		      {
				  //alert("첫번째 상세 길찾기 맞음");
				  
				  
				  var destination1 = $(this).parent().parent().parent().parent().children('.destination');   //각 일자별 첫번째 destination
				  var destination2 = $(this).parent().parent();
				  
				  
				  
				  firDesX = destination1.children('.x')[0].value;
				  firDesY = destination1.children('.y')[0].value;
				  secDesX = destination2.children('.x')[0].value;
				  secDesY = destination2.children('.y')[0].value;
				  
				   console.log(firDesX + ", " + firDesY);
				   console.log(secDesX + ", " + secDesY);
				  
				  // 이미 그러진 폴리라인이 있다면 지운다
				  erasePolyLine();
				  
				  // 길찾기 API AJAX 호출 -> 결과 json 반환
				  var city= searchPubTransPathAJAX(firDesX, firDesY, secDesX, secDesY);
				  console.log(city);
				  
				  // 더미  서울 ~ 서울
				 /// city = JSON.parse('{"result":{"searchType":0,"outTrafficCheck":1,"busCount":10,"subwayCount":1,"subwayBusCount":5,"pointDistance":1872,"startRadius":700,"endRadius":700,"path":[{"pathType":2,"info":{"trafficDistance":1767,"totalWalk":738,"totalTime":22,"payment":1200,"busTransitCount":1,"subwayTransitCount":0,"mapObj":"1265:1:31:36","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"충신동","totalStationCount":5,"busStationCount":5,"subwayStationCount":0,"totalDistance":2505,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1767,"sectionTime":11,"stationCount":5,"lane":[{"busNo":"7025","type":12,"busID":1265}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"충신동","endX":127.006276,"endY":37.574091,"startID":104999,"endID":105316,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":151458,"stationName":"원남동사거리","x":"126.998691","y":"37.575739"},{"index":3,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":4,"stationID":105256,"stationName":"이화동(이화장)","x":"127.003194","y":"37.575993"},{"index":5,"stationID":105316,"stationName":"충신동","x":"127.006276","y":"37.574091"}]}},{"trafficType":3,"distance":139,"sectionTime":2}]},{"pathType":2,"info":{"trafficDistance":1558,"totalWalk":1082,"totalTime":26,"payment":1200,"busTransitCount":1,"subwayTransitCount":0,"mapObj":"1403:1:33:37","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"방송통신대.이화장","totalStationCount":4,"busStationCount":4,"subwayStationCount":0,"totalDistance":2640,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1558,"sectionTime":10,"stationCount":4,"lane":[{"busNo":"109","type":11,"busID":1403},{"busNo":"162","type":11,"busID":1437},{"busNo":"710","type":11,"busID":895}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"방송통신대.이화장","endX":127.002463,"endY":37.578158,"startID":104999,"endID":105248,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":151458,"stationName":"원남동사거리","x":"126.998691","y":"37.575739"},{"index":3,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":4,"stationID":105248,"stationName":"방송통신대.이화장","x":"127.002463","y":"37.578158"}]}},{"trafficType":3,"distance":483,"sectionTime":7}]},{"pathType":2,"info":{"trafficDistance":2903,"totalWalk":1083,"totalTime":29,"payment":1200,"busTransitCount":1,"subwayTransitCount":0,"mapObj":"1498:1:30:36","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"방송통신대.이화장","totalStationCount":6,"busStationCount":6,"subwayStationCount":0,"totalDistance":3986,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":2903,"sectionTime":13,"stationCount":6,"lane":[{"busNo":"601","type":11,"busID":1498}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"방송통신대.이화장","endX":127.002016,"endY":37.577704,"startID":104999,"endID":105231,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"},{"index":3,"stationID":111697,"stationName":"명륜동2가.성균관대입구","x":"126.999493","y":"37.583504"},{"index":4,"stationID":105215,"stationName":"혜화역.서울연극센터(장면총리가옥)","x":"127.001353","y":"37.584168"},{"index":5,"stationID":105230,"stationName":"혜화역.서울대병원입구","x":"127.001858","y":"37.581118"},{"index":6,"stationID":105231,"stationName":"방송통신대.이화장","x":"127.002016","y":"37.577704"}]}},{"trafficType":3,"distance":484,"sectionTime":7}]},{"pathType":2,"info":{"trafficDistance":1767,"totalWalk":738,"totalTime":22,"payment":1100,"busTransitCount":1,"subwayTransitCount":0,"mapObj":"2802063:1:9:14","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"충신동","totalStationCount":5,"busStationCount":5,"subwayStationCount":0,"totalDistance":2505,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1767,"sectionTime":11,"stationCount":5,"lane":[{"busNo":"01A(녹색순환)","type":13,"busID":2802063}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"충신동","endX":127.006276,"endY":37.574091,"startID":104999,"endID":105316,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":151458,"stationName":"원남동사거리","x":"126.998691","y":"37.575739"},{"index":3,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":4,"stationID":105256,"stationName":"이화동(이화장)","x":"127.003194","y":"37.575993"},{"index":5,"stationID":105316,"stationName":"충신동","x":"127.006276","y":"37.574091"}]}},{"trafficType":3,"distance":139,"sectionTime":2}]},{"pathType":3,"info":{"trafficDistance":2028,"totalWalk":1373,"totalTime":35,"payment":1250,"busTransitCount":1,"subwayTransitCount":1,"mapObj":"3:2:328:329@868:1:58:61","firstStartStation":"안국","lastEndStation":"종로5가.효제동.김상옥의거터","totalStationCount":4,"busStationCount":3,"subwayStationCount":1,"totalDistance":3401,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":693,"sectionTime":10},{"trafficType":1,"distance":1000,"sectionTime":7,"stationCount":1,"lane":[{"name":"수도권 3호선","subwayCode":3,"subwayCityCode":1000}],"startName":"안국","startX":126.98548,"startY":37.576563,"endName":"종로3가","endX":126.991841,"endY":37.571635,"way":"종로3가","wayCode":2,"door":"null","startID":328,"endID":329,"startExitNo":"2","startExitX":126.98609631748276,"startExitY":37.57722331652687,"endExitNo":"12","endExitX":126.99285373046234,"endExitY":37.57035406613682,"passStopList":{"stations":[{"index":0,"stationID":328,"stationName":"안국","x":"126.98549","y":"37.576565"},{"index":1,"stationID":329,"stationName":"종로3가","x":"126.991842","y":"37.571657"}]}},{"trafficType":3,"distance":284,"sectionTime":4},{"trafficType":2,"distance":1028,"sectionTime":8,"stationCount":3,"lane":[{"busNo":"140","type":11,"busID":868},{"busNo":"143","type":11,"busID":872},{"busNo":"150","type":11,"busID":878},{"busNo":"160","type":11,"busID":1449},{"busNo":"273","type":11,"busID":941}],"startName":"종로4가.종묘","startX":126.99472,"startY":37.570506,"endName":"종로5가.효제동.김상옥의거터","endX":127.002241,"endY":37.574471,"startID":92693,"endID":105241,"passStopList":{"stations":[{"index":0,"stationID":92693,"stationName":"종로4가.종묘","x":"126.99472","y":"37.570506"},{"index":1,"stationID":92695,"stationName":"종로5가.광장시장","x":"126.998849","y":"37.570766"},{"index":2,"stationID":105238,"stationName":"종로5가.효제초등학교","x":"127.002159","y":"37.572921"},{"index":3,"stationID":105241,"stationName":"종로5가.효제동.김상옥의거터","x":"127.002241","y":"37.574471"}]}},{"trafficType":3,"distance":396,"sectionTime":6}]},{"pathType":3,"info":{"trafficDistance":4889,"totalWalk":990,"totalTime":36,"payment":1250,"busTransitCount":1,"subwayTransitCount":1,"mapObj":"3:2:328:332@1006:1:42:45","firstStartStation":"안국","lastEndStation":"충신동","totalStationCount":7,"busStationCount":3,"subwayStationCount":4,"totalDistance":5879,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":693,"sectionTime":10},{"trafficType":1,"distance":3200,"sectionTime":13,"stationCount":4,"lane":[{"name":"수도권 3호선","subwayCode":3,"subwayCityCode":1000}],"startName":"안국","startX":126.98548,"startY":37.576563,"endName":"동대입구","endX":127.005049,"endY":37.559051,"way":"동대입구","wayCode":2,"door":"null","startID":328,"endID":332,"startExitNo":"2","startExitX":126.98609631748276,"startExitY":37.57722331652687,"endExitNo":"2","endExitX":127.00532861642878,"endExitY":37.55936354483589,"passStopList":{"stations":[{"index":0,"stationID":328,"stationName":"안국","x":"126.98549","y":"37.576565"},{"index":1,"stationID":329,"stationName":"종로3가","x":"126.991842","y":"37.571657"},{"index":2,"stationID":330,"stationName":"을지로3가","x":"126.992629","y":"37.566388"},{"index":3,"stationID":331,"stationName":"충무로","x":"126.994728","y":"37.560997"},{"index":4,"stationID":332,"stationName":"동대입구","x":"127.005635","y":"37.559078"}]}},{"trafficType":3,"distance":200,"sectionTime":3},{"trafficType":2,"distance":1689,"sectionTime":9,"stationCount":3,"lane":[{"busNo":"301","type":11,"busID":1006}],"startName":"장충동.동국대입구","startX":127.005944,"startY":37.560708,"endName":"충신동","endX":127.006293,"endY":37.574478,"startID":105313,"endID":111800,"passStopList":{"stations":[{"index":0,"stationID":105313,"stationName":"장충동.동국대입구","x":"127.005944","y":"37.560708"},{"index":1,"stationID":105358,"stationName":"광희동","x":"127.007763","y":"37.565228"},{"index":2,"stationID":206064,"stationName":"동대문역사문화공원","x":"127.009057","y":"37.567546"},{"index":3,"stationID":111800,"stationName":"충신동","x":"127.006293","y":"37.574478"}]}},{"trafficType":3,"distance":97,"sectionTime":1}]},{"pathType":3,"info":{"trafficDistance":1869,"totalWalk":1489,"totalTime":36,"payment":1250,"busTransitCount":1,"subwayTransitCount":1,"mapObj":"3:2:328:329@1044:1:55:57","firstStartStation":"안국","lastEndStation":"종로6가.동대문종합시장","totalStationCount":3,"busStationCount":2,"subwayStationCount":1,"totalDistance":3358,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":693,"sectionTime":10},{"trafficType":1,"distance":1000,"sectionTime":7,"stationCount":1,"lane":[{"name":"수도권 3호선","subwayCode":3,"subwayCityCode":1000}],"startName":"안국","startX":126.98548,"startY":37.576563,"endName":"종로3가","endX":126.991841,"endY":37.571635,"way":"종로3가","wayCode":2,"door":"null","startID":328,"endID":329,"startExitNo":"2","startExitX":126.98609631748276,"startExitY":37.57722331652687,"endExitNo":"12","endExitX":126.99285373046234,"endExitY":37.57035406613682,"passStopList":{"stations":[{"index":0,"stationID":328,"stationName":"안국","x":"126.98549","y":"37.576565"},{"index":1,"stationID":329,"stationName":"종로3가","x":"126.991842","y":"37.571657"}]}},{"trafficType":3,"distance":284,"sectionTime":4},{"trafficType":2,"distance":869,"sectionTime":7,"stationCount":2,"lane":[{"busNo":"370","type":11,"busID":1044},{"busNo":"720","type":11,"busID":1270},{"busNo":"101","type":11,"busID":755},{"busNo":"103","type":11,"busID":763},{"busNo":"721","type":11,"busID":1259},{"busNo":"262","type":11,"busID":1439},{"busNo":"271A","type":11,"busID":989},{"busNo":"270","type":11,"busID":988},{"busNo":"260","type":11,"busID":1447},{"busNo":"201","type":11,"busID":942}],"startName":"종로4가.종묘","startX":126.99472,"startY":37.570506,"endName":"종로6가.동대문종합시장","endX":127.004539,"endY":37.571004,"startID":92693,"endID":92696,"passStopList":{"stations":[{"index":0,"stationID":92693,"stationName":"종로4가.종묘","x":"126.99472","y":"37.570506"},{"index":1,"stationID":92695,"stationName":"종로5가.광장시장","x":"126.998849","y":"37.570766"},{"index":2,"stationID":92696,"stationName":"종로6가.동대문종합시장","x":"127.004539","y":"37.571004"}]}},{"trafficType":3,"distance":512,"sectionTime":8}]},{"pathType":3,"info":{"trafficDistance":1869,"totalWalk":1489,"totalTime":36,"payment":1250,"busTransitCount":1,"subwayTransitCount":1,"mapObj":"3:2:328:329@518:1:48:50","firstStartStation":"안국","lastEndStation":"종로6가.동대문종합시장","totalStationCount":3,"busStationCount":2,"subwayStationCount":1,"totalDistance":3358,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":693,"sectionTime":10},{"trafficType":1,"distance":1000,"sectionTime":7,"stationCount":1,"lane":[{"name":"수도권 3호선","subwayCode":3,"subwayCityCode":1000}],"startName":"안국","startX":126.98548,"startY":37.576563,"endName":"종로3가","endX":126.991841,"endY":37.571635,"way":"종로3가","wayCode":2,"door":"null","startID":328,"endID":329,"startExitNo":"2","startExitX":126.98609631748276,"startExitY":37.57722331652687,"endExitNo":"12","endExitX":126.99285373046234,"endExitY":37.57035406613682,"passStopList":{"stations":[{"index":0,"stationID":328,"stationName":"안국","x":"126.98549","y":"37.576565"},{"index":1,"stationID":329,"stationName":"종로3가","x":"126.991842","y":"37.571657"}]}},{"trafficType":3,"distance":284,"sectionTime":4},{"trafficType":2,"distance":869,"sectionTime":7,"stationCount":2,"lane":[{"busNo":"7212","type":12,"busID":518}],"startName":"종로4가.종묘","startX":126.99472,"startY":37.570506,"endName":"종로6가.동대문종합시장","endX":127.004539,"endY":37.571004,"startID":92693,"endID":92696,"passStopList":{"stations":[{"index":0,"stationID":92693,"stationName":"종로4가.종묘","x":"126.99472","y":"37.570506"},{"index":1,"stationID":92695,"stationName":"종로5가.광장시장","x":"126.998849","y":"37.570766"},{"index":2,"stationID":92696,"stationName":"종로6가.동대문종합시장","x":"127.004539","y":"37.571004"}]}},{"trafficType":3,"distance":512,"sectionTime":8}]},{"pathType":1,"info":{"trafficDistance":2700,"totalWalk":1250,"totalTime":37,"payment":1250,"busTransitCount":0,"subwayTransitCount":2,"mapObj":"3:2:328:329@11:2:130:128","firstStartStation":"안국","lastEndStation":"동대문","totalStationCount":3,"busStationCount":0,"subwayStationCount":3,"totalDistance":3950,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":693,"sectionTime":10},{"trafficType":1,"distance":1000,"sectionTime":6,"stationCount":1,"lane":[{"name":"수도권 3호선","subwayCode":3,"subwayCityCode":1000}],"startName":"안국","startX":126.98548,"startY":37.576563,"endName":"종로3가","endX":126.991841,"endY":37.571635,"way":"종로3가","wayCode":2,"door":"2-3","startID":328,"endID":329,"startExitNo":"2","startExitX":126.98609631748276,"startExitY":37.57722331652687,"passStopList":{"stations":[{"index":0,"stationID":328,"stationName":"안국","x":"126.98549","y":"37.576565"},{"index":1,"stationID":329,"stationName":"종로3가","x":"126.991842","y":"37.571657"}]}},{"trafficType":3,"distance":0,"sectionTime":0},{"trafficType":1,"distance":1700,"sectionTime":10,"stationCount":2,"lane":[{"name":"수도권 1호선","subwayCode":1,"subwayCityCode":1000}],"startName":"종로3가","startX":126.992185,"startY":37.57043,"endName":"동대문","endX":127.011061,"endY":37.571761,"way":"동대문","wayCode":1,"door":"null","startID":130,"endID":128,"endExitNo":"10","endExitX":127.00816799247147,"endExitY":37.57128852094475,"passStopList":{"stations":[{"index":0,"stationID":130,"stationName":"종로3가","x":"126.992148","y":"37.570436"},{"index":1,"stationID":129,"stationName":"종로5가","x":"127.001948","y":"37.570999"},{"index":2,"stationID":128,"stationName":"동대문","x":"127.010673","y":"37.571688"}]}},{"trafficType":3,"distance":557,"sectionTime":8}]},{"pathType":3,"info":{"trafficDistance":4277,"totalWalk":1122,"totalTime":38,"payment":1250,"busTransitCount":1,"subwayTransitCount":1,"mapObj":"3:2:328:331@771:1:35:41","firstStartStation":"안국","lastEndStation":"종로5가.효제동.김상옥의거터","totalStationCount":9,"busStationCount":6,"subwayStationCount":3,"totalDistance":5399,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":693,"sectionTime":10},{"trafficType":1,"distance":2300,"sectionTime":10,"stationCount":3,"lane":[{"name":"수도권 3호선","subwayCode":3,"subwayCityCode":1000}],"startName":"안국","startX":126.98548,"startY":37.576563,"endName":"충무로","endX":126.994688,"endY":37.561063,"way":"충무로","wayCode":2,"door":"null","startID":328,"endID":331,"startExitNo":"2","startExitX":126.98609631748276,"startExitY":37.57722331652687,"endExitNo":"2","endExitX":126.99493334243978,"endExitY":37.561307012429424,"passStopList":{"stations":[{"index":0,"stationID":328,"stationName":"안국","x":"126.98549","y":"37.576565"},{"index":1,"stationID":329,"stationName":"종로3가","x":"126.991842","y":"37.571657"},{"index":2,"stationID":330,"stationName":"을지로3가","x":"126.992629","y":"37.566388"},{"index":3,"stationID":331,"stationName":"충무로","x":"126.994728","y":"37.560997"}]}},{"trafficType":3,"distance":33,"sectionTime":1},{"trafficType":2,"distance":1977,"sectionTime":11,"stationCount":6,"lane":[{"busNo":"104","type":11,"busID":771}],"startName":"충무로역2번출구.대한극장앞","startX":126.994946,"startY":37.561281,"endName":"종로5가.효제동.김상옥의거터","endX":127.002241,"endY":37.574471,"startID":105107,"endID":105241,"passStopList":{"stations":[{"index":0,"stationID":105107,"stationName":"충무로역2번출구.대한극장앞","x":"126.994946","y":"37.561281"},{"index":1,"stationID":105197,"stationName":"퇴계로5가.제일병원","x":"126.999945","y":"37.562423"},{"index":2,"stationID":105251,"stationName":"을지로5가.훈련원종합체육관","x":"127.002521","y":"37.56613"},{"index":3,"stationID":105246,"stationName":"방산시장.훈련원종합체육관","x":"127.002418","y":"37.567913"},{"index":4,"stationID":105240,"stationName":"종로5가","x":"127.002202","y":"37.570551"},{"index":5,"stationID":105238,"stationName":"종로5가.효제초등학교","x":"127.002159","y":"37.572921"},{"index":6,"stationID":105241,"stationName":"종로5가.효제동.김상옥의거터","x":"127.002241","y":"37.574471"}]}},{"trafficType":3,"distance":396,"sectionTime":6}]},{"pathType":2,"info":{"trafficDistance":2504,"totalWalk":795,"totalTime":29,"payment":1200,"busTransitCount":2,"subwayTransitCount":0,"mapObj":"907:1:69:71@774:1:66:69","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"충신동","totalStationCount":5,"busStationCount":5,"subwayStationCount":0,"totalDistance":3299,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1226,"sectionTime":8,"stationCount":2,"lane":[{"busNo":"171","type":11,"busID":907}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"창경궁.서울대학교병원","endX":126.996861,"endY":37.578868,"startID":104999,"endID":105138,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"}]}},{"trafficType":3,"distance":57,"sectionTime":1},{"trafficType":2,"distance":1278,"sectionTime":9,"stationCount":3,"lane":[{"busNo":"107","type":11,"busID":774}],"startName":"창경궁.서울대학교병원","startX":126.996572,"startY":37.579325,"endName":"충신동","endX":127.006276,"endY":37.574091,"startID":105125,"endID":105316,"passStopList":{"stations":[{"index":0,"stationID":105125,"stationName":"창경궁.서울대학교병원","x":"126.996572","y":"37.579325"},{"index":1,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":2,"stationID":105256,"stationName":"이화동(이화장)","x":"127.003194","y":"37.575993"},{"index":3,"stationID":105316,"stationName":"충신동","x":"127.006276","y":"37.574091"}]}},{"trafficType":3,"distance":139,"sectionTime":2}]},{"pathType":2,"info":{"trafficDistance":2955,"totalWalk":1052,"totalTime":34,"payment":1200,"busTransitCount":2,"subwayTransitCount":0,"mapObj":"879:1:63:65@773:1:45:49","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"종로5가.효제동.김상옥의거터","totalStationCount":6,"busStationCount":6,"subwayStationCount":0,"totalDistance":4007,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1226,"sectionTime":8,"stationCount":2,"lane":[{"busNo":"151","type":11,"busID":879},{"busNo":"171","type":11,"busID":907}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"창경궁.서울대학교병원","endX":126.996861,"endY":37.578868,"startID":104999,"endID":105138,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"}]}},{"trafficType":3,"distance":57,"sectionTime":1},{"trafficType":2,"distance":1729,"sectionTime":10,"stationCount":4,"lane":[{"busNo":"106","type":11,"busID":773}],"startName":"창경궁.서울대학교병원","startX":126.996572,"startY":37.579325,"endName":"종로5가.효제동.김상옥의거터","endX":127.002241,"endY":37.574471,"startID":105125,"endID":105241,"passStopList":{"stations":[{"index":0,"stationID":105125,"stationName":"창경궁.서울대학교병원","x":"126.996572","y":"37.579325"},{"index":1,"stationID":105150,"stationName":"원남동","x":"126.997325","y":"37.574655"},{"index":2,"stationID":92695,"stationName":"종로5가.광장시장","x":"126.998849","y":"37.570766"},{"index":3,"stationID":105238,"stationName":"종로5가.효제초등학교","x":"127.002159","y":"37.572921"},{"index":4,"stationID":105241,"stationName":"종로5가.효제동.김상옥의거터","x":"127.002241","y":"37.574471"}]}},{"trafficType":3,"distance":396,"sectionTime":6}]},{"pathType":2,"info":{"trafficDistance":2955,"totalWalk":1052,"totalTime":34,"payment":1200,"busTransitCount":2,"subwayTransitCount":0,"mapObj":"907:1:69:71@773:1:45:49","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"종로5가.효제동.김상옥의거터","totalStationCount":6,"busStationCount":6,"subwayStationCount":0,"totalDistance":4007,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1226,"sectionTime":8,"stationCount":2,"lane":[{"busNo":"171","type":11,"busID":907}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"창경궁.서울대학교병원","endX":126.996861,"endY":37.578868,"startID":104999,"endID":105138,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"}]}},{"trafficType":3,"distance":57,"sectionTime":1},{"trafficType":2,"distance":1729,"sectionTime":10,"stationCount":4,"lane":[{"busNo":"106","type":11,"busID":773}],"startName":"창경궁.서울대학교병원","startX":126.996572,"startY":37.579325,"endName":"종로5가.효제동.김상옥의거터","endX":127.002241,"endY":37.574471,"startID":105125,"endID":105241,"passStopList":{"stations":[{"index":0,"stationID":105125,"stationName":"창경궁.서울대학교병원","x":"126.996572","y":"37.579325"},{"index":1,"stationID":105150,"stationName":"원남동","x":"126.997325","y":"37.574655"},{"index":2,"stationID":92695,"stationName":"종로5가.광장시장","x":"126.998849","y":"37.570766"},{"index":3,"stationID":105238,"stationName":"종로5가.효제초등학교","x":"127.002159","y":"37.572921"},{"index":4,"stationID":105241,"stationName":"종로5가.효제동.김상옥의거터","x":"127.002241","y":"37.574471"}]}},{"trafficType":3,"distance":396,"sectionTime":6}]},{"pathType":2,"info":{"trafficDistance":2812,"totalWalk":1069,"totalTime":34,"payment":1200,"busTransitCount":2,"subwayTransitCount":0,"mapObj":"879:1:63:65@1006:1:51:55","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"동대문","totalStationCount":6,"busStationCount":6,"subwayStationCount":0,"totalDistance":3881,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1226,"sectionTime":8,"stationCount":2,"lane":[{"busNo":"151","type":11,"busID":879}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"창경궁.서울대학교병원","endX":126.996861,"endY":37.578868,"startID":104999,"endID":105138,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"}]}},{"trafficType":3,"distance":57,"sectionTime":1},{"trafficType":2,"distance":1586,"sectionTime":10,"stationCount":4,"lane":[{"busNo":"301","type":11,"busID":1006}],"startName":"창경궁.서울대학교병원","startX":126.996572,"startY":37.579325,"endName":"동대문","endX":127.008366,"endY":37.571865,"startID":105125,"endID":105369,"passStopList":{"stations":[{"index":0,"stationID":105125,"stationName":"창경궁.서울대학교병원","x":"126.996572","y":"37.579325"},{"index":1,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":2,"stationID":105256,"stationName":"이화동(이화장)","x":"127.003194","y":"37.575993"},{"index":3,"stationID":105316,"stationName":"충신동","x":"127.006276","y":"37.574091"},{"index":4,"stationID":105369,"stationName":"동대문","x":"127.008366","y":"37.571865"}]}},{"trafficType":3,"distance":413,"sectionTime":6}]},{"pathType":2,"info":{"trafficDistance":2812,"totalWalk":1069,"totalTime":34,"payment":1200,"busTransitCount":2,"subwayTransitCount":0,"mapObj":"907:1:69:71@1006:1:51:55","firstStartStation":"창덕궁.우리소리박물관","lastEndStation":"동대문","totalStationCount":6,"busStationCount":6,"subwayStationCount":0,"totalDistance":3881,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":599,"sectionTime":9},{"trafficType":2,"distance":1226,"sectionTime":8,"stationCount":2,"lane":[{"busNo":"171","type":11,"busID":907}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"창경궁.서울대학교병원","endX":126.996861,"endY":37.578868,"startID":104999,"endID":105138,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"}]}},{"trafficType":3,"distance":57,"sectionTime":1},{"trafficType":2,"distance":1586,"sectionTime":10,"stationCount":4,"lane":[{"busNo":"301","type":11,"busID":1006}],"startName":"창경궁.서울대학교병원","startX":126.996572,"startY":37.579325,"endName":"동대문","endX":127.008366,"endY":37.571865,"startID":105125,"endID":105369,"passStopList":{"stations":[{"index":0,"stationID":105125,"stationName":"창경궁.서울대학교병원","x":"126.996572","y":"37.579325"},{"index":1,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":2,"stationID":105256,"stationName":"이화동(이화장)","x":"127.003194","y":"37.575993"},{"index":3,"stationID":105316,"stationName":"충신동","x":"127.006276","y":"37.574091"},{"index":4,"stationID":105369,"stationName":"동대문","x":"127.008366","y":"37.571865"}]}},{"trafficType":3,"distance":413,"sectionTime":6}]},{"pathType":2,"info":{"trafficDistance":3158,"totalWalk":592,"totalTime":34,"payment":1200,"busTransitCount":3,"subwayTransitCount":0,"mapObj":"1691:1:17:21@879:1:63:65@1006:1:51:54","firstStartStation":"중앙중고","lastEndStation":"충신동","totalStationCount":9,"busStationCount":9,"subwayStationCount":0,"totalDistance":3750,"totalWalkTime":-1},"subPath":[{"trafficType":3,"distance":75,"sectionTime":1},{"trafficType":2,"distance":654,"sectionTime":8,"stationCount":4,"lane":[{"busNo":"종로01","type":3,"busID":1691}],"startName":"중앙중고","startX":126.986942,"startY":37.583126,"endName":"아름다운가게.정독도서관","endX":126.985051,"endY":37.57901,"startID":125971,"endID":104931,"passStopList":{"stations":[{"index":0,"stationID":125971,"stationName":"중앙중고","x":"126.986942","y":"37.583126"},{"index":1,"stationID":104936,"stationName":"안국선원.삼거리","x":"126.984998","y":"37.58292"},{"index":2,"stationID":104935,"stationName":"북촌한옥마을입구.정세권활동터","x":"126.984959","y":"37.581596"},{"index":3,"stationID":104933,"stationName":"가회동주민센터","x":"126.984912","y":"37.580081"},{"index":4,"stationID":104931,"stationName":"아름다운가게.정독도서관","x":"126.985051","y":"37.57901"}]}},{"trafficType":3,"distance":321,"sectionTime":5},{"trafficType":2,"distance":1226,"sectionTime":8,"stationCount":2,"lane":[{"busNo":"151","type":11,"busID":879},{"busNo":"272","type":11,"busID":990},{"busNo":"171","type":11,"busID":907},{"busNo":"172","type":11,"busID":909},{"busNo":"601","type":11,"busID":1498}],"startName":"창덕궁.우리소리박물관","startX":126.987905,"startY":37.577224,"endName":"창경궁.서울대학교병원","endX":126.996861,"endY":37.578868,"startID":104999,"endID":105138,"passStopList":{"stations":[{"index":0,"stationID":104999,"stationName":"창덕궁.우리소리박물관","x":"126.987905","y":"37.577224"},{"index":1,"stationID":5007638,"stationName":"창덕궁.돈화문국악당","x":"126.991027","y":"37.577404"},{"index":2,"stationID":105138,"stationName":"창경궁.서울대학교병원","x":"126.996861","y":"37.578868"}]}},{"trafficType":3,"distance":57,"sectionTime":1},{"trafficType":2,"distance":1278,"sectionTime":9,"stationCount":3,"lane":[{"busNo":"301","type":11,"busID":1006},{"busNo":"102","type":11,"busID":767},{"busNo":"107","type":11,"busID":774}],"startName":"창경궁.서울대학교병원","startX":126.996572,"startY":37.579325,"endName":"충신동","endX":127.006276,"endY":37.574091,"startID":105125,"endID":105316,"passStopList":{"stations":[{"index":0,"stationID":105125,"stationName":"창경궁.서울대학교병원","x":"126.996572","y":"37.579325"},{"index":1,"stationID":105204,"stationName":"현대그룹빌딩","x":"127.000682","y":"37.575855"},{"index":2,"stationID":105256,"stationName":"이화동(이화장)","x":"127.003194","y":"37.575993"},{"index":3,"stationID":105316,"stationName":"충신동","x":"127.006276","y":"37.574091"}]}},{"trafficType":3,"distance":139,"sectionTime":2}]}]}}');
					
				  // 팝업창
				  
				  if (selector.attr("value")=="0") {
					  callCityDraw(city, selector,firDesX, firDesY, secDesX,secDesY );
					  selector.attr("value", "1");
				 }
				  	
				  
			  }
			  
			  else				// 그 외의 일정일 때 
			  {
				  var des2Val = parseInt($(this).parent().parent().attr("value"));
				  
				  var destination1 = $('.destination');	
				  var destination2 = $(this).parent().parent();
			
				 
				  firDesX = destination1.children('.x')[des2Val-1].value;	
				  firDesY = destination1.children('.y')[des2Val-1].value;
				  secDesX = destination2.children('.x')[0].value;
				  secDesY = destination2.children('.y')[0].value;
				  
				  console.log(firDesX + ", " + firDesY);
				  console.log(secDesX + ", " + secDesY);
				  
				  // 이미 그러진 폴리라인이 있다면 지운다
				  erasePolyLine();
				  // 길찾기 API AJAX 호출 -> 결과 json 반환
				  var city = searchPubTransPathAJAX(firDesX, firDesY, secDesX, secDesY);
				  
				  
				  // 더미  서울 ~ 부산,firDesX, firDesY, secDesX,secDesY
				  //city = JSON.parse('{"result":{"searchType":1,"busCount":8,"trainCount":10,"airCount":1,"path":[{"pathType":11,"info":{"totalTime":135,"totalPayment":59800,"transitCount":1,"firstStartStation":"서울","lastEndStation":"부산","totalDistance":441700},"subPath":[{"trafficType":4,"trainType":1,"distance":441700,"sectionTime":135,"payment":59800,"trainSpSeatYn":"Y","trainSpSeatPayment":83700,"startName":"서울","endName":"부산","startID":3300128,"endID":3300108,"startX":126.970681,"startY":37.554522,"endX":129.042217,"endY":35.115209}]},{"pathType":11,"info":{"totalTime":135,"totalPayment":60200,"transitCount":1,"firstStartStation":"서울","lastEndStation":"부산","totalDistance":441700},"subPath":[{"trafficType":4,"trainType":1,"distance":441700,"sectionTime":135,"payment":60200,"trainSpSeatYn":"Y","trainSpSeatPayment":84300,"startName":"서울","endName":"부산","startID":3300128,"endID":3300108,"startX":126.970681,"startY":37.554522,"endX":129.042217,"endY":35.115209}]},{"pathType":11,"info":{"totalTime":130,"totalPayment":52900,"transitCount":1,"firstStartStation":"수서","lastEndStation":"부산","totalDistance":399900},"subPath":[{"trafficType":4,"trainType":8,"distance":399900,"sectionTime":130,"payment":52900,"trainSpSeatYn":"N","trainSpSeatPayment":0,"startName":"수서","endName":"부산","startID":3300333,"endID":3300108,"startX":127.104375,"startY":37.485544,"endX":129.042217,"endY":35.115209}]},{"pathType":11,"info":{"totalTime":166,"totalPayment":52500,"transitCount":1,"firstStartStation":"서울","lastEndStation":"구포","totalDistance":425200},"subPath":[{"trafficType":4,"trainType":1,"distance":425200,"sectionTime":166,"payment":52500,"trainSpSeatYn":"Y","trainSpSeatPayment":73500,"startName":"서울","endName":"구포","startID":3300128,"endID":3300032,"startX":126.970681,"startY":37.554522,"endX":128.997288,"endY":35.205366}]},{"pathType":11,"info":{"totalTime":176,"totalPayment":48000,"transitCount":1,"firstStartStation":"영등포","lastEndStation":"부산","totalDistance":432600},"subPath":[{"trafficType":4,"trainType":1,"distance":432600,"sectionTime":176,"payment":48000,"trainSpSeatYn":"Y","trainSpSeatPayment":67200,"startName":"영등포","endName":"부산","startID":3300177,"endID":3300108,"startX":126.907779,"startY":37.515519,"endX":129.042217,"endY":35.115209}]},{"pathType":12,"info":{"totalTime":240,"totalPayment":36000,"transitCount":1,"firstStartStation":"서울고속버스터미널","lastEndStation":"부산종합버스터미널","totalDistance":382645},"subPath":[{"trafficType":5,"distance":382645,"sectionTime":240,"payment":36000,"startName":"서울고속버스터미널","endName":"부산종합버스터미널","startID":4000057,"endID":4000156,"startX":127.005847,"startY":37.50568,"endX":129.095451,"endY":35.284757}]},{"pathType":11,"info":{"totalTime":256,"totalPayment":41000,"transitCount":1,"firstStartStation":"서울","lastEndStation":"구포","totalDistance":425200},"subPath":[{"trafficType":4,"trainType":6,"distance":425200,"sectionTime":256,"payment":41000,"trainSpSeatYn":"N","trainSpSeatPayment":0,"startName":"서울","endName":"구포","startID":3300128,"endID":3300032,"startX":126.970681,"startY":37.554522,"endX":128.997288,"endY":35.205366}]},{"pathType":11,"info":{"totalTime":247,"totalPayment":40100,"transitCount":1,"firstStartStation":"영등포","lastEndStation":"구포","totalDistance":416100},"subPath":[{"trafficType":4,"trainType":6,"distance":416100,"sectionTime":247,"payment":40100,"trainSpSeatYn":"N","trainSpSeatPayment":0,"startName":"영등포","endName":"구포","startID":3300177,"endID":3300032,"startX":126.907779,"startY":37.515519,"endX":128.997288,"endY":35.205366}]},{"pathType":11,"info":{"totalTime":269,"totalPayment":42600,"transitCount":1,"firstStartStation":"서울","lastEndStation":"부산","totalDistance":417400},"subPath":[{"trafficType":4,"trainType":6,"distance":417400,"sectionTime":269,"payment":42600,"trainSpSeatYn":"N","trainSpSeatPayment":0,"startName":"서울","endName":"부산","startID":3300128,"endID":3300108,"startX":126.970681,"startY":37.554522,"endX":129.042217,"endY":35.115209}]},{"pathType":11,"info":{"totalTime":260,"totalPayment":41700,"transitCount":1,"firstStartStation":"영등포","lastEndStation":"부산","totalDistance":432600},"subPath":[{"trafficType":4,"trainType":6,"distance":432600,"sectionTime":260,"payment":41700,"trainSpSeatYn":"N","trainSpSeatPayment":0,"startName":"영등포","endName":"부산","startID":3300177,"endID":3300108,"startX":126.907779,"startY":37.515519,"endX":129.042217,"endY":35.115209}]},{"pathType":12,"info":{"totalTime":260,"totalPayment":36700,"transitCount":1,"firstStartStation":"서울고속버스터미널","lastEndStation":"부산서부버스터미널","totalDistance":382594},"subPath":[{"trafficType":5,"distance":382594,"sectionTime":260,"payment":36700,"startName":"서울고속버스터미널","endName":"부산서부버스터미널","startID":4000057,"endID":4000255,"startX":127.005847,"startY":37.50568,"endX":128.982295,"endY":35.163304}]},{"pathType":12,"info":{"totalTime":255,"totalPayment":36200,"transitCount":1,"firstStartStation":"동서울종합터미널","lastEndStation":"부산종합버스터미널","totalDistance":376893},"subPath":[{"trafficType":5,"distance":376893,"sectionTime":255,"payment":36200,"startName":"동서울종합터미널","endName":"부산종합버스터미널","startID":4000035,"endID":4000156,"startX":127.094062,"startY":37.534393,"endX":129.095451,"endY":35.284757}]},{"pathType":12,"info":{"totalTime":270,"totalPayment":34500,"transitCount":1,"firstStartStation":"서울남부터미널","lastEndStation":"부산서부버스터미널","totalDistance":379740},"subPath":[{"trafficType":6,"distance":379740,"sectionTime":270,"payment":34500,"startName":"서울남부터미널","endName":"부산서부버스터미널","startID":4000022,"endID":4000255,"startX":127.01558,"startY":37.484532,"endX":128.982295,"endY":35.163304}]},{"pathType":11,"info":{"totalTime":305,"totalPayment":27600,"transitCount":1,"firstStartStation":"서울","lastEndStation":"구포","totalDistance":425200},"subPath":[{"trafficType":4,"trainType":3,"distance":425200,"sectionTime":305,"payment":27600,"trainSpSeatYn":"N","trainSpSeatPayment":0,"startName":"서울","endName":"구포","startID":3300128,"endID":3300032,"startX":126.970681,"startY":37.554522,"endX":128.997288,"endY":35.205366}]},{"pathType":12,"info":{"totalTime":300,"totalPayment":37400,"transitCount":1,"firstStartStation":"동서울종합터미널","lastEndStation":"해운대(수도권)시외버스정류소","totalDistance":395182},"subPath":[{"trafficType":6,"distance":395182,"sectionTime":300,"payment":37400,"startName":"동서울종합터미널","endName":"해운대(수도권)시외버스정류소","startID":4000035,"endID":3601724,"startX":127.094062,"startY":37.534393,"endX":129.153299,"endY":35.160965}]},{"pathType":12,"info":{"totalTime":290,"totalPayment":36800,"transitCount":1,"firstStartStation":"서울남부터미널","lastEndStation":"해운대(수도권)시외버스정류소","totalDistance":395842},"subPath":[{"trafficType":6,"distance":395842,"sectionTime":290,"payment":36800,"startName":"서울남부터미널","endName":"해운대(수도권)시외버스정류소","startID":4000022,"endID":3601724,"startX":127.01558,"startY":37.484532,"endX":129.153299,"endY":35.160965}]},{"pathType":12,"info":{"totalTime":280,"totalPayment":34200,"transitCount":1,"firstStartStation":"동서울종합터미널","lastEndStation":"좌천정류소","totalDistance":383722},"subPath":[{"trafficType":6,"distance":383722,"sectionTime":280,"payment":34200,"startName":"동서울종합터미널","endName":"좌천정류소","startID":4000035,"endID":3600864,"startX":127.094062,"startY":37.534393,"endX":129.243192,"endY":35.314767}]},{"pathType":12,"info":{"totalTime":255,"totalPayment":24800,"transitCount":1,"firstStartStation":"동서울종합터미널","lastEndStation":"부산서부버스터미널","totalDistance":376842},"subPath":[{"trafficType":5,"distance":376842,"sectionTime":255,"payment":24800,"startName":"동서울종합터미널","endName":"부산서부버스터미널","startID":4000035,"endID":4000255,"startX":127.094062,"startY":37.534393,"endX":128.982295,"endY":35.163304}]},{"pathType":13,"info":{"totalTime":50,"totalPayment":0,"transitCount":1,"firstStartStation":"김포국제공항","lastEndStation":"김해국제공항","totalDistance":327592},"subPath":[{"trafficType":7,"distance":327592,"sectionTime":50,"payment":0,"startName":"김포국제공항","endName":"김해국제공항","startID":3500001,"endID":3500004,"startX":126.802652,"startY":37.559157,"endX":128.948527,"endY":35.170523}]}]}}');
				  
				  console.log(city);
				  // 팝업창
				  if (selector.attr("value")=="0") {
					  callCityDraw(city, selector,firDesX, firDesY, secDesX,secDesY);
					  selector.attr("value", "1");
				 }
				  
				  
			  }
			  
			  
		  });
//-----*-*--*-*-*-*-*- 추가 -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
		  $(document).on("click", ".trans-detail", function () {
				if($(this).next().next().css("display")=="none")
					$(this).next().next().show();
				else
					$(this).next().next().hide();
		  });
//*--*-*-*-*-*-*-*-*-*-*--*-*--*---*-*-*-*-*-*-*-*-*-*-*-*-*-*
		  
		  $(document).on("click",".decide-time",function(){
              if ($(this).siblings(".setTime").css("display") == "none")
              {
                   $(this).siblings(".setTime").show();
              }
                else
                {
                   $(this).siblings(".setTime").hide();
                }
		  });
		  
		  
		  
		// 버튼 클릭시 팝업 바로 끄기
   		$(document).on("click", ".draw-poly", function()
		{
			$(this).closest('.detail_road_find').hide();
			$(".mask").hide();
		}) ;
		
		// 최종 일정 생성 유효성 검사
		$('.create_planner').click(function()
		{
			// 몇일짜리 여행인지 구하기 li의 갯수 
			var day = $('#once_time_ul li').length;
			
			for (var i = 1; i <= day; i++)
			{
				// 각 일차의 일정이 몇개인지
				var schedulelength =  $('.startHr[data-day='+ i +']').length;
				
				
				for (var j = 0; j < schedulelength; j++)
				{
					var checkTime =  $('.startHr[data-day='+ i +']').eq(j).html();
					
					if (checkTime == "")
					{
						alert(i + "일차에 시간설정을 해주세요.");
						return false;
					}
					
				}
				
			}
			
			
			
			
			var schedule = JSON.stringify(getJSONArray());
			console.log(schedule);
			
			
			
			$.ajax({
				type : "post",
				url : "plannercreateajax.action",
				async : "false",
				data : {schedules : schedule},
				success : function(data)
				{
					location.href= "plannerlist.action";
				},
				error : function()
				{
					alert("오류");	
				}
			});
			
			
		}); // END 최종 일정 생성 유효성 검사
		

	
		
		
		
		// 현재 일차 시간 업데이트 함수
		function updateTime(selector, previous) {
			
			
			
			
			// 현재의 일차
			var day = $('.write_schedule span b').html();

			// 현재일차의 시작시간(시, 분)
			var startHr = $('.stay-hr[data-day=' + day + ']').val();
			var startMin = $('.stay-min[data-day=' + day + ']').val();


			var length = $(".hr[data-day=" + day + "]").length;

			
			for (var i = 0; i < length; i++) {	


				// 각 일차의 첫번째 장소 시간 계산

				if (i == 0) {
					// 사용자가 선택한 시간(시, 분)
					var hr = $(".hr[data-day=" + day + "]").eq(i).val();
					var min = $(".min[data-day=" + day + "]").eq(i).val();

					// 현재일차의 종료시간(시, 분)
					var endHr = "";
					var endMin = "";

					// 시작 시간과 내가 설정한 시간 더하기
					endHr = parseInt(startHr) + parseInt(hr);
					endMin = parseInt(startMin) + parseInt(min);

					// 하루가 넘어가면 다시 00시부터 시작
					

					if (endMin >= 60) {
						endMin -= 60
						endHr += 1;
					}
					
					
				
					// 스케줄별 시작시간설정
					$('.startHr[data-day=' + day + ']').eq(i).html(startHr);
					$('.startMin[data-day=' + day + ']').eq(i).html(startMin);

					// 스케줄별 종료시간설정
					$('.endHr[data-day=' + day + ']').eq(i).html(endHr);
					$('.endMin[data-day=' + day + ']').eq(i).html(endMin);




					// 한자리 숫자인지 두자리 숫자인지 판별 후 앞에 0붙이기
					// 시작일 시 
					var startHrlength = $('.startHr[data-day=' + day + ']').eq(i).html().length
					if (startHrlength == 1)
						$('.startHr[data-day=' + day + ']').eq(i).prepend('0');
					// 시작일 분
					var startMinlength = $('.startMin[data-day=' + day + ']').eq(i).html().length
					if (startMinlength == 1)
						$('.startMin[data-day=' + day + ']').eq(i).prepend('0');
					// 종료일 시
					var endHrlength = $('.endHr[data-day=' + day + ']').eq(i).html().length
					if (endHrlength == 1)
						$('.endHr[data-day=' + day + ']').eq(i).prepend('0');
					// 종료일 분
					var endMinlength = $('.endMin[data-day=' + day + ']').eq(i).html().length
					if (endMinlength == 1)
						$('.endMin[data-day=' + day + ']').eq(i).prepend('0');
				}
				
				// 숙박 선택 이후 장소 시간 계산
				else {		

					
					// 사용자가 선택한 시간(시, 분)
					var hr = $(".hr[data-day=" + day + "]").eq(i).val();
					var min = $(".min[data-day=" + day + "]").eq(i).val();								

					// 현재일차의 종료시간(시, 분)
					var endHr = "";
					var endMin = "";


					// 이전 스케줄의 종료 시간(시, 분)
					var prevEndHr = parseInt($('.endHr[data-day=' + day + ']').eq(i - 1).html());
					var prevEndMin = parseInt($('.endMin[data-day=' + day + ']').eq(i - 1).html());
					
					
					
					
					
					// 걸리는 시간(분)
					var takenTime = $('.takenTime[data-day='+ day +']').eq(i-1).text();
				    
					// 1시간 이상시 몫을 구해 몇시간 인지 구하기
					var takenTimeHr = parseInt(takenTime / 60);
				    
					// 그 몫의 나머지를 구함
					var takenTimeMin = takenTime - (takenTimeHr * 60);
					
					
					// 스케줄별 시작시간(시,분)									
					// 스케줄별 시작(시)
					var startHr = parseInt(prevEndHr) + parseInt(takenTimeHr);									
					
					// 스케줄별 시작(분)
					var startMin = parseInt(prevEndMin) + parseInt(takenTimeMin);

					
					// 시작일의 분이 60분 이상으로 넘어게되면 1시간 +
					if (startMin >= 60)
					   {
							startHr += parseInt(startMin/60);
						    startMin -= parseInt(startMin/60)*60;
					   }
					
					// 각일정의 종료시간과 다음일정의 시작시간을 비교
					

					
					
					// 스케줄별 종료시간(시,분)						
					// 스케줄별 종료(시)
					var endHr = parseInt(startHr) + parseInt(hr);
					
					// 스케줄별 종료(분)
					var endMin = parseInt(startMin) + parseInt(min);



					
					

					// 종료일의 분이 60분 이상으로 넘어게되면 1시간 +
					   if (endMin >= 60)
					   {
							endHr += parseInt(endMin/60);
							endMin -= parseInt(endMin/60)*60;
					   }
					
					    if (endHr >= 24)
						{
							endHr -= 24;
						}

					
						if (startHr >= 24)
						{
							
							
							if (selector == $('.min')[i-1])
							{
								$(selector).val(previous-10);
								$('.endMin[data-day=' + day + ']').eq(i - 1).html(parseInt(prevEndMin)-10);

							}
							
							if (selector == $('.stay-min')[0])
							{
								
								$(selector).val(previous-10);
								$('.endMin[data-day=' + day + ']').eq(i - 1).html(parseInt(prevEndMin)-10);

							}
							
							else
							{
								if (selector == $('.stay-hr')[0])
								{
									
									$(selector).val(previous - 1);
									
									
									
									var prevStartHr = $('.startHr[data-day=' + day + ']').eq(i - 1).html();
									prevStartHr = prevStartHr.replace(/(^0+)/, "");
									
									

									if (prevStartHr < 10)
									{
										$('.startHr[data-day=' + day + ']').eq(i - 1).html("0" + (parseInt(prevStartHr)-1));
									}
									else
									{
										$('.startHr[data-day=' + day + ']').eq(i - 1).html((parseInt(prevStartHr)-1));
									}
									
									$('.endHr[data-day=' + day + ']').eq(i - 1).html(parseInt(prevEndHr)-1);

								}
								
								if (selector == $('.hr')[i-1])
								{
									$(selector).val(previous - 1);
									$('.endHr[data-day=' + day + ']').eq(i - 1).html(parseInt(prevEndHr)-1);										
								}
								
								
												
							}
							

							return false;
						}
						

					
					// 스케줄별 시작시간설정
					$('.startHr[data-day=' + day + ']').eq(i).html(startHr);
					$('.startMin[data-day=' + day + ']').eq(i).html(startMin);
					
					
					// 스케줄별 종료시간설정
					$('.endHr[data-day=' + day + ']').eq(i).html(endHr);
					$('.endMin[data-day=' + day + ']').eq(i).html(endMin);


					// 한자리 숫자인지 두자리 숫자인지 판별 후 앞에 0붙이기
					// 시작일 시 
					var startHrlength = $('.startHr[data-day=' + day + ']').eq(i).html().length
					if (startHrlength == 1)
						$('.startHr[data-day=' + day + ']').eq(i).prepend('0');
					// 시작일 분
					var startMinlength = $('.startMin[data-day=' + day + ']').eq(i).html().length
					if (startMinlength == 1)
						$('.startMin[data-day=' + day + ']').eq(i).prepend('0');
					// 종료일 시
					var endHrlength = $('.endHr[data-day=' + day + ']').eq(i).html().length
					if (endHrlength == 1)
						$('.endHr[data-day=' + day + ']').eq(i).prepend('0');
					// 종료일 분
					var endMinlength = $('.endMin[data-day=' + day + ']').eq(i).html().length
					if (endMinlength == 1)
						$('.endMin[data-day=' + day + ']').eq(i).prepend('0');


				}

			}
			
		}
		// 현재 일차 시간 업데이트 함수 끝
		
		
        });
        // end ready(function())  JQuery 파트 끝

        // 상세일정 JSON에 저장 후 배열에 담고  그 후 의 액션 처리 함수   → !!!!!호출 시기!!!! ※ 페이지 최초 요청, 드래그 끝날 때 마다, 장소 추가마다 매번 호출 !!!!!!!!!!!!!!!!1
        function selectAllDest() 
        {
             var destinations = getJSONArray();
             //-------------------------------------------------------------------------------------------
             
             
             // 배열 구성 끝난 후 액션 (ajax를 통해 스케쥴 간 시간 계산) --------------------------------
             
             for (var i = 0; i < destinations.length-1; i++)  // 前장소 後장소  1,2 2,3 3,4 .... n-1,n 반복하며 소요시간 갱신
             {      
                
	              //var firstName = destinations[i].name;
	              var firstDesX = destinations[i].x;
	              var firstDesY = destinations[i].y;
	              //var secondName = destinations[i+1].name;
	              var secondDesX = destinations[i+1].x;
	              var secondDesY = destinations[i+1].y; 
              
            
            
              
              
              
	              if (destinations[i].day  === destinations[i+1].day) // 첫번째 두번째 장소의날짜가 같을 경우에만
	              {
	            	
	                  
	            	  totalTimeAJAX(firstDesX, firstDesY,secondDesX, secondDesY, i+1);	// 시간 계산
	                  
				  }
              
              
      
             }
           
            
             
          }// end selectAllDest


        //----------------------------------------------------------------------------------------------
        
        
        
        
        
        function getJSONArray()
		{
        	var xValues = $('.destination .x');
            var yValues = $('.destination .y');
            var destNames = $('.destination .schedule_choice_area .dest_name')
            var day = $('.destination .day');
            var startHr = $('.destination .startHr');
            var startMin = $('.destination .startMin');
            var endHr = $('.destination .endHr');
            var endMin = $('.destination .endMin');
            var detailmemo = $('.destination .detailmemo')
            var isFirst = $('.destination .isFirst');
            var destImgSrcs = $('.destination .schedule_choice_area .choice_area_content .choice_area_image img');
            
            var destinations = new Array();      // 각 상세 일정 담을 배열
            
            
            //------------------------------------------------------------------------------------
            for (var i = 0; i < xValues.length; i++)  // destinations 배열 구성하는 반복문
            {
              var destinationXY = new Object();
              destinationXY.name = destNames[i].innerHTML.trim();      // 장소 이름
              destinationXY.x = xValues[i].value;                  // 장소 x
              destinationXY.y = yValues[i].value;                  // 장소 y
              destinationXY.day = day[i].value;
              destinationXY.startTime = startHr[i].innerHTML +  ":" + startMin[i].innerHTML;
              destinationXY.endTime = endHr[i].innerHTML +  ":" + endMin[i].innerHTML;
              destinationXY.memo = detailmemo[i].value;
              destinationXY.isFirst = isFirst[i].value;
              destinationXY.imgSrc = destImgSrcs[i].src;
              destinationXY.num = String(i);
              
              
              destinations.push(destinationXY);
            }
            
            
            return destinations;
		}
        
        
        
        
        
        
        
        
        // Tour API 호출 함수

       // 걸리는 시간 계산하는 AJAX
        function totalTimeAJAX(fX, fY, sX, sY, index) //두번쨰장소 index
        {
         
          var totalTime;
          //ODsay apiKey 입력
          var url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX=" + fX + "&SY=" + fY + "&EX=" + sX + "&EY=" + sY + "&apiKey=Ts9gF0UZn72C1egPNrd94hargxtwCgxC5w91CKJMAEo"; //대중교통 길찾기
          
          $('.mask').show();
          setTimeout(function() {
          $.ajax({
        	  url : url,
        	  type : "GET",
        	  dataType: "json",
        	  async: false,
        	  success : function(result)
			  {
        		  
        		  console.log(result);
        		  if (result.error != null) 
        		  {
        			  totalTime = "경로데이터가 존재하지 않습니다";
				  }
        		  else
        		  {
        			  totalTime = result.result.path[0].info.totalTime;
        			  
        		  }
        		 
  				  //console.log(result);
        		  var dest = $('.destination[value="' + index + '"]');

        		  //console.log(dest);
        		  dest.find('.takenTime')[0].innerHTML = totalTime;
			  },
			  error : function()
			  {
				  console.log("시간 계산 오류!");
				  console.log( "※오류\n첫번째 장소 : "  +findPlaceByXY(fX,fY));
				  console.log("두번째 장소 : "+findPlaceByXY(sX,sY));
			  },
        	  
          });   
          
          $('.mask').hide();
          }, 0);
        }
           
         
        
        
        // 검색기능 API 요청
         function searchDestinationsAJAX() {

            var xhr = new XMLHttpRequest();
            var keyword = $("#areasearchkeyword").val();
            var area = $("#search_select_area option:selected").val();
            var type = $("#search_select_type option:selected").val();
           
            if (type == "") {
				alert("타입을 선택해주세요.");
				return;
			}
            
            if (area == "") {
				alert("지역을 선택해주세요.");
				return;
			}            
            
            if (keyword.length < 2) {
				alert("키워드는 2자 이상 입력해주세요.");
				return;
			}            

            var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=AAvaIxXU38CYgUe5yqeCMMOyvseXq4X3OCf36Q%2FX7e9QZnY9CrNlkX9AxKp5BxTQ5%2BnWmdVMu6mCjfCmjOV%2FWQ%3D%3D&keyword="+ keyword + "&areaCode="+ area +"&contentTypeId="+ type +"&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json"
            
           	
            
            xhr.open("GET", url, true);
            xhr.send();
            xhr.onreadystatechange = function () {
              if (xhr.readyState == 4 && xhr.status == 200) {
                var result = JSON.parse(xhr.responseText); // 
                var myItem = result.response.body.items.item;

                 // for (var i = 0; i < myItem.length; i++) {
                  //var pageNo = result.response.body.pageNo;         // 요청 페이지
              //var imgSrc = result.response.body.firstimage;
              //var title = result.response.body.title;
                  //var totalCount = result.response.body.totalCount;   // ex)437
                  //var contentsPerPage = result.response.body.numOfRows;      // 한페이지에 가져올 데이터 갯수
              for(i=0; i < myItem.length; i++) {
                 	 var contentid = myItem[i].contentid;
                     var contenttypeid = myItem[i].contenttypeid;
                     var imgsrc = myItem[i].firstimage;  // 이미지 경로
                     var title = myItem[i].title;      // 장소 이름
                     var mapx = myItem[i].mapx;
                     var mapy = myItem[i].mapy;
                     var rtitle = title.replace(/ /gi, "%20");
                     
                     //console.log(imgsrc);
                     //alert(mapx);
                     //alert(mapy);
                     //var title
                     // var overview = myItem[i].overview;
                     //console.log(imgSrc);
                     //console.log(contentid);
                     //console.log(contenttypeid);
                     //console.log(overivew);
                     
                     $('.sheveler_area').append(
                             '<div class="area_card">' + 
                                '<div class= "area_card_img">' + 
                                    '<img src=' + imgsrc + ' onerror="this.style.display=\'none\'; ">' + 
                                '</div>' + 
                                '<div class="area_card_desc">' + 
                                     title +
                                '</div>' + 
                                '<div class="add_details">' +
                                    '<div class="xi-plus plusdest" data-contentid=' + contentid + ' data-contenttypeid=' + contenttypeid +' data-mapx=' + mapx + ' data-mapy=' + mapy + ' data-title=' +  rtitle + ' data-imgsrc=' + imgsrc + '></div>' +
                                '<div class="xi-zoom-in info-detail" data-contentid=' + contentid + ' data-contenttypeid=' + contenttypeid +'></div></div></div>');
                   
                    
                     //console.log(pageNo);
                     //console.log(title);
                     //console.log(contentsPerPage);



                   //}
              }
                  

              }
            }
          }



      		
      		
      		 
      		 
      		 
      		 
	 			// 일정 추가 (첫번째 : 숙박만 들어감 그 이후로는 모두 가능)
      		 
				$(document).on("click", ".plusdest", function () {
					// alert("호출확인");
					// updateTime();
					

					// 현재 선택된 날짜 가져오기
					var day = $('.write_schedule span b').html();


					var length = $(".hr[data-day=" + day + "]").length;

					// 각 일정의 종료일의 시간(시, 분)을 가져오기
					var prevStartHr = $('.startHr[data-day=' + day + ']').eq(length - 1).html();

					var prevEndHr = $('.endHr[data-day=' + day + ']').eq(length - 1).html();
					var prevEndMin = $('.endMin[data-day=' + day + ']').eq(length - 1).html();

					if(parseInt(prevEndHr) == 0 )
					{
						prevEndHr += 24;
					}
					
					// 이전 시작일이 종료일보다 크다면(해당 스케줄이 다음 날짜로 넘어갔으면)
					if (prevEndHr >= 24) {
						alert("해당 스케줄은 11시 59분 이후로 등록할 수 없습니다.");
						return false;
					}




					var contentid = $(this).data('contentid');
					var contenttypeid = $(this).data('contenttypeid');

					// 좌표 값
					var mapx = $(this).data('mapx');
					var mapy = $(this).data('mapy');
					// 장소 이름
					var title = $(this).data('title');



					// 첫 장소에 호텔이 있는지 없는지 확인 구문
					var day2 = $(".write_schedule_detail[data-daylist=" + day + "] .destination").data('day');


					title = title.replace(/%20/gi, " ");

					// 장소 사진
					var imgsrc = $(this).data('imgsrc');




			         // 현재 첫 장소가 존재하지 않을 때
		            if (day2 == undefined) {
		               
		               // alert("없음");

		                // 날짜별 첫번쨰 장소가 들어가는 기능
		                $(".write_schedule_detail[data-daylist=" + day + "] h4").after(
		               
		                   
		                      '<div class="destination" data-day="' +day + '" data-areaval="1" >'
		                      + '<input type="hidden" class="x" value='+ mapx +' />'
		                      + '<input type="hidden" class="y" value='+ mapy +' />'
		                      + '<input type="hidden" class="day" value='+ day +' />'
		                      + '<input type="hidden" class="isFirst" value="1" />'
		                      + '<div class="schedule_choice_area start-point">'
		                         <!-- 장소 0번 →시작 장소 -- 드래그로 위치변경 불가능 -->
		                         + '<span class="dest_name">'+ title +' </span> <br>'
		                         + '<div class="choice_area_content">'
		                            + '<div class="choice_area_image">'
		                               + '<img src='+ imgsrc +'>'
		                            + '</div>' <!-- end choice_area_image -->
		                            + '<div class="coice_area_time">'
		                            + '<div class="xi-alarm-o"></div>'
		                            + '<input type="number" style="width:40px;" class="hr" data-day='+ day +'  value="1" min="0" max="23"/>시간<input type="number" style="width:40px;" class="min" data-day='+ day +' value="0" min="0" max="59" step="10"/>분'
		                            + '<button class="decide-time btn btn-warning" style="width: 80px; height:35px;">일일 시작</button>'
		                            + '<br /><br />'
		                            <!-- 시간설정 레이어 토글-->
		                             
		                            + '<div class="setTime" style="display:none;">'
		                            + '<form>'
		                            + '<table class="table" id="table">'
		                               + '<tbody>'
		                                  + '<tr><th colspan="2">일일 시작</th></tr>'
		                                  + '<tr><td colspan="2">'
		                                  + '<input type="number" style="width:40px;" class="stay-hr" data-day='+ day +'  value="8" min="0" max="23"/>시'
		                                  + '<input type="number" style="width:40px;" class="stay-min" data-day='+ day +' value="0" min="0" max="59" step="10"/>분'
		                                  + '</td></tr>'
		                               + '</tbody>'
		                            + '</table>'
		                            + '<br>'
		                            + '<button type="button" class="btn save_btn btn-danger">설정</button>'
		                            + '</form>'
		                            + '</div>' <!-- end 시간설정 레이어 -->
		                            + '<p>'
		                            + '시작 <span class="startHr" data-day=' + day + '></span>:<span class="startMin" data-day=' + day + '></span> ~ 종료 <span class="endHr" data-day=' + day + '></span>:<span class="endMin" data-day=' + day + '></span>'
		                            + '</p>'
		                            + '<a class="comment"><i class="xi-comment-o xi-x"></i>메모</a>'
		                            
		                            + '<div class="memo">'<!-- 메모 레이어 팝업-->
		                               + '<i class="xi-close"></i>'
		                               + '<form><table class="table" id="table">'
		                               + '<tbody>'
		                               + '<tr><th colspan="2">메모</th></tr>'
		                               + '<tr><td colspan="2"><textarea class="detailmemo" id="detailmemo" name="detailmemo" rows="4" cols="4"></textarea></td></tr>'
		                               + '</tbody>'
		                               + '</table><br>'
		                               + '<button type="button" class="btn save_memo_btn">저장하기</button><button type="reset" class="btn delete_btn">비우기</button>'
		                               + '</form>'
		                            + '</div>' <!-- end 메모 팝업창 -->
		                            
		                            + '</div>' <!-- end coice_area_time -->
		                             
		                         + '</div>' <!-- end choice_area_content -->
		                      + '</div>'<!-- end schedule_choice_area start-point-->
		                   + '</div>'<!-- end destination -->
		                
		                );
		                
		                
		                reorder();
		                drawNaverMarker(mapx, mapy);
		                selectAllDest();
		                
		                
		               $('#search_select_type').attr('disabled', false);
		               $("#search_select_type").val("").prop("selected", true);
		               
		                $(".area_card").remove();
		               
		         }
					// 현재 첫 장소가 존재할 때
					else {
						// alert("있음");






						$('.sortable[data-sortlist=' + day + ']').append(
							'<div class="destination draggable ui-sortable-handle">'
							+ '<div class="transit_time">'
							+ '   <div class="xi-time-o"></div>'
							+ '   <span class="takenTime" data-day =' + day + '></span>분'
							+ '   <button class="btn btn-primary detail-trans"'
							+ '      style="width: 73px; height: 32px">'
							+ '      <span style="font-size: 1pt;">상세 길찾기</span>'
							+ '   </button>'
							+ '   <div class="detail_road_find" value="0" style="display:none;">'
							+ '   </div>'

							+ '</div>'

							+ '<input type="hidden" class="x" value=' + mapx + ' />'
							+ '<input type="hidden" class="y" value=' + mapy + ' />'
							+ '<input type="hidden" class="day" value='+ day +' />'
							+ '<input type="hidden" class="isFirst" value="0" />'
							

							+ '<div class="schedule_choice_area">'

							+ '   <span class="dest_name">' + title + ' </span> <br>'
							+ '   <div class="xi-close-min xi-x"></div>'
							+ '   <div class="choice_area_content">'
							+ '      <div class="choice_area_image">'
							+ '         <img'
							+ '            src=' + imgsrc + '>'
							+ '      </div>'

							+ '      <div class="coice_area_time">'
							+ '         <div class="xi-alarm-o"></div>'
							+ '         <input type="number" style="width: 40px;" class="hr" data-day=' + day + ' value="1"'
							+ '            min="0" max="23" />시간<input type="number"'
							+ '            style="width: 40px;" class="min" data-day=' + day + ' value="0" min="0" max="59"'
							+ '            step="10" />분'
							+ '         <p>'
							+ '            시작 <span class="startHr" data-day=' + day + '></span>:<span class="startMin" data-day=' + day + '></span> ~ 종료 <span class="endHr" data-day=' + day + '></span>:<span class="endMin" data-day=' + day + '></span>'
							+ '         </p>'
							+ '         <a class="comment"><i class="xi-comment-o xi-x"></i>메모</a>'


							+ '         <div class="memo">'
							+ '            <i class="xi-close"></i>'
							+ '            <form>'
							+ '               <table class="table" id="table">'
							+ '                  <tbody>'
							+ '                     <tr>'
							+ '                        <th colspan="2">메모</th>'
							+ '                     </tr>'
							+ '                     <tr>'
							+ '                        <td colspan="2"><textarea class="detailmemo"'
							+ '                              id="detailmemo" name="detailmemo"></textarea></td>'
							+ '                     </tr>'
							+ '                  </tbody>'
							+ '               </table>'
							+ '               <br>'

							+ '               <button type="button" class="btn save_btn">저장하기</button>'
							+ '               <button type="reset" class="btn delete_btn">비우기</button>'
							+ '            </form>'
							+ '         </div>'

							+ '      </div>'

							+ '   </div>'

							+ '</div>'

							+ '</div>'

						);



						reorder();
						sortable();
						drawNaverMarker(mapx, mapy);
						selectAllDest();
								
					}
					
				});



				//------------------------------------------------------------------------------------------

        //Odsay API 호출 함수 -- 호출 시기 -- 상세 길찾기 버튼 눌렀을 때
        function searchPubTransPathAJAX(sx,sy,ex,ey) 
        {
          //ODsay apiKey 입력
          var url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX=" + sx + "&SY=" + sy + "&EX=" + ex + "&EY=" + ey + "&apiKey=Ts9gF0UZn72C1egPNrd94hargxtwCgxC5w91CKJMAEo"; //대중교통 길찾기
          var jsonTest;
          
          
          /* $('.mask').show();
          setTimeout(function() { */
			
        	  $.ajax({
            	  url : url,
            	  type : "GET",
            	  dataType: "json",
            	  async : false,
            	  success : function(result)
    			  {
            		 
                    	  jsonTest = result;
                      
                      
    			  },
    			  error : function()
    			  {
    				  console.log("길찾기 오류 !");
    				  console.log( "※오류\n첫번째 장소 : "  +findPlaceByXY(sx,sy));
    				  console.log("두번째 장소 : "+findPlaceByXY(ex,ey));
    			  },
            	  
              });  
        	  
        /* 	  
          $('.mask').hide();
          }, 0); */
          
          
          return jsonTest;
          
          
          
        }












        // -- 도시내 길찾기>  mabObj(AJAX 호출 결과물 JSON["result"]["path"][0].info.mapObj)을 받고 + (나중에 삭제) 시작xy 끝xy를 넘겨 마커찍는 함수
        function callMapObjApiAJAX(mabObj, sx,sy,ex,ey ) 
        {
        	erasePolyLine();
          //ODsay apiKey 입력
          var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@" + mabObj + "&apiKey=Ts9gF0UZn72C1egPNrd94hargxtwCgxC5w91CKJMAEo"; // 노선 그래픽 데이터 검색
         
          $('.mask').show();
          setTimeout(function() {
			
        	  $.ajax({
            	  url : url,
            	  type : "GET",
            	  dataType: "json",
            	  async: false,
            	  success : function(resultJsonData)
    			  {
            		  
            		  
                      var walkArray = drawNaverPolyLine(resultJsonData);      // 노선그래픽데이터(polyline) 배열에 담기
                      var polyline1 = new naver.maps.Polyline({
                    	    map: map,
                    	    path: [
                    	    	new naver.maps.LatLng(walkArray[1].y, walkArray[1].x),
                    	    	new naver.maps.LatLng(ey, ex),
                    	      
                    	    ],
                    	    strokeWeight: 3,
                            strokeColor: ' #000'
                    	});
                      polyArray.push(polyline1);
                      
                      var polyline2 = new naver.maps.Polyline({
                    	    map: map,
                    	    path: [
                    	    	new naver.maps.LatLng(sy, sx),
                    	    	
                    	    	new naver.maps.LatLng(walkArray[0].y, walkArray[0].x),
                    	    ],
                    	    strokeWeight: 3,
                            strokeColor: ' #000'
                    	});
                      	polyArray.push(polyline2);
                      	
                      console.log(walkArray);
                      // boundary 데이터가 있을경우, 해당 boundary로 지도이동
                      if (resultJsonData.result.boundary) {
                        var boundary = new naver.maps.LatLngBounds(
                          new naver.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
                          new naver.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
                        );
                        map.panToBounds(boundary);
                      }
    			  },
    			  error : function()
    			  {
    				  console.log("노선 그래픽 데이터 검색 오류!");
    				  console.log( "※오류\n첫번째 장소 : "  +findPlaceByXY(fX,fY));
    				  console.log("두번째 장소 : "+findPlaceByXY(sX,sY));
    			  },
            	  
              });	  
        	  
        	  
          $('.mask').hide();
          }, 0);
          
          

        }







        // 지도위 마커 표시 + 해당 마커 클릭시 툴팁 표시해주는 함수			// ※※현재는 길찾기(callMapObjApiAJAX)에 호출하나 추후에는 장소 추가 시에 호출로 변경
        function drawNaverMarker(x, y) 
        {
	          var marker = new naver.maps.Marker({
	            position: new naver.maps.LatLng(y, x),
	            map: map,
	
	          });
	          
	         
			  addInfoWindow(x, y, marker);
			  
			  
			  
			  
			  
			  markerArray.push(marker);			// 추가되는 순서대로 markerArray에 push됨. -- 추가 시 마커 찍기 기능 구현 후 제거 가능					
			  
        }

        function addInfoWindow(x, y, marker)
		{
        	  var place = findPlaceByXY(x,y);
			  var imgSrc = findImgByXY(x,y);
			  var contentString = [
				  '<div class="iw_inner">',
				  '   <h3>' + place + '</h3>',
				  '   <p> X 좌표 : ' + x + '<br />',
				  '       Y 좌표 : ' + y + '<br />',
				  '       <img src="' +  imgSrc  +'" width="200" height="200" alt="' + place +'" class="thumb" /><br />',
				  '   </p>',
				  '</div>'
				  
			  ].join('');
	
	          var infowindow = new naver.maps.InfoWindow({
	            content: contentString,
	            maxWidth: 600,
	            backgroundColor: "#eee",
	            borderColor: "#4964f8",
	            borderWidth: 4,
	            anchorSize: new naver.maps.Size(30, 30),
	            anchorSkew: true,
	            anchorColor: "##ff0000",
	            pixelOffset: new naver.maps.Point(20, -20)
	          });
			
	          // 마커 클릭시 정보창 열기, 끄기
	          naver.maps.Event.addListener(marker, "click", function (e) {
	            if (infowindow.getMap()) {
	              infowindow.close();
	            } else {
	              infowindow.open(map, marker);
	            }
	          });
	          
	          // 정보창 켜진 상태에서 맵 아무데나 클릭시 정보창 끄기
	          naver.maps.Event.addListener(map, "click", function (e) {
	      
	                infowindow.close();
	            
	            });
		}
        
        
      // x,y 좌표로 장소 이름 얻는 함수
		function findPlaceByXY(x,y)
		{
			var place = "";
			
			var xValues = $('.destination .x');
	        var yValues = $('.destination .y');
	        var destNames = $('.destination .schedule_choice_area .dest_name')
	        var destImgSrcs = $('.destination .schedule_choice_area .choice_area_content .choice_area_img img')
	        var destinations = new Array();		// 각 상세 일정 담을 배열	        
	          
	        //------------------------------------------------------------------------------------
	        for (var i = 0; i < xValues.length; i++)  // destinations 배열 구성하는 반복문
	        {
	            var destinationXY = new Object();
	            destinationXY.name = destNames[i].innerHTML.trim();		// 장소 이름
	            destinationXY.x = xValues[i].value;						// 장소 x
	            destinationXY.y = yValues[i].value;						// 장소 y
	            
	            destinations.push(destinationXY);
	
	        }
	        //-------------------------------------------------------------------------------------------
			  
	          
	        for (var i = 0; i < destinations.length; i++)
			{
	        	if (destinations[i].x == x && destinations[i].y == y)
				{
					place = destinations[i].name;
				}
			}
	        
			
			return place;
		}

      
		// x,y 좌표로 장소 이미지 얻는 함수
		function findImgByXY(x,y)
		{
			var imgSrc = "";
			
			var xValues = $('.destination .x');
	        var yValues = $('.destination .y');
	        var destImgSrcs = $('.destination .schedule_choice_area .choice_area_content .choice_area_image img');
	        // alert(destImgSrcs);
	        var destinations = new Array();		// 각 상세 일정 담을 배열	        
	          
	        //------------------------------------------------------------------------------------
	        for (var i = 0; i < xValues.length; i++)  // destinations 배열 구성하는 반복문
	        {
	            var destinationXY = new Object();
	            destinationXY.x = xValues[i].value;						// 장소 x
	            destinationXY.y = yValues[i].value;						// 장소 y
	            destinationXY.imgSrc = destImgSrcs[i].src;			// 이미지 소스
	            
	            destinations.push(destinationXY);
	
	        }
	        //-------------------------------------------------------------------------------------------
			  
	          
	        for (var i = 0; i < destinations.length; i++)
			{
	        	if (destinations[i].x == x && destinations[i].y == y)
				{
					imgSrc = destinations[i].imgSrc;
				}
			}
	        
			
			return imgSrc;
		}
		


        // 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
        function drawNaverPolyLine(data) 
		{
          var lineArray;
		  var walkArray = new Array();
		  
          for (var i = 0; i < data.result.lane.length; i++) {
            for (var j = 0; j < data.result.lane[i].section.length; j++) {
              lineArray = null;
              lineArray = new Array();
              
              for (var k = 0; k < data.result.lane[i].section[j].graphPos.length; k++) {
            	if (i==0 && k==0) {		// 처음 그려지기 시작하는 좌표
					walkArray.push(new naver.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
				}
            	if(i == data.result.lane.length-1 && k == data.result.lane[i].section[j].graphPos.length-1)
            	{				// 마지막에 그려진 좌표
            		walkArray.push(new naver.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
            	}
                lineArray.push(new naver.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
              }
              
              
              //결과의 노선에 따른 라인색상 지정하는 부분 
              if (data.result.lane[i].class == 1)		// 버스라면
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#ff0000',
                  map: map
                });
                polyArray.push(polyline);
              }
              // 지하철일 경우 ------------------------------------------------------------------
              else if (data.result.lane[i].type == 1) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#0D347F',
                  map: map
                });
                polyArray.push(polyline);
              } else if (data.result.lane[i].type == 2) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#37b42d',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 3) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#3B9F37',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 4) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#3165A8',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 5) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#703E8C',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 6) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#904D23',
                  map: map
                });
                polyArray.push(polyline);
              }

              else if (data.result.lane[i].type == 7) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#5B692E',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 8) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#C82363',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 9) {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#B39627',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 101) //공항철도
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#6CA8CE',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 102) //자기부상
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#E9945A',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 104)//경의중앙선
              {

                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#76B69B',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 107)//에버라인 
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#6FB26C',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 108)//경춘
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#2D9B76',
                  map: map
                });
                polyArray.push(polyline);
              }

              else if (data.result.lane[i].type == 109)//신분당
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#971F2D',
                  map: map
                });
                polyArray.push(polyline);
              }
              else if (data.result.lane[i].type == 110)//의정부
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#E78522',
                  map: map
                });
                polyArray.push(polyline);
              }

              else if (data.result.lane[i].type == 115)//김포골드
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#B39627',
                  map: map
                });
                polyArray.push(polyline);
              }
              else // 그 외
              {
                var polyline = new naver.maps.Polyline({
                  path: lineArray,
                  strokeWeight: 3,
                  strokeColor: '#ff0000',
                  map: map
                });
                polyArray.push(polyline);
              }
              // ------------------------------------------------------------------ 지하철일 경우
            }
          }
          
          return walkArray;
        }
        
        // 폴리라인 지우기
        function erasePolyLine()
		{
        	// 이미 그러진 폴리라인이 있다면 지운다
			if (polyArray.length>0)
			{
				for (var i = 0; i < polyArray.length; i++)
				{
					polyArray[i].setMap(null);
				}
			}
		}
        
        // 제이쿼리 드래그 종료 후 .destination  value  재정렬 함수 
        function reorder() {
          $(".destination").each(function (i, item) {
       
        	  
            $(item).attr('value', i );
       
            
          });
        }
        
        
        function sortable() {
      	  
      	  $(".sortable").sortable({
      		  
      		  

                items: $(".draggable"),

                start: function (event, ui) {
                  // 드래그 시작 시 호출
                  $('.detail_road_find').css('display', 'none');
                  $('.mask').css('display', 'none');

                },
                stop: function (event, ui) {
                  // 드래그 종료 시 호출

				  // 드래그 시 입력된 시간 초기화
                  $(this).find('.startHr').html('');
                  $(this).find('.startMin').html('');
                  
                  $(this).find('.endHr').html('');
                  $(this).find('.endMin').html('');
                
                  // 이미 그러진 폴리라인이 있다면 지운다
                  erasePolyLine();
                  
                  //순서 재정렬
                  reorder();   
                  
                  emptyDetail();
                  
                  
                  
                  
                  
               // JSON 객체 배열 다시 생성
                  selectAllDest();
                }
                
                
               
              });
              $(".sortable").disableSelection(); 
        }        

       







		function emptyDetail() {
			$('.detail_road_find').each(function(i, item) {
				$(item).attr("value","0");
                $(item).empty();
			  });
		}














        function getPathTypeName(pathType)
        {
        	var typeString; 
        	if (pathType==1)
        	{
        		typeString="지하철";
        	}
        	else if (pathType==2) {
        		typeString="버스";
        	}
        	else if (pathType==3)
        	{
        		typeString="지하철+버스";
        	}
        	else if (pathType==11)
        	{
        		typeString="열차";
        	}
        	else if (pathType==12)
        	{
        		typeString="고속/시외버스";
        	}
        	else if (pathType==13)
        	{
        		typeString="항공";
        	}
        	
        	return typeString;
        }

        function detailTrafficType(num)
        {
        	//1-지하철, 2-버스, 3-도보, 4-열차, 5-고속버스, 6-시외버스, 7-항공
        	
        	var str;
        	if (num==1)
        	{
        		str="지하철";
        	}
        	else if (num==2)
        	{
        		str="버스";
        	}
        	else if (num==3)
        	{
        		str="도보";
        	}
        	else if (num==4)
        	{
        		str="열차";
        	}
        	else if (num==5)
        	{
        		str="고속버스";
        	}
        	else if (num==6)
        	{
        		str="시외버스";
        	}
        	else if (num==7)
        	{
        		str="항공";
        	}

        	
        	
        	return str;
        }
        
        
        function drawPol(firDesX,firDesY,secDesX,secDesY) {
        	var polyline1 = new naver.maps.Polyline({
        	    map: map,
        	    path: [
        	    	new naver.maps.LatLng(firDesY, firDesX),
        	    	new naver.maps.LatLng(secDesY, secDesX),
        	      
        	    ],
        	    strokeWeight: 3,
                strokeColor: ' #000'
        	});
          polyArray.push(polyline1);
		}

        function callCityDraw(city, selector,firDesX,firDesY,secDesX,secDesY)// 상세 길찾기 팝업 창 그리기
        {
        	
        	
        	selector.append('<h5>경로의 갯수 : ' + city.result.path.length +'</h>' );
			 for (var i = 0; i < city.result.path.length; i++)
	        	{
	        		
	        		var pathType = city.result.path[i].pathType;
	        		var typeString = getPathTypeName(pathType);			//전체교통수단종류
	        		var subPathArr = city.result.path[i].subPath;			// subPath 배열
	        		
	        		
	        		if (i == 0) // 추천 경로
	        		{
	        			
	        			selector.append('-------------------------------------------------------------------------<br>');
	        			
	        			
	        			
	        			if (city.result.searchType == 0)
	        			{
	        				selector.append('추천 경로  : <button class="draw-poly" '
		        					+ 'onclick ="callMapObjApiAJAX(\'' + city.result.path[i].info.mapObj+ '\',' + firDesX + ',' + firDesY + ',' + secDesX + "," + secDesY  +')">경로 지도 표시</button><br>'    );
		        			
	        			}
	        			else
	        			{
	        				selector.append('추천 경로  : <button class="draw-poly" '
		        					+ 'onclick ="drawPol(' + firDesX + ',' + firDesY + ',' + secDesX + "," + secDesY  +')">경로 지도 표시</button><br>'    );
		        			
	        			}
	        			
	        			
	        			
	        			
	        			
	        			selector.append('교통 수단 유형 : ' + typeString + '  <button class="trans-detail btn btn-primary">상세 정보</button><br />');
	        			selector.append('<div class="trans-real-detail" style="display:none;" value='+  i +'></div>');
	        			// 상세 정보 subpath 처리
	        			for (var j = 0; j < city.result.path.length; j++) {
							if (j==i) {
								$('.trans-real-detail[value='+ j +']').append(j+"번째 상세정보<br>");
								
								$('.trans-real-detail[value='+ j +']').append("===================================================<br>");
								for (var k = 0; k < city.result.path[j].subPath.length; k++)  // subPath 배열 안 접근
								{
									var trafficString = detailTrafficType(city.result.path[j].subPath[k].trafficType);
									var distance = city.result.path[j].subPath[k].distance;
									var startName = city.result.path[j].subPath[k].startName;
									var endName = city.result.path[j].subPath[k].endName;
									var sectionTime = city.result.path[j].subPath[k].sectionTime;
									var stationCount = city.result.path[j].subPath[k].stationCount;
									
									if (city.result.path[j].subPath[k].lane != null) {
										var laneName = city.result.path[j].subPath[k].lane[0].name;
									}
									if (city.result.path[j].subPath[k].lane != null) {
										var busNo = city.result.path[j].subPath[k].lane[0].busNo;
									}
									
									$('.trans-real-detail[value='+ j +']').append( "■"+ (k+1)  + "번■<br>");
									$('.trans-real-detail[value='+ j +']').append( "교통수단 : " + trafficString  + "<br>");
									$('.trans-real-detail[value='+ j +']').append( "거 리(m) : " + distance  + "m<br>");
									$('.trans-real-detail[value='+ j +']').append( "소요시간 : " + Math.floor(sectionTime/60) + "시간 " + sectionTime%60 + "분 "   + "<br>");
									
									if (busNo != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "버스 번호 : " + busNo  + "<br>");
									}
									if (laneName != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "노선 이름 : " + laneName  + "<br>");
									}
									if (startName != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "시작역 : " + startName  + "<br>");
									}
									if (endName != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "종료역 : " + endName  + "<br>");
									}
									if (stationCount != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "역 갯수 : " + stationCount  + "<br>");
									}
									
									$('.trans-real-detail[value='+ j +']').append("<br><br>");
									
									
									var laneName = null;
									var busNo = null;
									
								}
								$('.trans-real-detail[value='+ j +']').append("===================================================<br>");
								
								
								
								
								
								
								
							}
						}
	        			
	        		
	        			
	        			
	        			
	        			if (city.result.searchType == 0)
	        			{
	        				selector.append('요          금 : ' + city.result.path[i].info.payment + '원<br>');
	        			}
	        			else
	        			{
	        				selector.append('요          금 : ' + city.result.path[i].info.totalPayment + '원<br>');
	        			}
	        			
	        			
	        			selector.append('총 거리 (km)    : ' + city.result.path[i].info.totalDistance/1000 + 'km<br>');
	        			selector.append('총 소요 시간   : ' + Math.floor(city.result.path[i].info.totalTime/60) + '시간 '+ city.result.path[i].info.totalTime%60 + '분<br>');
	        			selector.append('-------------------------------------------------------------------------<br>');
	        		}
	        		
	        		
	        		else
	        		{
	        			selector.append('-------------------------------------------------------------------------<br>');
	        			if (city.result.searchType == 0)
	        			{
	        				selector.append('추천 경로  : <button class="draw-poly" '
		        					+ 'onclick ="callMapObjApiAJAX(\'' + city.result.path[i].info.mapObj+ '\',' + firDesX + ',' + firDesY + ',' + secDesX + "," + secDesY  +')">경로 지도 표시</button><br>'    );
		        			
	        			}
	        			else
	        			{
	        				selector.append('추천 경로  : <button class="draw-poly" '
		        					+ 'onclick ="drawPol(' + firDesX + ',' + firDesY + ',' + secDesX + "," + secDesY  +')">' + i +' 번째 경로 지도 표시</button><br>'    );
		        			
	        			}
	        			
	        			selector.append('교통 수단 유형 : ' + typeString + '  <button class="trans-detail btn btn-primary">상세 정보</button><br />');
	        			selector.append('<div class="trans-real-detail" style="display:none;" value='+  i +'></div>');
	        			// 상세 정보 subpath 처리
	        			for (var j = 0; j < city.result.path.length; j++) {
							if (j==i) {
								$('.trans-real-detail[value='+ j +']').append(j+"번째 상세정보<br>");
								
								$('.trans-real-detail[value='+ j +']').append("===================================================<br>");
								for (var k = 0; k < city.result.path[j].subPath.length; k++)  // subPath 배열 안 접근
								{
									var trafficString = detailTrafficType(city.result.path[j].subPath[k].trafficType);
									var distance = city.result.path[j].subPath[k].distance;
									var startName = city.result.path[j].subPath[k].startName;
									var endName = city.result.path[j].subPath[k].endName;
									var sectionTime = city.result.path[j].subPath[k].sectionTime;
									var stationCount = city.result.path[j].subPath[k].stationCount;
									
									if (city.result.path[j].subPath[k].lane != null) {
										var laneName = city.result.path[j].subPath[k].lane[0].name;
									}
									if (city.result.path[j].subPath[k].lane != null) {
										var busNo = city.result.path[j].subPath[k].lane[0].busNo;
									}
									
									$('.trans-real-detail[value='+ j +']').append( "■"+ (k+1)  + "번■<br>");
									$('.trans-real-detail[value='+ j +']').append( "교통수단 : " + trafficString  + "<br>");
									$('.trans-real-detail[value='+ j +']').append( "거 리(m) : " + distance  + "m<br>");
									$('.trans-real-detail[value='+ j +']').append( "소요시간 : " + Math.floor(sectionTime/60) + "시간 " + sectionTime%60 + "분 "   + "<br>");
									
									if (busNo != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "버스 번호 : " + busNo  + "<br>");
									}
									if (laneName != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "노선 이름 : " + laneName  + "<br>");
									}
									if (startName != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "시작역 : " + startName  + "<br>");
									}
									if (endName != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "종료역 : " + endName  + "<br>");
									}
									if (stationCount != undefined) {
										$('.trans-real-detail[value='+ j +']').append( "역 갯수 : " + stationCount  + "<br>");
									}
									
									$('.trans-real-detail[value='+ j +']').append("<br><br>");
									var laneName = null;
									var busNo = null;
								}
								$('.trans-real-detail[value='+ j +']').append("===================================================<br>");
								
								
								
								
								
								
								
							}
						}
	        			
	        	
	        			if (city.result.searchType == 0)
	        			{
	        				selector.append('요          금 : ' + city.result.path[i].info.payment + '원<br>');
	        			}
	        			else
	        			{
	        				selector.append('요          금 : ' + city.result.path[i].info.totalPayment + '원<br>');
	        			}
	        			
	        			selector.append('총 거리 (km)    : ' + city.result.path[i].info.totalDistance/1000 + 'km<br>');
	        			selector.append('총 소요 시간   : ' + Math.floor(city.result.path[i].info.totalTime/60) + '시간 '+ city.result.path[i].info.totalTime%60 + '분<br>');
	        			selector.append('-------------------------------------------------------------------------<br>');
	        		}
	        	}
			 
			 selector.append('</div>');
        }
      </script>
</body>

</html>