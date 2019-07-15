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
 <script type="text/javascript">
var fn ='global';

function addFile(element) {
	   // alert(element.files[0].name);
	   fn= element.files[0].name;
	   
	  //  alert(element.files[0].size);
	}

function imageChange(){
	document.getElementById('fileName').value = fn;
	document.getElementById('fileName').style.color="black";
}

function previewFile() {

	var preview = document.querySelector('#preimage');
	var file = document.querySelector('input[type=file]').files[0];
	var reader = new FileReader();
	reader.onloadend= function() {
		preview.src = reader.result;
	}
	if (file) {
		reader.readAsDataURL(file);
		
	} else {
		preview.src = "";
	}
}
// $(document).ready(function() { 

// 	   // 여기서 input text value가 변경함을 감지 

// 	   $('input[id=signedDataValue]').change(function() {  

// 	     if($(this).val() !="") { 

// 	       test(); 

// 	    } 

// 	 }); 

// 	 }); 


</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
String id = (String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
// 세션값 없으면 login.jsp 이동
%>





<!-- 게시판 -->
<article>
<h1>Notice Write</h1>
<form action="writePro.jsp" method="post" name ="fr" enctype="multipart/form-data">
<table id="notice">
<tr><td class="twrite">글쓴이</td>
   <td class="ttitle"><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td class="twrite">비밀번호</td>
    <td class="ttitle"><input type="password" name="pass"></td></tr>
<tr><td class="twrite">제목</td>
    <td class="ttitle"><input type="text" name="subject" id="subid"></td></tr>
<tr><td class="twrite">첨부파일 </td><td class="ttitle"><input type="file" id="fileid" name="file" onchange="previewFile();addFile(this);"><br>
						<img src =""  height="300" width="500" alt="image preview" id="preimage"onload="imageChange()" ><br>
						<input type ="text" id="fileName" readonly size ="30" style="border:0px;background-color:transparent">
						</td></tr>
<tr><td class="twrite">글내용</td>
    <td class="ttitle"><textarea name="content" rows="10" cols="20"></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="등록" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">
</div>
</form>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>