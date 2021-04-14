<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String contenttypeid = request.getParameter("contenttypeid");
String contentid = request.getParameter("contentid");
%>

<!doctype html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/planner.css">
<!-- 제이쿼리 -->
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 제이쿼리 UI -->
<script type="text/javascript"
   src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
body {
  overflow-x: auto;
  overflow-y: auto;
}
</style>   
</head>
<body>

   <div id="planner_info_detail">
      <div class="info_detail_title"></div>

      <div class="info_detail_content">
         <ul>
            <li class="info_detail_content_img"></li>
            <li class="common_info">
               <p>
                  우편번호 : <span id="zipcode"></span>
               </p>
               <p>
                  전화번호 : <span id="tel"></span>
               </p>
               <p>
                  홈페이지 : <a href="#"><span id="homepage"></span></a>
               </p>
               <p>
                  주소 : <span id="addr"></span>
               </p>
            </li>


            <li>
               <!-- 타입 별 제목 -->
               <p class="content_type_title"></p>
               
               <!-- 음식점 -->
               <p id="parkingfood"></p>
               <p id="opentimefood"></p>
               <p id="restdatefood"></p>
               <p id="firstmenu"></p>
               <p id="treatmenu"></p> 
               
               <!-- 행사/공연/축제 -->
               <p id="eventstartdate"></p>
               <p id="eventenddate"></p>
               <p id="eventplace"></p>
               <p id="usetimefestival"></p> 
               
               <!-- 여행코스 -->
               <p id="distance"></p>
               <p id="taketime"></p> 
               
               <!-- 레포츠 -->
               <p id="infocentertourcourse"></p>
               <p id="restdateleports"></p>
               <p id="usetimeleports"></p> 
               
               <!-- 숙박 -->
               <p id="infocenterlodging"></p>
               <p id="parkinglodging"></p>
               <p id="checkintime"></p>
               <p id="checkouttime"></p>
               <p id="reservationlodging"></p>
               <p id="reservationurl"></p> 
               
               <!-- 쇼핑 -->
               <p id="saleitem"></p>
               <p id="opentime"></p>
               <p id="parkingshopping"></p>
               <p id="restdateshopping"></p> 
               
               <!-- 관광지 -->
               <p id="infocenter"></p>
               <p id="parking"></p>
               <p id="usetime"></p> 
               
               <!-- 문화시설 -->
               <p id="infocenterculture"></p>
               <p id="restdateculture"></p>
               <p id="usefee"></p>
            </li>
            <li>
               <h4>개요</h4>
               <p id="overview"></p>
            </li>
         </ul>
      </div>
   </div>

   <script type="text/javascript">
      detailCommonAJAX();
      detailIntroAJAX();
      
      
      // 공통정보
      function detailCommonAJAX() 
      {
    	  var xhr = new XMLHttpRequest();

          // get 방식으로 parameter 수신
          var contenttypeid = getParameter("contenttypeid");
          var contentid = getParameter("contentid");

          console.log("contenttypeid : "+contenttypeid);
          console.log("contentid : "+contentid);

          var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=J%2BrS43UGQkyY%2FEmyUDVGQdkc4kEcIfmqVl6GshtaNg%2Bc4R4vS%2BeOtpkynK9DDpYtfZRnvc8NBIlq%2BeDBeWR%2FnA%3D%3D&"
                + "contenttypeid="
                + contenttypeid
                + "&"
                + "contentId="
                + contentid
                + "&"
                + "MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
          xhr.open("GET", url, true);
          xhr.send();
          xhr.onreadystatechange = function() {
             if (xhr.readyState == 4 && xhr.status == 200) {
                var result = JSON.parse(xhr.responseText); // 
                console.log(result);
                var myItem = result.response.body.items.item;

                //for (var i = 0; i < myItem.length; i++) {
                //var pageNo = result.response.body.pageNo;         // 요청 페이지
                //var imgSrc = result.response.body.firstimage;
                //var title = result.response.body.title;
                //var totalCount = result.response.body.totalCount;   // ex)437
                //var contentsPerPage = result.response.body.numOfRows;      // 한페이지에 가져올 데이터 갯수

                //title제목, overview개요, firstimage이미지, addr1주소, addr2상세주소, homepage홈페이지, zipcode우편번호, tel전화번호
                var title = myItem.title; // 장소 이름
                var overview = myItem.overview;
                var imgSrc = myItem.firstimage; // 이미지 경로
                var addr1 = myItem.addr1;
                var addr2 = myItem.addr2;
                var homepage = myItem.homepage;
                var zipcode = myItem.zipcode;
                var tel = myItem.tel;

                if (addr2 == undefined) {
                   addr2 = "";
                }

                $(".info_detail_title").html(title);
                $(".info_detail_content_img")
                      .html("<img src="+ imgSrc +">");
                $("#zipcode").html(zipcode);
                $("#tel").html(tel);
                $("#homepage").html(homepage);
                $("#addr").html(addr1 + ", " + addr2);
                $("#overview").html(overview);

             	}
          	}
       	 
      }

         
    

      
      
      // 상세정보
      function detailIntroAJAX() 
      {

         var xhr = new XMLHttpRequest();

      	// get 방식으로 parameter 수신
         var contenttypeid = getParameter("contenttypeid");
         var contentid = getParameter("contentid");

         console.log("contenttypeid : " + contenttypeid);
         console.log("contentid : " + contentid);

         var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=J%2BrS43UGQkyY%2FEmyUDVGQdkc4kEcIfmqVl6GshtaNg%2Bc4R4vS%2BeOtpkynK9DDpYtfZRnvc8NBIlq%2BeDBeWR%2FnA%3D%3D"
               + "&contentTypeId="
               + contenttypeid
               + "&contentId="
               + contentid
               + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
         xhr.open("GET", url, true);
         xhr.send();
         xhr.onreadystatechange = function()
         {
            if (xhr.readyState == 4 && xhr.status == 200) {
               var result = JSON.parse(xhr.responseText);
               console.log(result);
               var myItem = result.response.body.items.item;

               var opentimefood = myItem.opentimefood;

               console.log(opentimefood);
               if (contenttypeid == 15) // eventstartdate(행사시작일), eventenddate(행사종료일), eventplace(행사장소), usetimefestival(이용요금), contenttypeid = 15(행사/공연/축제)
               {
                  contenttypetitle = "행사/공연/축제";
                  if (myItem.eventstartdate != undefined) {
                     eventstartdate = "행사 시작 일 : " + myItem.eventstartdate;
                  } else {
                     eventstartdate = "";
                  }
                  if (myItem.eventenddate != undefined) {
                     eventenddate = "행사 종료 일 : " + myItem.eventenddate;
                  } else {
                     eventenddate = "";
                  }
                  if (myItem.eventplace != undefined) {
                     eventplace = "행사 장소 : " + myItem.eventplace;
                  } else {
                     eventplace = "";
                  }
                  if (myItem.usetimefestival != undefined) {
                     usetimefestival = "이용 요금 : " + myItem.usetimefestival;
                  } else {
                     usetimefestival = "";
                  }
               } else if (contenttypeid == 25) // distance (코스 총 거리), taketime(코스 총 소요시간), contenttypeid = 25(여행코스)
               {
                  contenttypetitle = "여행코스";
                  if (myItem.distance != undefined) {
                     distance = "코스 총 거리 " + myItem.distance;
                  } else {
                     distance = "";
                  }
                  if (myItem.taketime != undefined) {
                     taketime = "코스 총 소요시간 : " + myItem.taketime;
                  } else {
                     taketime = "";
                  }
               } else if (contenttypeid == 32) // infocenterlodging(문의 및 안내), parkinglodging(주차 시설), checkintime(체크 인), checkouttime(체크 아웃), reservationlodging(예약안내), reservationurl(예약안내 홈페이지), contenttypeid = 32(숙박)
               {
                  contenttypetitle = "숙박";
                  if (myItem.infocenterlodging != undefined) {
                     infocenterlodging = "문의 및 안내 : " + myItem.infocenterlodging;
                  } else {
                     infocenterlodging = "";
                  }
                  if (myItem.parkinglodging != undefined) {
                     parkinglodging = "주차 시설 : " + myItem.parkinglodging;
                  } else {
                     parkinglodging = "";
                  }
                  if (myItem.checkintime != undefined) {
                     checkintime = "체크 인 : " + myItem.checkintime;
                  } else {
                     checkintime = "";
                  }
                  if (myItem.checkouttime != undefined) {
                     checkouttime = "체크 아웃 : " + myItem.checkouttime;
                  } else {
                     checkouttime = "";
                  }
                  if (myItem.reservationlodging != undefined) {
                     reservationlodging = "예약 안내 : " + myItem.reservationlodging;
                  } else {
                     reservationlodging = "";
                  }
                  if (myItem.reservationurl != undefined) {
                     reservationurl = "예약 안내 홈페이지 : " + myItem.reservationurl;
                  } else {
                     reservationurl = "";
                  }
               } else if (contenttypeid == 38) // saleitem(판매 품목), opentime(영업시간), parkingshopping(주차 시설), restdateshopping(쉬는날), contenttypeid=38(쇼핑)
               {
                  contenttypetitle = "쇼핑";
                  if (myItem.saleitem != undefined) {
                     saleitem = "판매 품목 : " + myItem.saleitem;
                  } else {
                     saleitem = "";
                  }
                  if (myItem.opentime != undefined) {
                     opentime = "영업 시간 : " + myItem.opentime;
                  } else {
                     opentime = "";
                  }
                  if (myItem.parkingshopping != undefined) {
                     parkingshopping = "주차 시설 : " + myItem.parkingshopping;
                  } else {
                     parkingshopping = "";
                  }
                  if (myItem.restdateshopping != undefined) {
                     restdateshopping = "쉬는 날 : " + myItem.restdateshopping;
                  } else {
                     restdateshopping = "";
                  }
               } else if (contenttypeid == 39) // parkingfood(주차 시설), opentimefood(영업 시간), restdatefood(쉬는 날), firstmenu(대표 메뉴), treatmenu(취급 메뉴), contenttypeid=39(음식점)
               {
                  contenttypetitle = "음식점";
                  if (myItem.parkingfood != undefined) {
                     parkingfood = "주차 시설 : " + myItem.parkingfood;
                  } else {
                     parkingfood = "";
                  }
                  if (myItem.opentimefood != undefined) {
                     opentimefood = "영업 시간 : " + myItem.opentimefood;
                  } else {
                     opentimefood = "";
                  }
                  if (myItem.restdatefood != undefined) {
                     restdatefood = "쉬는 날 : " + myItem.restdatefood;
                  } else {
                     restdatefood = "";
                  }
                  if (myItem.firstmenu != undefined) {
                     firstmenu = "대표 메뉴 : " + myItem.firstmenu;
                  } else {
                     firstmenu = "";
                  }
                  if (myItem.treatmenu != undefined) {
                     treatmenu = "취급 메뉴 : " + myItem.treatmenu;
                  } else {
                     treatmenu = "";
                  }
               } else if (contenttypeid == 12) // infocenter(문의 및 안내),  주차 시설(parking), 이용 시간(usetime), contenttypeid=12(관광지)
               {
                  contenttypetitle = "관광지";
                  if (myItem.infocenter != undefined) {
                     infocenter = "문의 및 안내 : " + myItem.infocenter;
                  } else {
                     infocenter = "";
                  }
                  if (myItem.parking != undefined) {
                     parking = "주차 시설 : " + myItem.parking;
                  } else {
                     parking = "";
                  }
                  if (myItem.usetime != undefined) {
                     usetime = "이용 시간 : " + myItem.usetime;
                  } else {
                     usetime = "";
                  }
               } else if (contenttypeid == 28) // infocentertourcourse(문의 및 안내), restdateleports(쉬는날), usetimeleports(이용시간), contenttypeid= 28(레포츠)
               {
                  contenttypetitle = "레포츠";
                  if (myItem.infocentertourcourse != undefined) {
                     infocentertourcourse = "문의 및 안내 : " + myItem.infocentertourcourse;
                  } else {
                     infocentertourcourse = "";
                  }
                  if (myItem.restdateleports != undefined) {
                     restdateleports = "쉬는 날 : " + myItem.restdateleports;
                  } else {
                     restdateleports = "";
                  }
                  if (myItem.usetimeleports != undefined) {
                     usetimeleports = "이용 시간 : " + myItem.usetimeleports;
                  } else {
                     usetimeleports = "";
                  }
               } else if (contenttypeid == 14) // infocenterculture(문의 및 안내), usetimeculture(이용시간), restdateculture(쉬는날), contenttypeid = 14(문화시설)
               {
                  contenttypetitle = "문화시설";
                  if (myItem.infocenterculture != undefined) {
                     infocenterculture = "문의 및 안내 : " + myItem.infocenterculture;
                  } else {
                     infocenterculture = "";
                  }
                  if (myItem.usetimeculture != undefined) {
                     usetimeculture = "이용 시간 : " + myItem.usetimeculture;
                  } else {
                     usetimeculture = "";
                  }
                  if (myItem.restdateculture != undefined) {
                     restdateculture = "쉬는 날 : " + myItem.restdateculture;
                  } else {
                     restdateculture = "";
                  }
                  if (myItem.usefee != undefined) {
                     usefee = "이용 요금 : " + myItem.usefee;
                  } else {
                     usefee = "";
                  }
               }

               // 음식점
               $(".content_type_title").html(contenttypetitle);
               $("#parkingfood").html(parkingfood);
               $("#opentimefood").html(opentimefood);
               $("#restdatefood").html(restdatefood);
               $("#firstmenu").html(firstmenu);
               $("#treatmenu").html(treatmenu);

               // 관광지
               $(".content_type_title").html(contenttypetitle);
               $("#infocenter").html(infocenter);
               $("#parking").html(parking);
               $("#usetime").html(usetime);

               // 행사/공연/축제
               $(".content_type_title").html(contenttypetitle);
               $("#eventstartdate").html(eventstartdate);
               $("#eventenddate").html(eventenddate);
               $("#eventplace").html(eventplace);

               // 여행코스
               $(".content_type_title").html(contenttypetitle);
               $("#distance").html(distance);
               $("#taketime").html(taketime);

               // 레포츠
               $(".content_type_title").html(contenttypetitle);
               $("#infocentertourcourse").html(infocentertourcourse);
               $("#restdateleports").html(restdateleports);
               $("#usetimeleports").html(usetimeleports);

               // 숙박
               $(".content_type_title").html(contenttypetitle);
               $("#infocenterlodging").html(infocenterlodging);
               $("#parkinglodging").html(parkinglodging);
               $("#checkintime").html(checkintime);
               $("#checkouttime").html(checkouttime);
               $("#reservationlodging").html(reservationlodging);
               $("#reservationurl").html(reservationurl);

               // 쇼핑
               $(".content_type_title").html(contenttypetitle);
               $("#saleitem").html(saleitem);
               $("#opentime").html(opentime);
               $("#parkingshopping").html(parkingshopping);
               $("#restdateshopping").html(restdateshopping);

               // 문화시설
               $(".content_type_title").html(contenttypetitle);
               $("#infocenterculture").html(infocenterculture);
               $("#usetimeculture").html(usetimeculture);
               $("#restdateculture").html(restdateculture);
               $("#usefee").html(usefee);

            }
         }
      }

      // JavaScript 로 get방식의 parameter를 받아오는 함수
      function getParameter(name) {

         name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
         var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
               .exec(location.search);
         return results === null ? "" : decodeURIComponent(results[1]
               .replace(/\+/g, " "));

      }
   </script>
</body>
</html>