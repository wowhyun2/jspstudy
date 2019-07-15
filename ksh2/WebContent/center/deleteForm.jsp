<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
//String uploadPath =request.getRealPath("/upload");
//System.out.println("업로드 폴더 경로"+ uploadPath);
//int maxSize = 5*1024*1024; // 5M
//MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());


int num=Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

%>
<h1>center/deleteForm.jsp</h1>
<h2>게시판 글삭제</h2>
<form action="deletePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type ="hidden" name="pageNum" value="<%=pageNum%>" >
<table border="1">
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><input type="submit" value="글삭제"></td></tr>
</table>
</form>
</body>
</html>