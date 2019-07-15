<%@page import="board.BoardDAO"%>
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
<h1>center/deletePro.jsp</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
//id, pass, name 파라미터 가져와서 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
String pageNum = request.getParameter("pageNum");



BoardDAO bdao = new BoardDAO();
int check =bdao.numCheck(num, pass);


if(check==1){
	bdao.deleteBoard(num);
	response.sendRedirect("notice.jsp?pageNum="+pageNum);

}else if(check==0){
	%>
	<script>
	alert("비밀번호가 틀립니다");
	history.back();
	</script>
	<%
}else{
	%>
	<script>
	alert("글이 없거나 오류입니다");
	history.back();
	</script>
	<%
	
}







%>
</body>
</html>