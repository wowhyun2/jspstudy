<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>member/deletePro.jsp</h1>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
//id, pass, name 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//MemberBean mb 객체생성
//mb변수에 <- 파라미터 값 저장
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
//MemberDAO 객체 생성
MemberDAO mdao=new MemberDAO();
// 리턴값 저장변수  = userCheck(함수처리할때 필요한 id,pass 가져가기)
int check=mdao.userCheck(id, pass);
//  리턴값이 1 이면 아이디 비밀번호 일치  
//              삭제작업 deleteMember(mb) 메서드호출
//              세션값 초기화
//               main.jsp 이동
//  리턴값이 0 이면 비밀번호틀림 뒤로이동
//  리턴값이 -1 이면 아이디없음 뒤로이동
if(check==1){
	mdao.deleteMember(mb);
	session.invalidate();
	response.sendRedirect("login.jsp");
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("id없음");
		history.back();
	</script>
	<%
}
%>
</body>
</html>