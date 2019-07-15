<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 없으면  login | join
// 세션값이 있으면  kim님 | logout
if(id==null){
	%><div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div><%
}else{
	%><div id="login"><%=id %>님 | <a href="../member/updatemember.jsp">회원수정 | </a><a href="../member/deletemember.jsp">회원삭제</a>   | <a href="../member/logout.jsp">logout</a></div><%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/logo.gif" width="265" height="265" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">홈</a></li>
	<li><a href="../center/notice.jsp">게시판</a></li>
	<li><a href="../center/gallery.jsp">갤러리</a></li>
	<li><a href="../center/fileboard.jsp">자료실</a></li>
	<li><a href="../company/welcome.jsp">회원들주소</a></li>
</ul>
</nav>
</header>