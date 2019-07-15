<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	
	request.setCharacterEncoding("utf-8");

	
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	

// int num=105;
// String name = "김리플";
// String pass = "1111";
// String subject ="제목";
// String content = "내용";
	
BoardDAO bdao = new BoardDAO();
BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
//bb.setRef(num);
bdao.insertBoardReply(bb);


%>
  <script language=javascript>
   self.window.alert("답글 저장완료 되었다.");
   location.href="notice.jsp";
  </script>


