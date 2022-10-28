<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     
<%@ page import = "member.dao.*" %> 
<% 
//0. 한글처리 (post로 할시에 한글이 꺠짐)
request.setCharacterEncoding("utf-8");
// 1. 이전 폼의 입력값 얻어오기
String realname = request.getParameter("realname");
String nickname = request.getParameter("nickname");
String myemail = request.getParameter("myemail");
String myage = request.getParameter("myage");

// 2. VO객체에 저장하기
MemberVO vo = new MemberVO(realname, nickname, myemail, Integer.parseInt(myage));
// 3. DB에 입력하기 
MemberDAO dao = MemberDAO.getInstance();
dao.insert(vo);

// 4. 출력은 알아서
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% out.print(vo.getRealname()); 
out.print(vo.getNickname());
out.print(vo.getMyemail());
out.print(vo.getMyage());%>

</body>
</html>