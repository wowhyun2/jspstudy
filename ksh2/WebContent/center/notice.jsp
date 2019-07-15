
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
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
<li><a href="notice.jsp">게시판</a></li>
<li><a href="gallery.jsp">갤러리</a></li>
<li><a href="fileboard.jsp">자료실</a></li>
<li><a href="../mailForm.jsp">메일보내기</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%

BoardDAO bdao = new BoardDAO();
int count = bdao.getBoardCount();

int pageSize= 15; //한페이지 보여줄 글 갯수
String pageNum = request.getParameter("pageNum"); //현페이지넘버

if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);

int startRow = (currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;

List<BoardBean> boardList=null;
if(count!=0){
	boardList=bdao.getBoardList(startRow, pageSize);
}

SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
//화면에 보여지는 글번호 구하기
%>
<!-- 게시판 -->
<article>
<h1>게시판</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%
    if(count!=0){
    	for(int i=0;i<boardList.size();i++){
    		BoardBean bb = boardList.get(i);
%>
    		<tr onclick="location.href='content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>'"><td><%=bb.getNum() %></td><td class="left">	<% 
		
	for(int j=0;j<bb.getIndent();j++){
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(bb.getIndent()!=0){
%>		<img src='../img/reply_icon.gif' />
<%
	}
%> <a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
<%=bb.getSubject() %></a>&nbsp;(ref:<%=bb.getRef() %>)(ind:<%=bb.getIndent() %>)(ste:<%=bb.getStep() %>)</td>
    <td><%=bb.getName() %></td><td><%=sdf.format(bb.getDate())%></td><td><%=bb.getReadcount() %></td></tr>
<%    	
    	}
    }
    
%>
 
</table>
<%
String id = (String)session.getAttribute("id");
if(id!=null){
	%>

<div id="table_search">
<input type="button" value="글쓰기+<%=id %>" class="btn" 
onclick="location.href='writeForm.jsp?id=<%=id%>'">
</div>
<%	
}
%>

<div id="table_search">
<form action="noticeSearch.jsp" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn" >
</form>
</div>
<div class="clear"></div>
<div id="page_control">

<%
if(count!=0){
	// 전체 페이지 수 구하기   
	// 전체글개수 50 한화면에 보여줄 글개수 10 => 전체페이지수 5
	//         50     /      10        => 5  +0=> 5 
	//      51 ~ 59   /      10        => 5  +1=> 6
// 	int pageCount=전체글개수/한화면에 보여줄글개수+(조건?참:거짓);
	int pageCount=count/pageSize+(count%pageSize==0?0:1);
	// 한화면에 보여줄 페이지 개수 설정
	int pageBlock=3;
	// 한화면에 보여줄 시작페이지번호 구하기   -  /  *  +
	//  현페이지 번호 1~10 -> 1   11~20 -> 11
	//  currentPage   pageBlock   => 한화면에 보여줄 시작페이지번호
	//      1 ~ 10       10       => (현-1)/10*10 +1=>0*10 +1 =>0  +1=>1
	//      11 ~ 20      10       => (현-1)/10*10 +1=>1*10 +1 =>10 +1=>11
	//      21 ~ 30      10       => (현-1)/10*10 +1=>2*10 +1 =>20 +1=>21
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;

	// 한화면에 보여줄 끝페이지번호 구하기  + -
	//    startPage      pageBlock => 1 + 10 -1=>10
	//    startPage      pageBlock => 11 + 10 -1=>20
	//    startPage      pageBlock => 21 + 10 -1=>30
	int endPage=startPage+pageBlock-1;	
	if(endPage > pageCount){
		endPage=pageCount;
	}
	
	//[이전]  -10  시작페이지번호   한화면에 보여줄 페이지수 비교
	if(startPage > pageBlock){
		%><a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
	}
    // 1 2 3 4 ...10
    for(int i=startPage;i<=endPage;i++){
    	%><a href="notice.jsp?pageNum=<%=i%>"><%=i%></a><%
    }
    // [다음] +10  끝페이지번호   전체페이지개수 비교
    if(endPage < pageCount){
    	%><a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
    }
}
%>
<!--         1 2 3 4 .....10 [다음] -->
<!--  [이전] 11 12 13 14 15 .... 20 [다음] -->

</div>
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