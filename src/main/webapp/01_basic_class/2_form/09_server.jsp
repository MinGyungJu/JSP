<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %> 
<%
	//1. 이전 폼의 사용자 입력값을 얻어오기
 	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String deptno = request.getParameter("deptno");
	String job = request.getParameter("job");
	String sal = request.getParameter("sal");
	
	//2. EmpVO 멤버변수에 지정
	EmpVO vo = new EmpVO(Integer.parseInt(empno), ename, Integer.parseInt(deptno), job, Integer.parseInt(sal));
	
	//3. DB에 입력
	EmpDAO dao = EmpDAO.getInstance();
	dao.insert(vo);
 
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.<br/>
	 <%= empno %><br/>
	 <%= ename %><br/>
	 <%= deptno %><br/>
	 <%= job %><br/>
	 <%= sal %><br/>
	 
</body>
</html>