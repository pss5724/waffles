<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="회원가입" />
	<jsp:param name="sublabel" value=" Home > 회원가입 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_joinsuccess">
		<section class = "join_success" style="margin:100px 0;">
			<img src = "../images/setup/step1.PNG">
			<h1 class = "title_join_success"> 회원가입 성공!! </h1>
			<h3> 회원가입에 성공하셨습니다. </h3>
			<a href = "../login/login.jsp"><button type = "button" class = "btn_joinsuccess">로그인하기</button></a>
		</section>
		
	</div>

	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>