<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 	// 1) 이전 화면에서 사용자 입력값들을 얻어오기   
	//		--하나씩 얻어오는거 = request.getParameter('')
	//		--여러개씩 얻어오는거 = request.getParameterValues('')
	String id = request.getParameter("name");
	String sex = request.getParameter("gender");
	String job = request.getParameter("occupation");
	String[] chimi = request.getParameterValues("hobby");
 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 2) 얻어온 입력값들을 화면에 출력하기 -->
	입력한 아이디 : <%= id %><br/>
	입력한 성별 : <%= sex %><br/>
	입력한 직업 : <%= job %><br/>
	입력한 취미 : <% if(chimi == null){
					out.print(""); 
				}else{
					for(int i =0; i<chimi.length; i++){
						 out.print(chimi[i]); 
			 			}
				}
				 %> 
	
	
	
</body>
</html>