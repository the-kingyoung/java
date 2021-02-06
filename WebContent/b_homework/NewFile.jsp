<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<%request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
	
	var answer = function(){
	      var number = prompt("소숫점 숫자를 입력해주세요.","0.00");
	      var cnt = prompt("소수점자리수를 입력해주세요.?","1");
	      document.querySelector("div").innerHTML += "<h4>소수 : "+number.toFixed(cnt)+"</h4>";
	}
</script>
</head>

<body>
<div></div>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>