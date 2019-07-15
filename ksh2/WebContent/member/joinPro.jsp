<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>member/joinPro.jsp</h1>
<%
//회원가입
// request 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터  id pass name email address  phone  mobile 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
String postcode = request.getParameter("postcode");
String address=request.getParameter("address");
String detailaddress = request.getParameter("detailaddress");
String extraaddress = request.getParameter("extraaddress");
String resulty = request.getParameter("resulty");
String resultx = request.getParameter("resultx");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());
// 패키지 member 파일이름 MemberBean 
MemberBean mb=new MemberBean();
// id pass name reg_date email address  phone  mobile
//  MemberBean  mb 객체생성
//  mb 멤버변수 <= 파라미터 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);
mb.setEmail(email);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setPostcode(postcode);
mb.setAddress(address);
mb.setDetailaddress(detailaddress);
mb.setExtraaddress(extraaddress);
mb.setResulty(resulty);
mb.setResultx(resultx);


// 패키지 member 파일이름 MemberDAO
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
//  insertMember(mb) 메서드호출
mdao.insertMember(mb);
// login.jsp 이동
response.sendRedirect("login.jsp");
%>
</body>
</html>





