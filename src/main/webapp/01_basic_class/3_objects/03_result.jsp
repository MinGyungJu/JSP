<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_result.jsp</title>
</head>
<body>

<!--  이전 화면에서 사용자 입력값을 얻어와서 
	- request.getParameter("");
	- request.getParameterValues("");
화면 출력 -->
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String[] animal = request.getParameterValues("pet");
	String choosePet = "";
	for(int i = 0; animal!=null&& i<animal.length; i++){
		choosePet += animal[i];
	}
	%>
	입력한 이름 : <%= name %><br/>
	입력한 동물 : <%= choosePet %>


</body>
</html>