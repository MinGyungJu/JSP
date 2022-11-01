<%@page import="member.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<% 
   String id = request.getParameter("id");
   String pw = request.getParameter("password");
   String name = request.getParameter("name");
   String tel = request.getParameter("tel");
   String addr = request.getParameter("addr");
%>

<jsp:useBean id="member" class="member.beans.Member">
   <jsp:setProperty name="member" property="id" param="id"/>
   <jsp:setProperty name="member" property="password" param="pw"/>
   <jsp:setProperty name="member" property="name" param="name"/>
   <jsp:setProperty name="member" property="tel" param="tel"/>
   <jsp:setProperty name="member" property="addr" param="addr"/>
</jsp:useBean>

<%
   MemberDao dao = MemberDao.getInstance();
   dao.insertMember(member);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
아이디 : <%= member.getId() %><br/>
비밀번호 : <%= member.getPassword() %><br/>
이름 : <%= member.getName() %><br/>
전화번호 : <%= member.getTel() %><br/>
주소 : <%= member.getAddr() %><br/>
</body>
</html>