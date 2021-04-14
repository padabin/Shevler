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

    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/planner.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--아이콘 링크 -->
    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script type="text/javascript">  

        $(document).ready(function () {

        	
        	/* 달력 선택 function - jqueryUI - datepicker 함수*/
            var dateFormat = "yy-mm-dd",

                from = $("#startdate").datepicker({
                    dateFormat: "yy-mm-dd",
                    defaultDate: 0,
                    changeMonth: true,
                    minDate: 0,
                    numberOfMonths: 1,
                    closeText: "닫기",
                    prevText: "이전달",
                    nextText: "다음달",
                    currentText: "오늘",
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"],
                    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"],
                    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]
                })
                    .on("change", function () {
                        to.datepicker("option", "minDate", getDate(this));

                        // 선택한 일정에 대해 일주일 최대값 일주일 뒤까지
                        var curDate = $("#startdate").datepicker("getDate");  // Date return
                        curDate.setDate(curDate.getDate() + 6);
                        $("#enddate").datepicker("option", "maxDate", curDate);

                    }),
                to = $("#enddate").datepicker({
                    dateFormat: "yy-mm-dd",
                    defaultDate: 0,
                    changeMonth: true,
                    minDate: 0,
                    numberOfMonths: 1,
                    closeText: "닫기",
                    prevText: "이전달",
                    nextText: "다음달",
                    currentText: "오늘",
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"],
                    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"],
                    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]

                })
                    .on("change", function () {
                        from.datepicker("option", "maxDate", getDate(this));
                    });

        	
        	
            /* 헤더 고정 function*/
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
            }); /* end */

            // 매칭 희망 / 비희망 선택 시에 따른 날짜 범위와 초기화, 최소 최대 인원 수 설정 변경
            $('input[name="matchingavailability"]:radio').change(function () {
                // alert($(this).val());

                // 여행 시작, 종료일 초기화
                $("#startdate").val("");
                $("#enddate").val("");
                $("#startdate").datepicker("destroy");
                $("#enddate").datepicker("destroy");


                var matchingavailability = $('input[name="matchingavailability"]:checked').val();
                var data = null;


                // 매칭 희망 시
                if (matchingavailability == "MA1") {
                    // 최소 일자 설정
                    var minDate = 7;

                    // 최소 최대 인원 조건
                    $(".minmaxarea").html("<select  name = 'min' id = 'min' class='selectminmax' ><option value = '2' > 2명</ ><option value='3'>3명</option><option value='4'>4명</option></select > ~ <select name='max' id = 'max' class='selectminmax'><option value='2'>2명</option><option value='3'>3명</option><option value='4'>4명</option></select >");

                    var prevVal
                    $('.selectminmax').change(function () {
                        var min = $('#min').val();
                        var max = $('#max').val();

                        if (min > max) {

                            alert("최소인원은 최대인원보다 많을 수 없습니다.");
                            $("#min").val("2").prop("selected", true);
                            return;
                        }
                    });
                }

                // 매칭 비희망 시
                if (matchingavailability == "MA2") {

                    // 최소 일자 설정
                    var minDate = null;

                    // 최소 최대 인원 조건
                    $(".minmaxarea").html("<input type='text' class='minmax' id='min' name='min' value='1'>명 ~ <input type='text' class='minmax' id='max' name='max' value='1'>명");

                    $('.minmax').change(function () {
                        var min = $('#min').val();
                        var max = $('#max').val();

                        if (min > max) {
                            $("#min").val(max);
                            alert("최소 인원이 최대인원보다 많을 수 없습니다.");
                        }
                    });
                }

                /* 달력 선택 function - jqueryUI - datepicker 함수*/
                var dateFormat = "yy-mm-dd",

                    from = $("#startdate").datepicker({
                        dateFormat: "yy-mm-dd",
                        defaultDate: 0,
                        changeMonth: true,
                        minDate: 0,
                        numberOfMonths: 1,
                        closeText: "닫기",
                        prevText: "이전달",
                        nextText: "다음달",
                        currentText: "오늘",
                        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                            "7월", "8월", "9월", "10월", "11월", "12월"],
                        monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                            "7월", "8월", "9월", "10월", "11월", "12월"],
                        dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                        dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]
                    })
                        .on("change", function () {
                            to.datepicker("option", "minDate", getDate(this));

                            // 선택한 일정에 대해 일주일 최대값 일주일 뒤까지
                            var curDate = $("#startdate").datepicker("getDate");  // Date return
                            curDate.setDate(curDate.getDate() + 6);
                            $("#enddate").datepicker("option", "maxDate", curDate);

                        }),
                    to = $("#enddate").datepicker({
                        dateFormat: "yy-mm-dd",
                        defaultDate: 0,
                        changeMonth: true,
                        numberOfMonths: 1,
                        closeText: "닫기",
                        prevText: "이전달",
                        nextText: "다음달",
                        currentText: "오늘",
                        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                            "7월", "8월", "9월", "10월", "11월", "12월"],
                        monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                            "7월", "8월", "9월", "10월", "11월", "12월"],
                        dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                        dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]

                    })
                        .on("change", function () {
                            from.datepicker("option", "maxDate", getDate(this));
                        });

                function getDate(element) {
                    var date;
                    try {
                        date = $.datepicker.parseDate(dateFormat, element.value);
                    } catch (error) {
                        date = null;
                    }

                    return date;
                }
            });/* end */


            // 매칭 희망 여부 클릭 안했을 때 처리
            $('#min, #max, #startdate, #enddate').click(function () {

                var matchingavailabilityck = $('input[name="matchingavailability"]:checked').val();

                if (typeof matchingavailabilityck == "undefined") {
                    alert("매칭 희망 여부를 선택해 주세요.");
                    $("#matchingavailability").focus();
                }

            });/* end */
            


            // 수립 예산 범위
            $('#budget').on("keyup", function () {
                $(this).val($(this).val().replace(/[^0-9]/g, ""));
                var budget = $(this).val();

                if (budget < 0 || budget > 1000) {
                    alert("수립 예산 범위는 1~1000까지 설정가능합니다.");
                    $('#budget').val(1);
                }
            });

            // 매칭 희망 툴팁 표시
            $(".match_infolayer").hide();
            $(".match_info").click(function () {
                $(".match_info").blur();
                $(".match_infolayer").show();
                return false;
            });

            $(".match_infolayer button").click(function () {
                $(".match_infolayer").hide();
            });

            

            // 플래너 1차페이지 유효성 검사
            $(".nextbtn").click(function () {

                // 플래너 제목
                if ($("#title").val() == "") {

                    alert("플래너 제목을 작성해주세요.");
                    $("#title").focus();
                    return false;
                }

                // 매칭 희망 여부
                if ($(':radio[name="matchingavailability"]:checked').length < 1) {
                    alert('매칭 희망 여부를 선택해주세요.');
                    $('#matchingavailability').focus;
                    return false;
                }

                // 여행 시작, 종료일
                if ($("#startdate").val() == "") {

                    alert("여행 시작일을 선택해주세요.");
                    $("#startdate").focus();
                    return false;
                }
                if ($("#enddate").val() == "") {

                    alert("여행 종료일을 선택해주세요.");
                    $("#enddate").focus();
                    return false;
                }

                // 여행 타입
                if ($("#traveltype").val() == "") {

                    alert("여행 타입을 선택해주세요.");
                    $("#traveltype").focus();
                    return false;
                }

                // 수립 예산
                if ($("#budget").val() == "") {

                    alert("수립 예산을 작성해주세요.");
                    $("#budget").focus();
                    return false;
                }

                // 이동 교통 수단
                if ($("#transportation").val() == "") {

                    alert("교통수단을 선택해주세요.");
                    $("#transportation").focus();
                    return false;
                }


            });


        });/* jQuery end */
        
        
        function getDate(element) {
            var date;
            try {
                date = $.datepicker.parseDate(dateFormat, element.value);
            } catch (error) {
                date = null;
            }

            return date;
        }
        /*
        $(document).on("click",".next btn",function(){  
             var popupX = (document.body.offsetWidth / 2) - (1300 / 2); 
             var popupY= (window.screen.height / 2) - (800 / 2);
             // width, height 계산

             window.open('Planner_Info_Detail.jsp', 'status=no, scrollbars=yes height=800, width=1300,  left='+ popupX + ', top='+ popupY);
         });
        */
    </script>
    <style ref="stylesheet" type="text/css">
        body {
            overflow-x: auto;
            overflow-y: auto;
        }
    </style>
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
            </div><!-- end top -->

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
                </div><!-- end right -->
            </nav><!-- end navbar -->
        </div><!-- end header -->

        <div id="planner_first_content">
            <div class="planner_first_desc">
                <h1>스케블러에서 여행을 시작하세요!</h1>
                <ul>
                    <li>
                        <img src="images/planner_firstimage1.jpg">
                        <h4>여행정보</h4>
                        <p>전 세계 800개 도시, 30만개의 관광명소, 음식점, 쇼핑 정보를 확인하세요.</p>
                    </li>
                    <li>
                        <img src="images/planner_firstimage2.jpg">
                        <h4>여행일정</h4>
                        <p>전 세계 100,000개 이상의 여행일정을 확인하고 나만의 일정을 계획해 보세요.</p>
                    </li>
                    <li>
                        <img src="images/planner_firstimage3.jpg">
                        <h4>커뮤니티</h4>
                        <p>여행자들과 정보를 공유하고, 궁금한 것은 언제든 물어보세요.</p>
                    </li>
                </ul>
            </div>
            <div>
                <h2 class="planner_title">플래너 수정</h2>
                <form name="planner_form" id="planner_form" action="plannerupdate.action" method="post">
                    <div>
                        <table class="table planner_table">
                            <tr>
                                <td>플래너 제목</td>
                                <td><input type="text" name="title" id="title" value="${dto.planner_title }"></td>
                                <td><input type="hidden"  value="${planner_code }" name="planner_code" /></td>
                            </tr>
                            <tr>
                                <td>
                                    매칭 희망 여부
                                    <span class="match_info"><i class="xi-x xi-info-o"></i></span>
                                    <!-- 매치 인포 레이어 팝업-->
                                    <div class="match_infolayer">
                                        <p>매칭희망을 선택하시면 <span>자동</span>으로 매칭 목록에 리스트 됩니다.</p>
                                        <p>매칭을 원하시지 않는 회원은 아래 항목에 해당하는 분</p>
                                        <p class="match_infolayer_list">1. 본인만의 여행을 계획하고 싶은 회원</p>
                                        <p class="match_infolayer_list">2. 지난 여행들을 기록하고 싶은 회원</p>
                                        <p>매칭 <span>비희망</span>을 선택해 주시기 바랍니다.</p>
                                        <button type="button">닫기</button>
                                    </div>
                                </td>
                                <td>
                                
                                    <label name="matchingavailability">희망
                                        <input type="radio" id="matchingavailability" name="matchingavailability"
                                            value="MA1" ${dto.matching_availability_code eq "MA1" ? "checked" : "" }>
                                    </label>

                                    <label name="matchingavailability">비희망
                                        <input type="radio" id="matchingavailability" name="matchingavailability"
                                            value="MA2" ${dto.matching_availability_code eq "MA1" ? "" : "checked" }>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>여행 시작일</td>
                                <td><input type="text" name="startdate" id="startdate" readonly="readonly" size="12"  value="${dto.planner_start_date }"/></td>
                            </tr>
                            <tr>
                                <td>여행 종료일</td>
                                <td><input type="text" name="enddate" id="enddate" readonly="readonly" size="12" value="${dto.planner_end_date }"/><br></td>
                            </tr>
                            <tr>
                                <td>여행 타입</td>
                                <td>
                                    <select name="traveltype" id="traveltype">
                                        <option VALUE="" >--타입 선택--</option>
                                        <option VALUE="TT1" ${dto.travel_type_code eq "TT1" ? "selected" : "" }>관광 타입</option>
                                        <option VALUE="TT2" ${dto.travel_type_code eq "TT2" ? "selected" : "" }>맛집 탐방 타입</option>
                                        <option VALUE="TT4" ${dto.travel_type_code eq "TT4" ? "selected" : "" }>축제 탐방 타입</option>
                                        <option VALUE="TT6" ${dto.travel_type_code eq "TT6" ? "selected" : "" }>액티비티 타입</option>
                                        <option VALUE="TT7" ${dto.travel_type_code eq "TT7" ? "selected" : "" }>힐링 타입</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>수립 예산</td>
                                <td><input type="text" name="budget" id="budget" value="${dto.planner_budget }">만원</td>
                            </tr>
                            <tr>
                                <td>최소 / 최대 인원</td>
                                <td class="minmaxarea">
                                    <select name="min" id="min" class="selectminmax">
                                        <option value="2" ${dto.planner_min eq "2" ? "selected" : "" }>2명</option>
                                        <option value="3" ${dto.planner_min eq "3" ? "selected" : "" }>3명</option>
                                        <option value="4" ${dto.planner_min eq "4" ? "selected" : "" }>4명</option>
                                    </select>
                                    ~
                                    <select name="max" id='max' class="selectminmax">
                                        <option value="2" ${dto.planner_max eq "2" ? "selected" : "" }>2명</option>
                                        <option value="3" ${dto.planner_max eq "3" ? "selected" : "" }>3명</option>
                                        <option value="4" ${dto.planner_max eq "4" ? "selected" : "" }>4명</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>주요 이동 교통 수단</td>
                                <td>
                                    <select name="transportation">
                                        <option VALUE="">--교통수단 선택--</option>
                                        <option VALUE="TR1" ${dto.transportation_code eq "TR1" ? "selected" : "" }>버스</option>
                                        <option VALUE="TR2" ${dto.transportation_code eq "TR2" ? "selected" : "" }>택시</option>
                                        <option VALUE="TR3" ${dto.transportation_code eq "TR3" ? "selected" : "" }>기차</option>
                                        <option VALUE="TR4" ${dto.transportation_code eq "TR4" ? "selected" : "" }>자가</option>
                                        <option VALUE="TR5" ${dto.transportation_code eq "TR5" ? "selected" : "" }>자전거</option>
                                        <option VALUE="TR6" ${dto.transportation_code eq "TR6" ? "selected" : "" }>도보</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="btntd">
                                    <input type="submit" class="btn nextbtn" value="수정 완료" style="width:200px">
                                    <input type="reset" class="btn resetbtn" value="원래대로" style="width:200px">
                                    <br /><br />
                                    <a href="plannerlist.action"><button class="btn btn-primary">목록으로</button></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
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
                                    <div class="copyright">Copyright © <b>스케블러</b> all rights reserved.</div>
                                </td>
                                <td scope="col">
                                    <div class="footerinfo">
                                        <div class="title">QUICK</div>
                                        <ul>
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
						          			<c:choose>
						          				<c:when test="${sessionScope.name == null }">
						          					<li id="#"><a href="#"></a></li>
						          				</c:when>
						          				<c:otherwise>
						          					<li id="#"><a href="mypage.action">마이페이지</a></li>
						          				</c:otherwise>
						          			</c:choose>
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
                                <li class="-sns_blog"><a href="#none" target="_blank"><i class="xi-blogger"></i></a>
                                </li>
                                <li class="-sns_facebook"><a href="#none" target="_blank"><i
                                            class="xi-facebook"></i></a></li>
                                <li class="-sns_instagram"><a href="#none" target="_blank"><i
                                            class="xi-instagram"></i></a></li>
                                <li class="-sns_katalk"><a href="#none" target="_blank"><i class="xi-kakaotalk"></i></a>
                                </li>
                                <li class="-sns_kastory"><a href="#none" target="_blank"><i
                                            class="xi-kakaostory"></i></a></li>
                            </ul>
                        </div>
                        <!-- end snswrap -->
                    </div>
                    <!-- end footerbottom-->
                </div>
            </div>

        </footer><!-- end footer -->

    </div><!-- end wrap -->
</body>

</html>