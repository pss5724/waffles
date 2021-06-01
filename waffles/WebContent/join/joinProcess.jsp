<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼에서 요청한 데이터 받기
	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// 회원가입 체크
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 회원가입 결과 </h1>
	<ul>
		<li> name : <%= name %> </li>
		<li> email : <%= email1 %> @ <%= email2 %> </li>
		<li> id : <%= id %> </li>
		<li> pass : <%= pass %> </li>
	</ul>
</body>
</html>