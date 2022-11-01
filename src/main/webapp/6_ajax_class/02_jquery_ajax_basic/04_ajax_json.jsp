<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
$(function(){
	var param = {cate : 'book1', name : 'hong1'};
	
	$.ajax({
		type : 'get',
		data : param,
		url : "04_server.jsp",
		dataType : 'text', //지금은 text 나중에는 json
		success : parseData
	})
	
	function parseData(result){
		//***************************
		// 추후에 json 라이브러리를 이용하여 json 객체 변환
		
		var obj = {};
		obj = eval("("+result+")");			//evaluate : 평가하다 
		$('#cate').val( obj.first );
		$('#name').val( obj.second );
	}
})

	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


