
<%@page import="member.PassCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]--> 
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

 function passCheck(val){

 if(val.length <3){

 document.getElementById('result').value = "A";

 document.getElementById('result').style.color="red";

 }else if(val.length<8){

 document.getElementById('result').value = "B";

 document.getElementById('result').style.color="orange";

 }else {

 document.getElementById('result').value = "C";

 document.getElementById('result').style.color="green";

 }

}

 function check(){
	 
	 if(document.fr.id.value ==""){
		 alert("아이디를 입력하세요!");
		 document.fr.id.focus();
		 return false;
	 }
	 if(document.fr.pass.value==""){
		 alert("비밀번호를 입력하세요");
		 document.fr.id.focus();
		  return false;
	 }
 	 if(document.fr.pass.value.length<4){
 		 alert("비밀번호는 4자 이상으로 설정하세요!")
 		 document.fr.pass.focus();
 		 return false;		 
 	 }
		
 	if(document.fr.passChecked.value != "yes"){
		var fpass = document.fr.pass.value;
	
		window.open("passCheckPro.jsp?fpass="+fpass,"","width=400,height=200");
	
	return false;
	
 	}
	 if(document.fr.pass2.value.length==""){
		 alert("비밀번호 확인란을 입력하세요!")
		 document.fr.pass2.focus();
		 return false;		 
	 }
	 if(document.fr.pass.value != document.fr.pass2.value){
		 alert("비밀번호가 일치되지 않습니다.");
		 document.fr.pass2.focus();
		 return false;		 
	 }
	 	
	 if(document.fr.name.value.length==""){
		 alert("이름을 입력하세요!")
		 document.fr.name.focus();
		 return false;		 
	 }
	 if(document.fr.email.value.length==""){
		 alert("이메일을 입력하세요!")
		 document.fr.email.focus();
		 return false;		 
	 }
	 if(document.fr.email2.value.length==""){
		 alert("이메일 확인란을 입력하세요!")
		 document.fr.email2.focus();
		 return false;		 
	 }
	 
	 
	 if(document.fr.pass.value != document.fr.pass2.value){
		 alert("이메일이  일치되지 않습니다.");
		 document.fr.pass2.focus();
		 return false;		 
	 }
//	 비밀번호유효성체크
	 
	
		
	
	 
	 
	 
	 
	 
	 //비밀번호 유효성체크 끝
 }
 
 
 
 
 function idcheck() {
	// id 텍스트 상자가 비어있으면  "아이디입력" 제어
	

	var fid = encodeURIComponent(document.fr.id.value);
//한글 안깨지는 ie 폼 불러오기
//fid = document.wfr.id.value;
//opener.document.fr.id.value = document.wfr.id.value;
	if(fid==""){
		alert("아이디입력");
		document.fr.id.focus();
		return;
	}
	//  아이디 입력되어있으면 새창열기  "idcheck.jsp"
// 	window.open("파일이름","창이름","옵션");
	window.open("idcheck.jsp?fid="+fid,"","width=400,height=200");
}
 </script>
 <%
request.setCharacterEncoding("utf-8");
%>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>


<form action="joinPro.jsp" id="join" method="post" name="fr" onsubmit="return check()">
<fieldset>

<legend>필수 정보</legend>
<label>*아이디</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup" onclick="idcheck()"><br>
<label>*비밀번호</label>
<input type="text" name="pass"><br>
<label>*비밀번호 확인</label>
<input type="password" name="pass2"><br>
<input type="hidden" name="passChecked" value="no"><br>
<label>*이름</label>
<input type="text" name="name" onkeyup="passCheck(this.value)">
<input type ="text" id="result" readonly style="border:0px;background-color:transparent"><br>
<label>*이메일</label>
<input type="email" name="email"><br>
<label>*이메일확인</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>
<legend>부가정보</legend>
<label>우편번호</label>
<input type="text" name="postcode" id="postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<label>주소</label>
<input type="text" name="address" id="address" placeholder="주소" size ="46"><br>
<label>상세주소</label>
<input type="text" name="detailaddress" id="detailaddress" placeholder="상세주소">
<input type="text" name ="extraaddress" id="extraaddress" placeholder="참고항목"><br>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraaddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraaddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>








<label>전화번호</label>
<input type="text" name="phone"><br>
<label>핸드폰 번호</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>