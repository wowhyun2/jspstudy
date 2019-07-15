<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//세션값 가져와서 변수에 저장
String id=(String)session.getAttribute("id");
%>
<h1>member/deleteForm.jsp</h1>
<h1>회원삭제</h1>
<form action="deletememberPro.jsp" method="post" name="fr">
아이디:<input type="text" name="id" value="<%=id %>" readonly><br>
비밀번호:<input type="password" name="pass"><br>
<input type="submit" value="회원삭제">
</form>
</body>
</html>
