<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<script language = "javascript">  // 자바 스크립트 시작

function replyCheck()
  {
   var form = document.replyform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>
 
 <%
 request.setCharacterEncoding("utf-8");
 	int num = Integer.parseInt(request.getParameter("num"));

 	BoardDAO bdao = new BoardDAO();
 	BoardBean bb = new BoardBean();
 	
 	bb =bdao.getBoard(num);
 
 
%>

<%
String id = (String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
// 세션값 없으면 login.jsp 이동
%>


<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
<%-- <form action="reply_ok.jsp?num=<%=bb.getNum()%>" name="replyform" method="post" > --%>
<form action="reply_ok.jsp?num=<%=bb.getNum()%>" name="replyform" method="post" >
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>답글</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="subject" size="50" maxlength="100" value = "<%=bb.getSubject()%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50" value = "<%=id%>"readonly></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="pass" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="content" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
<!--       <td colspan="2"><input type="button" value="등록"  OnClick="javascript:replyCheck();"> -->
<td colspan="2"><input type="submit" value="등록"  >
       <input type="button" value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 
 </form>
 </table>
</body> 




</html>


