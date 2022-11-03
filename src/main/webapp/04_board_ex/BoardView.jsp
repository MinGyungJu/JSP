<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_ex.service.*, board_ex.model.*" %>
<%
	// 게시글번호 넘겨받아
	String seq = request.getParameter("seq");
	// 서비스의 함수를 호출하여 해당 BoardVO를 넘겨받는다.
	ViewArticleService service = 
						ViewArticleService.getInstance();
	BoardVO vo = service.getArticleById(seq);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 게시글 보기 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

	<h4 class="container-sm"> 게시판 글 보기 </h4><br/>
	<table width = "500px" height = "500px">
	<tr>
		<td class="form-control"> 제  목 : </td>
		<td><%= vo.getTitle() %></td>
	</tr>
	<tr>
		<td class="form-control"> 작성자 : </td>
		<td><%= vo.getWriter() %></td>
	</tr>
	<tr>
		<td class="form-control"> 작성일자 : </td>
		<td><%= vo.getRegdate() %></td>
	</tr>
	<tr>
		<td class="form-control"> 내  용 : </td>
		<td><%= vo.getContent() %></td>
	</tr>
	<tr>
		<td class="form-control"> 조회수 : </td>
		<td><%= vo.getCnt() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a class="btn btn-success" href="BoardList.jsp"> 목록보기 </a>
			<a class="btn btn-success" href="BoardModifyForm.jsp?seq=<%=seq%>"> 수정하기 </a>
			<a class="btn btn-success" href="BoardDeleteForm.jsp?seq=<%=seq%>"> 삭제하기 </a>		
		</td>
	</tr>
	</table>


</body>
</html>