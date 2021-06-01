<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼에서 요청한 데이터 받기
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>아이디 : <%= id %></h3>
	<h3>패스워드 : <%= pass %></h3>
</body>
</html>