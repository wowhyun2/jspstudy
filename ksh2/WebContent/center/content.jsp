<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
String id = (String)session.getAttribute("id");
int num =  Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
if(id==null){
	//response.sendRedirect("../member/login.jsp");
}
// 세션값 없으면 login.jsp 이동
BoardBean bb = new BoardBean();
BoardDAO bdao = new BoardDAO();
bb =bdao.getBoard(num);
String content =bb.getContent();
if(content != null){
	content =content.replace("\r\n", "<br>");
}


%>

<%
// num 파라미터 가져오기

//BoardDAO bdao 객체생성

// 조회수 증가
// updateReadcount(num)
bdao.updateReadcount(num);

%>

<!-- 게시판 -->
<article>
<h1>Notice content</h1>
<form action="writePro.jsp" method="post" name ="fr" enctype="multipart/form-data">
<table id="notice">
<tr><td class="twrite">글번호</td>
   <td class="ttitle"><input type="text" name="num" value="<%=bb.getNum() %>" readonly></td></tr>
<tr><td class="twrite">조회수</td>
   <td class="ttitle"><input type="text" name="readcount" value="<%=bb.getReadcount() %>" readonly></td></tr>
<tr><td class="twrite">글쓴이</td>
   <td class="ttitle"><input type="text" name="name" value="<%=bb.getName()%>" readonly></td></tr>
<tr><td class="twrite">제목</td>
    <td class="ttitle"><input type="text" name="subject" value="<%=bb.getSubject()%>" readonly></td></tr>
<%if(bb.getFile()!=null){ %>
<tr><td class="twrite">첨부파일</td>
	<td class="ttitle"><a href="../upload/<%=bb.getFile()%>"><img src ="../upload/<%=bb.getFile()%>" width="500" height ="300"></a><br>
<%= bb.getFile() %>&nbsp;&nbsp; <button type=button onclick="location.href='file_down.jsp?file_name=<%=bb.getFile()%>'" >다운로드</button></td></tr>
<%} %>
<tr><td class="twrite">글내용</td>
    <td class="ttitle"><textarea name="content" rows="10" cols="20"><%=bb.getContent() %></textarea></td></tr>
</table>
<div id="table_search">
<%
id =(String)session.getAttribute("id");
if(id!=null){
	if(id.equals(bb.getName())){
		%>
<input type="button" value="글수정" 
    onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="글삭제" 
    onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<%
	}
}
%>

<input type="button" value="답글달기" 
    onclick="location.href='reply.jsp?pageNum=<%=pageNum%>&num=<%=num%>'">

<input type="button" value="글목록" 
    onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
<div class="clear"></div>
<div id="page_control">


<%

int count = bdao.getBoardCount();

int pageSize= 15; //한페이지 보여줄 글 갯수


if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);

int startRow = (currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;



SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
//화면에 보여지는 글번호 구하기
%>


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
</form>
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