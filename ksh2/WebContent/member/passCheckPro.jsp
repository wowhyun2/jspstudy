<%@page import="member.PassCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function passok() {
		//join.jsp페이지 id.value= idcheck.jsp페이지 fid.value
		// window 내장객체  멤버변수 opener == join.jsp  창을 open() 한 페이지 
		opener.document.fr.pass.value = document.wfr.fpass.value;
		opener.document.fr.passChecked.value = "yes";
		//창닫기
		window.close();
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		// member/idcheck.jsp
		// String id = fid 파라미터 가져와서 변수에 저장
		//String cpass ="아직 값이 안왔습니다."; 
		String cpass = request.getParameter("fpass");
		
if(cpass == ""){
out.println("값이 안온다 문제다");
}

		// MemberDAO mdao 객체생성
		PassCheck pc = new PassCheck();

		int cResult = 0;
		cResult = pc.pass_check(cpass);
		//out.println(cResult);
		// check==1   "아이디중복" 
		// check==0   "아이디사용가능"
		if (cResult == 0) {
			out.println("안전도 [낮음]: " + '\n');
			out.println("영문자, 숫자, 특수문자 중 두 가지 이상 조합 필수!");
		} else if (cResult == 2) {
			out.println("안전도 [보통]: ");
			out.println("영문자, 숫자, 특수문자만 포함하여 8자리 이상 필수!");
		} else if (cResult == 1) {
			out.println("안전도 [높음]: ");
			out.println("적합한 비밀번호입니다!");
	%>
	<input type="button" value="비번 사용" onclick="passok()">
	<%
		} else {
			out.println("유효성 판단 오류 확인필요합니다.");
		}
	%>
	<script type="text/javascript">
		//cpass = document.wfr.fpass.value;
	</script>

	<form action="passCheckPro.jsp" name="wfr" method="get">
		비밀번호:<input type="text" name="fpass" value=<%=cpass %>> 
		<input type="submit" value="비번 유효성 확인">
	</form>
</body>
</html>





