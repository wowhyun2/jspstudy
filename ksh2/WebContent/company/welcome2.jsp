<%@page import="java.util.List"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
 
 
 
 
 
 
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Welcome</a></li>
<li><a href="#">History</a></li>
<li><a href="#">Newsroom</a></li>
<li><a href="#">Public Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>지도api</h1>

<div id="map" style="width:600px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40091c12f49f0114233db76c9b830a9f"></script>
	<script>
// 		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.15850200024277,129.06201885274174), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 



var positions = [
	<%
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = new MemberBean();
		List<MemberBean> Memberlist = null;
		Memberlist =mdao.getMemberList();
		for(int i=0;i<Memberlist.size();i++){
		mb = Memberlist.get(i);
		
	%>
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(<%=mb.getResulty()%>,<%=mb.getResultx()%>)
    },
    <%
 		}
    %>
  
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}

		
		
		
		
	</script>








</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



    