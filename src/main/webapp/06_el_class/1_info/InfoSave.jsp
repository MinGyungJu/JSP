<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>
<!--  InfoBean info = new InfoBean(); -->
<jsp:useBean id="info" class="Info.InfoBean">
	<jsp:setProperty name="info" property="name" />
  <jsp:setProperty name="info" property="id" />
</jsp:useBean>

<!DOCTYPE html>
<HTML>
<HEAD><TITLE> 자료 출력 </TITLE></HEAD>
<BODY>
	<!-- 	JSP 기초문법의 표현식 -->
	<%=info.getName() %>
	<!-- 	action 태그의 출력문법 -->
	<jsp:getProperty property="name" name = "info"/>
	<!--  화면출력할 떄 변수를 활용 : 표현언어(EL : Expression Language) -->
	
	<hr/>
	<H2>  당신의 신상명세서 확인 </H2>
	이   름  : ${info.name }<br/>
	주민번호 :  ${info.id }<br/>
	성  별   :  ${info.gender }<br/>  
	맞습니까????
</BODY>
</HTML>